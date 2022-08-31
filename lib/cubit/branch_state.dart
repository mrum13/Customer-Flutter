part of 'branch_cubit.dart';

abstract class BranchState extends Equatable {
  const BranchState();

  @override
  List<Object> get props => [];
}

class BranchInitial extends BranchState {}

class GetBranchDataLoading extends BranchState {}

class GetBranchDataSuccess extends BranchState {
  final List<BranchData> branchModel;

  GetBranchDataSuccess(
    this.branchModel,
  );

  @override
  // TODO: implement props
  List<Object> get props => [BranchModel];
}

class GetBranchDataFailed extends BranchState {
  final String error;

  GetBranchDataFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
