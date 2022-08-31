import 'package:ats_customer/models/branch_model.dart';
import 'package:ats_customer/models/contract_model.dart';
import 'package:ats_customer/services/order_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'contract_card_state.dart';

class ContractCardCubit extends Cubit<ContractCardState> {
  ContractCardCubit() : super(ContractCardInitial());

  void selectCardContract({
    required String contractNo,
    required String ampDestination,
    required String remaining,
    required String idContract,
  }) {
    emit(ContractCardSelected(
        contractNo, ampDestination, remaining, idContract));
  }

  void getContractData({required String idCustomer}) async {
    try {
      emit(GetContractDataLoading());

      List<ContractData> contractModel =
          await OrderServices().getContract(id_customer: idCustomer);

      emit(GetContractDataSuccess(contractModel));
    } catch (e) {
      emit(GetContractDataFailed(e.toString()));
    }
  }
}
