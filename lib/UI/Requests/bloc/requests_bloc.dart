import 'dart:async';

import 'package:admin/Data/Repository/IRepository.dart';
import 'package:admin/models/Brands.dart';
import 'package:admin/models/Cars.dart';
import 'package:admin/models/Quotation.dart';
import 'package:admin/models/Quotationoffers.dart';
import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../injection.dart';

part 'requests_event.dart';
part 'requests_state.dart';

class RequestsBloc extends Bloc<RequestsEvent, RequestsState> {
  RequestsBloc() : super(RequestsInitial());
  var repo = sl.get<IRepository>();
  var brands;
  var cars;
  var quotations;
  bool firsttime = true;
  Quotation searchedquotation;
  String searchmobile;
  String searchstatus;
  String searchbrand;
  String searchcar;
  var offers;
  List<Offers> pagenoffers = [];
  List<QuotationsRequests> pagenquotation = [];
  List<QuotationsRequests> pagenserachquotation = [];
  @override
  Stream<RequestsState> mapEventToState(
    RequestsEvent event,
  ) async* {
    if (event is BrandsEvent) {
      try {
        brands = await repo.iHttpHlper.getrequest('/brand/listall');
        var allbrands = brandsFromJson(brands);
        yield BrandsState(allbrands);
      } catch (error) {
        yield Error(error.toString());
      }
    }

    if (event is CarsEvent) {
      try {
        cars = await repo.iHttpHlper
            .getrequest('/car/getbybrand?brand=${event.brandid}');
        var allcars = carsFromJson(cars);
        yield CarState(allcars);
      } catch (error) {
        yield Error(error.toString());
      }
    }
    if (event is GetQuotationEvent) {
      try {
        quotations = await repo.iHttpHlper.getrequest(
            '/requestforquotation/getrequestsforoffers?page=${event.page}&size=${event.size}&customer=${event.customermobile}&brand=${event.brand}&car=${event.car}&status=${event.status}');
        var quotartion = quotationFromJson(quotations);
        pagenquotation.addAll(quotartion.content);
        yield GetQuotationState(pagenquotation);
      } catch (error) {
        yield Error(error.toString());
      }
    }
    if (event is SearchQuotationEvent) {
      try {
        quotations = await repo.iHttpHlper.getrequest(
            '/requestforquotation/getrequestsforoffers?page=${event.page}&size=${event.size}&customer=${event.customermobile}&brand=${event.brand}&car=${event.car}&status=${event.status}');
        searchedquotation = quotationFromJson(quotations);
      } catch (error) {
        yield Error(error.toString());
      }
      if (firsttime) {
        searchbrand = event.brand;
        searchmobile = event.customermobile;
        searchstatus = event.status;
        searchcar = event.car;
        firsttime = false;
      }

      if (samesearch(
          event.status, event.customermobile, event.brand, event.car)) {
        pagenserachquotation.addAll(searchedquotation.content);

        yield SerachQuotationState(pagenserachquotation);
      } else {
        pagenserachquotation = [];
        yield SerachQuotationState(searchedquotation.content);
      }
    }

    if (event is GetoffersForQuotationEvent) {
      try {
        quotations = await repo.iHttpHlper.getrequest(
            '/requestforquotation/getrequestoffers?page=${event.page}&size=${event.size}&requestForQuotation=${event.quotationid}&vendor=${event.vendorname}&status=${event.status}');
        offers = quotationFromJson(quotations);
        pagenoffers.addAll(offers.content);
        yield GetOffersForQuotationState(pagenoffers);
      } catch (error) {
        yield Error(error.toString());
      }
    }
  }

  bool samesearch(String status, String mobile, String brandid, String carid) {
    if (searchmobile == mobile &&
        searchstatus == status &&
        searchbrand == brandid &&
        searchcar == carid) {
      print(searchstatus);
      print("true form same search");
      return true;
    } else {
      print("diffrent search");
      searchcar = carid;
      searchmobile = mobile;
      searchstatus = status;
      searchbrand = brandid;

      return false;
    }
  }
}
