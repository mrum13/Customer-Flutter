import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// part 'tab_inbox_state.dart';

class TabInboxCubit extends Cubit<int> {
  TabInboxCubit() : super(0);

  void setIndex(int index) {
    emit(index);
  }
}
