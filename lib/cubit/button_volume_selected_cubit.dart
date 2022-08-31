import 'package:ats_customer/shared/shared_prefrences.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'button_volume_selected_state.dart';

class ButtonVolumeSelectedCubit extends Cubit<ButtonVolumeSelectedState> {
  ButtonVolumeSelectedCubit() : super(ButtonVolumeSelectedInitial());

  void setButtonVolume({required String volume, required int index}) {
    emit(ButtonVolumeSelectedSuccess(index, volume));
  }

  void setButtonVolumeLainnya() {
    emit(ButtonVolumeLainnyaSelected());
  }
}
