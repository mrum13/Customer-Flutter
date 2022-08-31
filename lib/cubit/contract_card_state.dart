part of 'contract_card_cubit.dart';

abstract class ContractCardState extends Equatable {
  const ContractCardState();

  @override
  List<Object> get props => [];
}

class ContractCardInitial extends ContractCardState {}

class ContractCardSelected extends ContractCardState {
  final String contractNo;
  final String ampDestination;
  final String remaining;
  final String idContract;

  ContractCardSelected(
      this.contractNo, this.ampDestination, this.remaining, this.idContract);

  @override
  // TODO: implement props
  List<Object> get props => [contractNo, ampDestination, remaining, idContract];
}

class GetContractDataLoading extends ContractCardState {}

class GetContractDataSuccess extends ContractCardState {
  final List<ContractData> contractModel;

  GetContractDataSuccess(
    this.contractModel,
  );

  @override
  // TODO: implement props
  List<Object> get props => [ContractData];
}

class GetContractDataFailed extends ContractCardState {
  final String error;

  GetContractDataFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
