import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class NavbarCubit extends Cubit<int> {
  NavbarCubit() : super(0);

  void setPage(int newPage) {
    emit(newPage);
  }
}
