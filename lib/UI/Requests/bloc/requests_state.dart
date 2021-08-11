part of 'requests_bloc.dart';

@immutable
abstract class RequestsState {}

class RequestsInitial extends RequestsState {}

class BrandsState extends RequestsState {
  final List<Brands> brands;
  BrandsState(this.brands);
}

class CarState extends RequestsState {
  final List<Cars> cars;
  CarState(this.cars);
}

class GetQuotationState extends RequestsState {
  final List<QuotationsRequests> quotation;
  GetQuotationState(this.quotation);
}

class SerachQuotationState extends RequestsState {
  final List<QuotationsRequests> quotation;
  SerachQuotationState(this.quotation);
}

class Error extends RequestsState {
  final String error;
  Error(this.error);
}

class GetOffersForQuotationState extends RequestsState {
  final List<Offers> offers;
  GetOffersForQuotationState(this.offers);
}
