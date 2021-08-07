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
  String searchname;
  String searchmobile;
  String searchstatus;
  String date1;
  String date2;
  bool firsttime = true;

  ReturnRequestModel requestModel;
  ReturnProcessModel returnProcessModel;
  List<Content> requests = [];
  List<Content> serachrequests = [];
  GetAllReturn getAllReturn;
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

        if (getAllReturn.content.isNotEmpty) {
          for (var i = 0; i < getAllReturn.content.length; i++) {
            requests.add(getAllReturn.content[i]);
          }
        }
        yield GetReturnProductsState(getAllReturn, requests);

        if (getAllReturn.content.isNotEmpty) {
          for (var i = 0; i < getAllReturn.content.length; i++) {
            serachrequests.add(getAllReturn.content[i]);
          }
        }
        yield GetReturnProductsState(getAllReturn, serachrequests);
      } catch (error) {
        yield Error(error.toString());
      }
    }
    if (event is SearchEvent) {
      try {
        var response = await repo.iHttpHlper.getrequest(
            "/order/getreturnproducttodos?status=${event.status}&name=${event.name}&phone=${event.number}&fromDate=${event.date1}&toDate=${event.date2}&page=${event.page}&size=${event.ssize}");
        getAllReturn = getAllReturnFromJson(response);
      } catch (error) {
        yield Error(error.toString());
      }
      if (firsttime) {
        searchname = event.name;
        searchmobile = event.number;
        searchstatus = event.status;
        date1 = event.date1;
        date2 = event.date2;
        print(searchname);
        print(searchmobile);
        firsttime = false;
        print("firststime");
      }
      if (samesearch(
          event.status, event.name, event.number, event.date1, event.date2)) {
        if (getAllReturn.content.isNotEmpty) {
          for (var i = 0; i < getAllReturn.content.length; i++) {
            requests.add(getAllReturn.content[i]);
          }
          yield SearchState(getAllReturn, getAllReturn.content);
        }
      } else {
        print("diffrent search");
        requests = [];
        if (getAllReturn.content.isNotEmpty) {
          for (var i = 0; i < getAllReturn.content.length; i++) {
            requests.add(getAllReturn.content[i]);
          }
          yield SearchState(getAllReturn, requests);
        }
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

  bool samesearch(
      String status, String name, String mobile, String date11, String date22) {
    if (searchname == name &&
        searchmobile == mobile &&
        searchstatus == status &&
        date11 == date1 &&
        date22 == date2) {
      print("true form same search");
      return true;
    } else {
      searchname = name;
      searchmobile = mobile;
      searchstatus = status;
      date1 = date11;
      date2 = date22;

      return false;
    }
  }
}
