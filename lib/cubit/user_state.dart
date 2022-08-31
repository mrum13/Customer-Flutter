part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class GetUserLoading extends UserState {}

class GetUserSuccess extends UserState {
  final UserModel userModel;

  GetUserSuccess(
    this.userModel,
  );

  @override
  // TODO: implement props
  List<Object> get props => [userModel];
}

class GetUserFailed extends UserState {
  final String error;

  GetUserFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
