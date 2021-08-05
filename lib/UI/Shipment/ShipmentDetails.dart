import 'package:admin/UI/Shipment/bloc/shipping_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShipmentDetails extends StatefulWidget {
  final int orderid;
  ShipmentDetails({Key key, this.orderid}) : super(key: key);

  @override
  _ShipmentDetailsState createState() => _ShipmentDetailsState();
}

class _ShipmentDetailsState extends State<ShipmentDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ShippingBloc()..add(GetShipOrderDetails(widget.orderid)),
      child: Container(
        child: null,
      ),
    );
  }
}
