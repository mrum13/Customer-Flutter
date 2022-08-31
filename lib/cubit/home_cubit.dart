import 'package:ats_customer/models/branch_model.dart';
import 'package:ats_customer/models/home_model.dart';
import 'package:ats_customer/services/home_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void getHomeData() async {
    try {
      emit(GetHomeDataLoading());

      HomeModel homeModel = await HomeServices().getHomeData();

      emit(GetHomeDataSuccess(homeModel));
    } catch (e) {
      emit(GetHomeDataFailed(e.toString()));
    }
  }
}
