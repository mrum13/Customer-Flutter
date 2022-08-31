import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class UserTypeCubit extends Cubit<int> {
  UserTypeCubit() : super(0);

  void setType(int type) {
    emit(type);
  }
}
