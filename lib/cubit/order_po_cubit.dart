import 'package:ats_customer/services/order_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_po_state.dart';

class OrderPoCubit extends Cubit<OrderPoState> {
  OrderPoCubit() : super(OrderPoInitial());

  void postPO({
    required String idContract,
    required String idCustomer,
    required String volume,
    required String date,
    required String time,
  }) async {
    try {
      emit(OrderPoLoading());

      String message = await OrderServices().postOrder(
          idContract: idContract,
          idCustomer: idCustomer,
          volume: volume,
          date: date,
          time: time);

      emit(OrderPoSuccess(
        message,
      ));
    } catch (e) {
      emit(OrderPoFailed(e.toString()));
    }
  }
}
