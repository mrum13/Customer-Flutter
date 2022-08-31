part of 'button_volume_selected_cubit.dart';

abstract class ButtonVolumeSelectedState extends Equatable {
  const ButtonVolumeSelectedState();

  @override
  List<Object> get props => [];
}

class ButtonVolumeSelectedInitial extends ButtonVolumeSelectedState {}

class ButtonVolumeSelectedSuccess extends ButtonVolumeSelectedState {
  int index;
  String volume;

  ButtonVolumeSelectedSuccess(this.index, this.volume);

  @override
  // TODO: implement props
  List<Object> get props => [index, volume];
}

class ButtonVolumeLainnyaSelected extends ButtonVolumeSelectedState {}
