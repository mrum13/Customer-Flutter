part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class GetHomeDataLoading extends HomeState {}

class GetHomeDataSuccess extends HomeState {
  final HomeModel homeModel;

  GetHomeDataSuccess(
    this.homeModel,
  );

  @override
  // TODO: implement props
  List<Object> get props => [HomeModel];
}

class GetHomeDataFailed extends HomeState {
  final String error;

  GetHomeDataFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
