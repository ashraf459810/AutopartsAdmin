import 'dart:async';
import 'dart:developer';

import 'package:admin/Data/Repository/IRepository.dart';
import 'package:admin/models/Addnote.dart';
import 'package:admin/models/GetAllReturn.dart';

import 'package:admin/models/ReturnProcessModel.dart';
import 'package:admin/models/ReturnRequestModel.dart';
import 'package:admin/models/ReturnTodoDetails.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:admin/injection.dart';
part 'return_event.dart';
part 'return_state.dart';

class ReturnBloc extends Bloc<ReturnEvent, ReturnState> {
  ReturnBloc() : super(ReturnInitial());
  var repo = sl.get<IRepository>();
  ReturnDetails returnDetails;

  ReturnRequestModel requestModel;
  ReturnProcessModel returnProcessModel;
  List<Content> requests = [];
  List<Content> serachrequests = [];
  @override
  Stream<ReturnState> mapEventToState(
    ReturnEvent event,
  ) async* {
    if (event is GetReturnProductsEvent) {
      // yield Loading();
      try {
        var response = await repo.iHttpHlper.getrequest(
            "/order/getreturnproducttodos?status=${event.status}&name=${event.name}&phone=${event.number}&fromDate=${event.date1}&toDate=${event.date2}&page=${event.page}&size=${event.ssize}");
        GetAllReturn getAllReturn = getAllReturnFromJson(response);
        if (event.issearch == false) {
          if (getAllReturn.content.isNotEmpty) {
            for (var i = 0; i < getAllReturn.content.length; i++) {
              requests.add(getAllReturn.content[i]);
            }
          }
          yield GetReturnProductsState(getAllReturn, requests);
        } else {
          if (getAllReturn.content.isNotEmpty) {
            for (var i = 0; i < getAllReturn.content.length; i++) {
              serachrequests.add(getAllReturn.content[i]);
            }
          }
          yield GetReturnProductsState(getAllReturn, serachrequests);
        }
      } catch (error) {
        yield Error(error.toString());
      }
    }
    if (event is TalkeToVendorEvent) {
      yield Loading();
      try {
        var response = await repo.iHttpHlper
            .postrequest("/order/processreturnproduct?todo=${event.todoid}");

        requestModel = returnRequestModelFromJson(response);
        yield AllReturnState(requestModel);
      } catch (error) {
        yield Error(error.toString());
      }
    }
    if (event is VendorAcceptDiscountEvent) {
      yield Loading();
      try {
        var response = await repo.iHttpHlper.postrequest(
            "/order/processreturnproduct?todo=${event.todoid}&vendorGaveDiscount=${event.isdiscountaccepted}&discount=${event.discount}");
        requestModel = returnRequestModelFromJson(response);
        yield AllReturnState(requestModel);
      } catch (error) {
        yield Error(error.toString());
      }
    }
    if (event is VendorNotAcceptDiscountEvent) {
      yield Loading();
      try {
        var response = await repo.iHttpHlper.postrequest(
            "/order/processreturnproduct?todo=${event.todoid}&vendorGaveDiscount=${event.isdiscountaccepted}");
        requestModel = returnRequestModelFromJson(response);
        yield AllReturnState(requestModel);
      } catch (error) {
        yield Error(error.toString());
      }
    }
    if (event is IsCustomerAcceptDiscountEvent) {
      yield Loading();
      try {
        var response = await repo.iHttpHlper.postrequest(
            "/order/processreturnproduct?todo=${event.todoid}&customerAcceptedDiscount=${event.accepted}");
        requestModel = returnRequestModelFromJson(response);
        yield AllReturnState(requestModel);
      } catch (error) {
        yield Error(error.toString());
      }
    }
    if (event is AutopartCheckTheProductEvent) {
      yield Loading();
      try {
        var response = await repo.iHttpHlper
            .postrequest("/order/processreturnproduct?todo=${event.todoid}");
        requestModel = returnRequestModelFromJson(response);
        yield AllReturnState(requestModel);
      } catch (error) {
        yield Error(error.toString());
      }
    }

    if (event is IsproductReturnedEvent) {
      yield Loading();
      try {
        var response = await repo.iHttpHlper.postrequest(
            "/order/processreturnproduct?todo=${event.todoid}&productIsReturned=${event.isproductreturned}&transportCosts=${event.transcost}");
        requestModel = returnRequestModelFromJson(response);
        yield AllReturnState(requestModel);
      } catch (error) {
        yield Error(error.toString());
      }
    }
    if (event is InformTransportCompanyEvent) {
      yield Loading();
      try {
        var response = await repo.iHttpHlper
            .postrequest("/order/processreturnproduct?todo=${event.todoid}");
        requestModel = returnRequestModelFromJson(response);
        yield AllReturnState(requestModel);
      } catch (error) {
        yield Error(error.toString());
      }
    }
    if (event is AddNotForTodoEvent) {
      yield Loading();

      try {
        var token = await repo.iprefsHelper.gettoken();
        var response = await repo.iHttpHlper.postrequest(
            "/order/addreturnproductnote?admin=$token&todo=${event.todoid}&note=${event.note}");
        AddNote addNote = addNoteFromJson(response);

        yield AddNotForTodoState(addNote);
      } catch (error) {
        yield Error(error.toString());
      }
    }
    if (event is GetReturnProductDetailsEvent) {
      yield Loading();
      try {
        var response = await repo.iHttpHlper
            .postrequest("/order/getreturnproductdetails?todo=${event.todoid}");
        returnDetails = returnDetailsFromJson(response);
        log("${returnDetails.notes}");
        yield GetReturnProductDetailsState(returnDetails);
      } catch (error) {
        yield Error(error.toString());
      }
    }

    if (event is CollectEvent) {
      yield Loading();
      try {
        var response = await repo.iHttpHlper.getrequest(
            "/order/collectpaymentorder?paymentTodo=${event.todoid}");
        requestModel = returnRequestModelFromJson(response);

        yield AllReturnState(requestModel);
      } catch (error) {
        yield Error(error.toString());
      }
    }
  }
}
