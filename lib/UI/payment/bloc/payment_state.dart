part of 'payment_bloc.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class OrdersHaveToPayState extends PaymentState {
  final DueOrders dueOrdersModel;

  OrdersHaveToPayState(this.dueOrdersModel);
}

class Loading extends PaymentState {}

class Error extends PaymentState {
  final String error;
  Error(this.error);
}
