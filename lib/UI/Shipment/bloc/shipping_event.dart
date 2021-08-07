part of 'shipping_bloc.dart';

@immutable
abstract class ShippingEvent {}

class GetAllShipEvent extends ShippingEvent {
  final String customername;
  final String mobile;
  final String status;
  final int pages;
  final int size;
  final bool issearch;

  GetAllShipEvent(
      [this.customername,
      this.mobile,
      this.status,
      this.pages,
      this.size,
      this.issearch]);
}

class PrepareEvent extends ShippingEvent {
  final int shipid;
  PrepareEvent(this.shipid);
}

class ShipEvent extends ShippingEvent {
  final int shipid;
  ShipEvent(this.shipid);
}

class DeliverEvent extends ShippingEvent {
  final int shipid;
  DeliverEvent(this.shipid);
}

class DoneEvent extends ShippingEvent {
  final int shipid;
  DoneEvent(this.shipid);
}

class GetShipOrderDetails extends ShippingEvent {
  final int orderid;
  GetShipOrderDetails(this.orderid);
}
