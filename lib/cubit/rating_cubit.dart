import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class RatingCubit extends Cubit<int> {
  RatingCubit() : super(0);

  void setStar(int rating) {
    emit(rating);
  }
}
