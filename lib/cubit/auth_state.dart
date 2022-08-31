part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class GetOtpLoading extends AuthState {}

class GetOtpSuccess extends AuthState {
  final OtpModel otpModel;

  GetOtpSuccess(
    this.otpModel,
  );

  @override
  // TODO: implement props
  List<Object> get props => [otpModel];
}

class GetOtpFailed extends AuthState {
  final String error;

  GetOtpFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

class RegistUserLoading extends AuthState {}

class RegistUserSuccess extends AuthState {
  final UserRegisterModel userRegisterModel;

  RegistUserSuccess(
    this.userRegisterModel,
  );

  @override
  // TODO: implement props
  List<Object> get props => [RegistUserSuccess];
}

class RegistUserFailed extends AuthState {
  final String error;

  RegistUserFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

class LoginUserLoading extends AuthState {}

class LoginUserSuccess extends AuthState {
  final UserLoginModel userLoginModel;

  LoginUserSuccess(
    this.userLoginModel,
  );

  @override
  // TODO: implement props
  List<Object> get props => [UserLoginModel];
}

class LoginUserFailed extends AuthState {
  final String error;

  LoginUserFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
