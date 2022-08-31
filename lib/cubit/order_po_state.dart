part of 'order_po_cubit.dart';

abstract class OrderPoState extends Equatable {
  const OrderPoState();

  @override
  List<Object> get props => [];
}

class OrderPoInitial extends OrderPoState {}

class OrderPoLoading extends OrderPoState {}

class OrderPoSuccess extends OrderPoState {
  final String message;

  OrderPoSuccess(
    this.message,
  );

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class OrderPoFailed extends OrderPoState {
  final String error;

  OrderPoFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
