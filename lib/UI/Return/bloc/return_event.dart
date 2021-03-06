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

  GetReturnProductsEvent([
    this.date1,
    this.date2,
    this.name,
    this.number,
    this.page,
    this.status,
    this.ssize,
  ]);
}

class SearchEvent extends ReturnEvent {
  final String date1;
  final String date2;
  final String number;
  final String status;
  final String name;
  final int page;
  final int ssize;

  SearchEvent([
    this.date1,
    this.date2,
    this.name,
    this.number,
    this.page,
    this.status,
    this.ssize,
  ]);
}

class TalkeToVendorEvent extends ReturnEvent {
  final int todoid;
  TalkeToVendorEvent(this.todoid);
}

class VendorAcceptDiscountEvent extends ReturnEvent {
  final int todoid;
  final bool isdiscountaccepted;
  final int discount;
  VendorAcceptDiscountEvent(
      [this.discount, this.isdiscountaccepted, this.todoid]);
}

class VendorNotAcceptDiscountEvent extends ReturnEvent {
  final int todoid;
  final bool isdiscountaccepted;

  VendorNotAcceptDiscountEvent([this.isdiscountaccepted, this.todoid]);
}

class IsCustomerAcceptDiscountEvent extends ReturnEvent {
  final int todoid;
  final bool accepted;
  IsCustomerAcceptDiscountEvent(this.accepted, this.todoid);
}

class AutopartCheckTheProductEvent extends ReturnEvent {
  final int todoid;
  AutopartCheckTheProductEvent(this.todoid);
}

class IsproductReturnedEvent extends ReturnEvent {
  final int todoid;
  final bool isproductreturned;
  final int transcost;
  IsproductReturnedEvent([this.isproductreturned, this.todoid, this.transcost]);
}

class InformTransportCompanyEvent extends ReturnEvent {
  final int todoid;

  InformTransportCompanyEvent(this.todoid);
}

class AddNotForTodoEvent extends ReturnEvent {
  final String note;
  final int todoid;
  AddNotForTodoEvent(this.note, this.todoid);
}

class GetReturnProductDetailsEvent extends ReturnEvent {
  final int todoid;
  GetReturnProductDetailsEvent(this.todoid);
}

class CollectEvent extends ReturnEvent {
  final int todoid;
  CollectEvent(this.todoid);
}
