import 'package:ats_customer/models/volume_model.dart';
import 'package:ats_customer/services/order_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'button_volume_state.dart';

class ButtonVolumeCubit extends Cubit<ButtonVolumeState> {
  ButtonVolumeCubit() : super(ButtonVolumeInitial());

  void getDataVolume() async {
    try {
      emit(GetVolumeDataLoading());

      List<VolumeData> volumeModel = await OrderServices().getVolumeData();

      emit(GetVolumeDataSuccess(volumeModel));
    } catch (e) {
      emit(GetVolumeDataFailed(e.toString()));
    }
  }
}
