import 'package:ats_customer/models/user_model.dart';
import 'package:ats_customer/services/get_user_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void getUser({
    required String? id,
  }) async {
    try {
      emit(GetUserLoading());

      UserModel userModel = await GetUserService().getUser(id: id);

      emit(GetUserSuccess(userModel));
    } catch (e) {
      emit(GetUserFailed(e.toString()));
    }
  }
}
