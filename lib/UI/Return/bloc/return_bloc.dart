import 'dart:async';

import 'package:admin/Data/Repository/IRepository.dart';
import 'package:admin/models/GetAllReturn.dart';

import 'package:admin/models/ReturnProcessModel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:admin/injection.dart';
part 'return_event.dart';
part 'return_state.dart';

class ReturnBloc extends Bloc<ReturnEvent, ReturnState> {
  ReturnBloc() : super(ReturnInitial());
  var repo = sl.get<IRepository>();
  ReturnProcessModel returnProcessModel;
  @override
  Stream<ReturnState> mapEventToState(
    ReturnEvent event,
  ) async* {
    if (event is GetReturnProductsEvent) {
      yield Loading();
      try {
        var response = await repo.iHttpHlper.getrequest(
            "http://176.31.225.174:8080/autoparts/order/getreturnproducttodos?status=${event.status}&name=${event.name}&phone=${event.number}&fromDate=${event.date1}&toDate=${event.date2}&page=${event.page}&size=${event.ssize}");
        GetAllReturn getAllReturn = getAllReturnFromJson(response);
        print(getAllReturn.content.length);
        yield GetReturnProductsState(getAllReturn);
      } catch (error) {
        yield Error(error);
      }
    }
    if (event is TalkeToVendorEvent) {
      yield Loading();
      try {
        var response = await repo.iHttpHlper.postrequest(
            "http://176.31.225.174:8080/autoparts/order/processreturnproduct?todo=${event.todoid}");
        returnProcessModel = vendorAcceptDiscountFromJson(response);
        yield TalkeToVendorState(returnProcessModel);
      } catch (error) {
        yield Error(error.toString());
      }
    }
    if (event is VendorAcceptDiscountEvent) {
      yield Loading();
      try {
        var response = await repo.iHttpHlper.postrequest(
            "ttp://176.31.225.174:8080/autoparts/order/processreturnproduct?todo=${event.todoid}&vendorGaveDiscount=${event.isdiscountaccepted}&discount=${event.discount}");
        returnProcessModel = vendorAcceptDiscountFromJson(response);
        yield VendorAcceptDiscountState(returnProcessModel);
      } catch (error) {
        yield Error(error);
      }
    }
    if (event is VendorNotAcceptDiscountEvent) {
      yield Loading();
      try {
        var response = await repo.iHttpHlper.postrequest(
            "ttp://176.31.225.174:8080/autoparts/order/processreturnproduct?todo=${event.todoid}&vendorGaveDiscount=${event.isdiscountaccepted}");
        returnProcessModel = vendorAcceptDiscountFromJson(response);
        yield VendorNotAcceptDiscountState(returnProcessModel);
      } catch (error) {
        yield Error(error);
      }
    }
    if (event is IsCustomerAcceptDiscountEvent) {
      yield Loading();
      try {
        var response = await repo.iHttpHlper.postrequest(
            "ttp://176.31.225.174:8080/autoparts/order/processreturnproduct?todo=${event.todoid}&customerAcceptedDiscount=${event.accepted}");
        returnProcessModel = vendorAcceptDiscountFromJson(response);
        yield IsCustomerAcceptDiscountState(returnProcessModel);
      } catch (error) {
        yield Error(error);
      }
    }
    if (event is AutopartCheckTheProductEvent) {
      yield Loading();
      try {
        var response = await repo.iHttpHlper.postrequest(
            "ttp://176.31.225.174:8080/autoparts/order/processreturnproduct?todo=${event.todoid}");
        returnProcessModel = vendorAcceptDiscountFromJson(response);
        yield AutopartCheckTheProductState(returnProcessModel);
      } catch (error) {
        yield Error(error);
      }
    }

    if (event is IsproductReturnedEvent) {
      yield Loading();
      try {
        var response = await repo.iHttpHlper.postrequest(
            "ttp://176.31.225.174:8080/autoparts/order/processreturnproduct?todo=${event.todoid}&productIsReturned=${event.isproductreturned}&transportCosts=${event.transcost}");
        returnProcessModel = vendorAcceptDiscountFromJson(response);
        yield IsproductReturnedState(returnProcessModel);
      } catch (error) {
        yield Error(error);
      }
    }
    if (event is InformTransportCompanyEvent) {
      yield Loading();
      try {
        var response = await repo.iHttpHlper.postrequest(
            "ttp://176.31.225.174:8080/autoparts/order/processreturnproduct?todo=${event.todoid}");
        returnProcessModel = vendorAcceptDiscountFromJson(response);
        yield InformTransportCompanyState(returnProcessModel);
      } catch (error) {
        yield Error(error);
      }
    }
    if (event is AddNotForTodoEvent) {
      yield Loading();
      try {
        var response = await repo.iHttpHlper.postrequest(
            "ttp://176.31.225.174:8080/autoparts/order/addreturnproductnote?admin=${event.admin}&todo=${event.todoid}&note=${event.note}");
        returnProcessModel = vendorAcceptDiscountFromJson(response);
        yield AddNotForTodoState(returnProcessModel);
      } catch (error) {
        yield Error(error);
      }
    }
  }
}
