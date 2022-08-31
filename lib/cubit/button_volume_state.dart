part of 'button_volume_cubit.dart';

abstract class ButtonVolumeState extends Equatable {
  const ButtonVolumeState();

  @override
  List<Object> get props => [];
}

class ButtonVolumeInitial extends ButtonVolumeState {}

class GetVolumeDataLoading extends ButtonVolumeState {}

class GetVolumeDataSuccess extends ButtonVolumeState {
  final List<VolumeData> volumeModel;

  GetVolumeDataSuccess(
    this.volumeModel,
  );

  @override
  // TODO: implement props
  List<Object> get props => [VolumeData];
}

class GetVolumeDataFailed extends ButtonVolumeState {
  final String error;

  GetVolumeDataFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
