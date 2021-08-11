part of 'requests_bloc.dart';

@immutable
abstract class RequestsEvent {}

class BrandsEvent extends RequestsEvent {}

class CarsEvent extends RequestsEvent {
  final brandid;
  CarsEvent(this.brandid);
}

class GetQuotationEvent extends RequestsEvent {
  final int page;
  final int size;
  final String customermobile;
  final String brand;
  final String car;
  final String status;
  GetQuotationEvent(this.brand, this.car, this.customermobile, this.page,
      this.size, this.status);
}

class SearchQuotationEvent extends RequestsEvent {
  final int page;
  final int size;
  final String customermobile;
  final String brand;
  final String car;
  final String status;
  SearchQuotationEvent(this.brand, this.car, this.customermobile, this.page,
      this.size, this.status);
}

class GetoffersForQuotationEvent extends RequestsEvent {
  final int page;
  final int size;
  final quotationid;
  final String vendorname;
  final String status;
  GetoffersForQuotationEvent(
      this.page, this.quotationid, this.size, this.status, this.vendorname);
}
