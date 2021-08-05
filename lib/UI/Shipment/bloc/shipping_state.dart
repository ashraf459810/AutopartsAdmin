part of 'shipping_bloc.dart';

@immutable
abstract class ShippingState {}

class ShippingInitial extends ShippingState {}

class GetAllShipState extends ShippingState {
  final List<Shipments> shiporders;
  GetAllShipState(this.shiporders);
}

class Error extends ShippingState {
  final String error;
  Error(this.error);
}

class Loading extends ShippingState {}

class PrepareState extends ShippingState {
  final ShipOrderDetails shipOrderDetails;
  PrepareState(this.shipOrderDetails);
}

class ShipState extends ShippingState {
  final ShipOrderDetails shipOrderDetails;
  ShipState(this.shipOrderDetails);
}

class DeliverState extends ShippingState {
  final ShipOrderDetails shipOrderDetails;
  DeliverState(this.shipOrderDetails);
}

class GetShipOrderDetailsState extends ShippingState {
  final ShipOrderDetails shipOrderDetails;
  GetShipOrderDetailsState(this.shipOrderDetails);
}
