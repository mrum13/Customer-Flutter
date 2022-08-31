import 'package:ats_customer/models/add_company_model.dart';
import 'package:ats_customer/models/company_switch_model.dart';
import 'package:ats_customer/services/company_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'data_switch_company_state.dart';

class DataCompanySwitchCubit extends Cubit<DataCompanySwitchState> {
  DataCompanySwitchCubit() : super(DataCompanySwitchInitial());

  void getDataCompany() async {
    try {
      emit(DataCompanySwitchLoading());

      List<CompanyData> volumeModel = await CompanyService().getCompanyData();

      emit(DataCompanySwitchSuccess(volumeModel));
    } catch (e) {
      emit(DataCompanySwitchFailed(e.toString()));
    }
  }

  void postDataCompany({required String idCustomer}) async {
    try {
      emit(AddDataCompanyLoading());

      AddCompanyModel addCompanyModel =
          await CompanyService().postCompany(idCustomer: idCustomer);

      emit(AddDataCompanySuccess(addCompanyModel));
    } catch (e) {
      emit(AddDataCompanyFailed(e.toString()));
    }
  }
}
