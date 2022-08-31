import 'package:ats_customer/models/branch_model.dart';
import 'package:ats_customer/services/home_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'branch_state.dart';

class BranchCubit extends Cubit<BranchState> {
  BranchCubit() : super(BranchInitial());

  void getBranchData() async {
    try {
      emit(GetBranchDataLoading());

      List<BranchData> branchModel = await HomeServices().getBranchData();

      emit(GetBranchDataSuccess(branchModel));
    } catch (e) {
      emit(GetBranchDataFailed(e.toString()));
    }
  }
}
