import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class TimerCubit extends Cubit<int> {
  TimerCubit() : super(30);

  void startTimer() {
    Timer timer;
    int start = 30;

    const oneSec = Duration(seconds: 1);
    // ignore: unnecessary_new
    timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        start - 1;
        emit(state - 1);
        if (state == 0) {
          timer.cancel();
          emit(state);
        }
      },
    );
  }
}
