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
  ShipOrderDetails shipOrderDetails;

  @override
  Stream<ShippingState> mapEventToState(
    ShippingEvent event,
  ) async* {
    if (event is GetAllShipEvent) {
      try {
        var response = await repo.iHttpHlper.getrequest(
            "/order/getorders?customerName=${event.customername}&mobileNumber=${event.mobile}&status${event.status}=&page${event.pages}=&size=${event.size}");
        ShipmentModel shipmentModel = shipmentModelFromJson(response);
        if (shipmentModel.content.isNotEmpty) {
          for (var i = 0; i < shipmentModel.content.length; i++) {
            shiporders.add(shipmentModel.content[i]);
          }
          yield GetAllShipState(shiporders);
        }
      } catch (error) {
        yield Error(error.toString());
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
      // try {
      var response = await repo.iHttpHlper
          .getrequest("/order/getorderfulldetails?order=${event.orderid}");
      shipOrderDetails = shipOrderDetailsFromJson(response);
      yield GetShipOrderDetailsState(shipOrderDetails);
      // } catch (error) {
      //   yield Error(error.toString());
      // }
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
}
