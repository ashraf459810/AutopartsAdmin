import 'dart:async';

import 'package:admin/Data/Repository/IRepository.dart';
import 'package:admin/models/ShipOrderDetails/ShipOrderDetails.dart';
import 'package:admin/models/ShipmentModel/ShipmentModel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../injection.dart';

part 'shipping_event.dart';
part 'shipping_state.dart';

class ShippingBloc extends Bloc<ShippingEvent, ShippingState> {
  ShippingBloc() : super(ShippingInitial());
  var repo = sl.get<IRepository>();
  List<Shipments> shiporders = [];
  List<Shipments> searchorders = [];
  ShipOrderDetails shipOrderDetails;
  ShipmentModel shipmentModel;
  String searchname;
  String searchmobile;
  String searchstatus;
  bool firsttime = true;

  @override
  Stream<ShippingState> mapEventToState(
    ShippingEvent event,
  ) async* {
    if (event is GetAllShipEvent) {
      try {
        var response = await repo.iHttpHlper.getrequest(
            "/order/getorders?customerName=${event.customername}&mobileNumber=${event.mobile}&status=${event.status}&page=${event.pages}&size=${event.size}");
        ShipmentModel shipmentModel = shipmentModelFromJson(response);

        if (shipmentModel.content.isNotEmpty) {
          for (var i = 0; i < shipmentModel.content.length; i++) {
            shiporders.add(shipmentModel.content[i]);
          }
        }
        yield GetAllShipState(shiporders);
      } catch (error) {
        yield Error(error.toString());
      }
    }

    if (event is SearchEvent) {
      try {
        var response = await repo.iHttpHlper.getrequest(
            "/order/getorders?customerName=${event.customername}&mobileNumber=${event.mobile}&status=${event.status}&page=${event.pages}&size=${event.size}");
        shipmentModel = shipmentModelFromJson(response);
      } catch (error) {
        yield Error(error.toString());
      }

      if (firsttime) {
        searchname = event.customername;
        searchmobile = event.mobile;
        searchstatus = event.status;
        print(searchname);
        print(searchmobile);
        firsttime = false;
        print("firststime");
      }

      if (samesearch(event.status, event.customername, event.mobile)) {
        if (shipmentModel.content.isNotEmpty) {
          for (var i = 0; i < shipmentModel.content.length; i++) {
            searchorders.add(shipmentModel.content[i]);
          }
          yield GetAllShipState(searchorders);
        }
      } else {
        print("diffrent search");
        searchorders = [];
        if (shipmentModel.content.isNotEmpty) {
          for (var i = 0; i < shipmentModel.content.length; i++) {
            searchorders.add(shipmentModel.content[i]);
          }
          yield GetAllShipState(searchorders);
        }
      }
    }

    if (event is PrepareEvent) {
      yield Loading();
      try {
        var response = await repo.iHttpHlper
            .postrequest("/order/prepartorder?order=${event.shipid}");
        shipOrderDetails = shipOrderDetailsFromJson(response);
        yield PrepareState(shipOrderDetails);
      } catch (error) {
        yield Error(error.toString());
      }
    }
    if (event is ShipEvent) {
      yield Loading();
      try {
        var response = await repo.iHttpHlper
            .postrequest("/order/shiporder?order=${event.shipid}");
        shipOrderDetails = shipOrderDetailsFromJson(response);
        yield PrepareState(shipOrderDetails);
      } catch (error) {
        yield Error(error.toString());
      }
    }
    if (event is DeliverEvent) {
      yield Loading();
      try {
        var response = await repo.iHttpHlper
            .postrequest("/order/deliverorder?order=${event.shipid}");
        shipOrderDetails = shipOrderDetailsFromJson(response);
        yield PrepareState(shipOrderDetails);
      } catch (error) {
        yield Error(error.toString());
      }
    }

    if (event is GetShipOrderDetails) {
      try {
        var response = await repo.iHttpHlper
            .getrequest("/order/getorderfulldetails?order=${event.orderid}");
        shipOrderDetails = shipOrderDetailsFromJson(response);
        yield GetShipOrderDetailsState(shipOrderDetails);
      } catch (error) {
        yield Error(error.toString());
      }
    }

    if (event is DoneEvent) {
      try {
        var response = await repo.iHttpHlper
            .postrequest("/order/doneshiptodo?todo=${event.shipid}");
        shipOrderDetails = shipOrderDetailsFromJson(response);
        yield DoneState(shipOrderDetails);
      } catch (error) {
        yield Error(error.toString());
      }
    }
  }

  bool samesearch(
    String status,
    String name,
    String mobile,
  ) {
    if (searchname == name &&
        searchmobile == mobile &&
        searchstatus == status) {
      print("true form same search");
      return true;
    } else {
      searchname = name;
      searchmobile = mobile;
      searchstatus = status;

      return false;
    }
  }
}

List<Shipments> filllist(List<Shipments> list, List<Shipments> apilist) {
  List<Shipments> filledlist = [];
  if (apilist.isNotEmpty) {
    for (var i = 0; i < list.length; i++) {
      filledlist.add(list[i]);
    }
  }
  return filledlist;
}
