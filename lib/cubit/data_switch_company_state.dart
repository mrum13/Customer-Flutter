part of 'data_company_switch_cubit.dart';

abstract class DataCompanySwitchState extends Equatable {
  const DataCompanySwitchState();

  @override
  List<Object> get props => [];
}

class DataCompanySwitchInitial extends DataCompanySwitchState {}

class DataCompanySwitchLoading extends DataCompanySwitchState {}

class DataCompanySwitchSuccess extends DataCompanySwitchState {
  final List<CompanyData> listCompanyModel;

  DataCompanySwitchSuccess(
    this.listCompanyModel,
  );

  @override
  // TODO: implement props
  List<Object> get props => [CompanyData];
}

class DataCompanySwitchFailed extends DataCompanySwitchState {
  final String error;

  DataCompanySwitchFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

class AddDataCompanyLoading extends DataCompanySwitchState {}

class AddDataCompanySuccess extends DataCompanySwitchState {
  final AddCompanyModel addCompanyModel;

  AddDataCompanySuccess(
    this.addCompanyModel,
  );

  @override
  // TODO: implement props
  List<Object> get props => [AddCompanyModel];
}

class AddDataCompanyFailed extends DataCompanySwitchState {
  final String error;

  AddDataCompanyFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
