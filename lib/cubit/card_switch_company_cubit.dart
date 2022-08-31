import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class CardSwitchPerusahaanCubit extends Cubit<int> {
  CardSwitchPerusahaanCubit() : super(0);

  void setCardIndex(int indexCard) {
    emit(indexCard);
  }
}
