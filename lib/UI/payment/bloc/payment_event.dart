part of 'payment_bloc.dart';

@immutable
abstract class PaymentEvent {}

class OrdersHaveToPayEvent extends PaymentEvent {
  final int page;
  final int size;
  OrdersHaveToPayEvent(this.page, this.size);
}
