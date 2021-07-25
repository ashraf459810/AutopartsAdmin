part of 'return_bloc.dart';

@immutable
abstract class ReturnEvent {}

class GetReturnProductsEvent extends ReturnEvent {
  final String date1;
  final String date2;
  final String number;
  final String status;
  final String name;
  final int page;
  final int ssize;
  GetReturnProductsEvent(
      [this.date1,
      this.date2,
      this.name,
      this.number,
      this.page,
      this.status,
      this.ssize]);
}
