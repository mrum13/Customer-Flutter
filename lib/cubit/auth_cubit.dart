import 'package:ats_customer/models/otp_model.dart';
import 'package:ats_customer/models/user_login_model.dart';
import 'package:ats_customer/models/user_register_model.dart';
import 'package:ats_customer/services/auth_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void getOTP({
    required String name,
    required String idCustomer,
    required String phone,
    required String password,
  }) async {
    try {
      emit(GetOtpLoading());

      OtpModel otpModel = await AuthService().getOtp(
          phone: phone, name: name, idCustomer: idCustomer, password: password);

      emit(GetOtpSuccess(
        otpModel,
      ));
    } catch (e) {
      emit(GetOtpFailed(e.toString()));
    }
  }

  void registUser({
    required String name,
    required String idCustomer,
    required String phone,
    required String password,
    required String otp,
  }) async {
    try {
      emit(RegistUserLoading());

      print(phone + password);

      UserRegisterModel userRegisterModel = await AuthService().registUser(
          phone: phone,
          name: name,
          idCustomer: idCustomer,
          password: password,
          otp: otp);
      emit(RegistUserSuccess(userRegisterModel));
    } catch (e) {
      emit(RegistUserFailed(e.toString()));
    }
  }

  void loginUser({
    required String phoneNo,
    required String password,
  }) async {
    try {
      emit(LoginUserLoading());

      UserLoginModel userLoginModel =
          await AuthService().loginUser(phoneNo: phoneNo, password: password);

      emit(LoginUserSuccess(userLoginModel));
    } catch (e) {
      emit(LoginUserFailed(e.toString()));
    }
  }
}
