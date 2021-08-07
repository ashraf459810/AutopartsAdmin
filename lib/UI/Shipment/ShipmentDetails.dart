import 'package:admin/UI/Shipment/bloc/shipping_bloc.dart';
import 'package:admin/models/ShipOrderDetails/ShipOrderDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShipmentDetails extends StatefulWidget {
  final int orderid;
  final Function f;
  ShipmentDetails({Key key, this.orderid, this.f}) : super(key: key);

  @override
  _ShipmentDetailsState createState() => _ShipmentDetailsState();
}

class _ShipmentDetailsState extends State<ShipmentDetails> {
  String status;
  ShipOrderDetails shipOrderDetails;
  List<ShipTodo> shiptodo = [];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          ShippingBloc()..add(GetShipOrderDetails(widget.orderid)),
      child: BlocBuilder<ShippingBloc, ShippingState>(
        builder: (context, state) {
          if (state is ShippingInitial) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          if (state is GetShipOrderDetailsState) {
            shipOrderDetails = state.shipOrderDetails;
            status = state.shipOrderDetails.order.status;
            shiptodo = state.shipOrderDetails.shipTodos;
            print(shiptodo.length);
          }

          if (state is PrepareState) {
            shipOrderDetails = state.shipOrderDetails;
            status = state.shipOrderDetails.order.status;
            shiptodo = state.shipOrderDetails.shipTodos;
          }
          if (state is ShipState) {
            shipOrderDetails = state.shipOrderDetails;
            status = state.shipOrderDetails.order.status;
            shiptodo = state.shipOrderDetails.shipTodos;
          }
          if (state is DeliverState) {
            shipOrderDetails = state.shipOrderDetails;
            status = state.shipOrderDetails.order.status;
            shiptodo = state.shipOrderDetails.shipTodos;
          }
          if (state is DoneState) {
            print(state.shipOrderDetails.order.status);
            shipOrderDetails = state.shipOrderDetails;
            status = state.shipOrderDetails.order.status;
            shiptodo = state.shipOrderDetails.shipTodos;
          }
          if (state is Loading) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          if (state is Error) {
            return Scaffold(body: Center(child: Text(state.error)));
          }
          return WillPopScope(
            onWillPop: onwillpop,
            child: Scaffold(
              appBar: PreferredSize(
                  preferredSize:
                      Size.fromHeight(30.0), // here the desired height
                  child: AppBar(
                      leading: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          onwillpop();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.orange[900],
                        ),
                      ),
                      backgroundColor: Colors.white
                      // ...
                      )),
              body: SingleChildScrollView(
                child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Container(
                        height: size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(0),
                          ),
                          color: Colors.orange[900],
                        ),
                        child: Center(
                          child: Text(
                            " Status Info ",
                            style: TextStyle(fontSize: 27, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "ID              :   ${shipOrderDetails.order.id}"),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                                "Customer : ${shipOrderDetails.order.customer.fullName}"),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                                "Price         : ${shipOrderDetails.order.fullPrice}"),
                            shipOrderDetails.order.deliverCountry != null
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      Text(
                                          "Country    : ${shipOrderDetails.order.deliverCountry}"),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      Text(
                                          "City           : ${shipOrderDetails.order.deliverCity}"),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      Text(
                                        "Street       : ${shipOrderDetails.order.deliverStreet}",
                                      ),
                                    ],
                                  )
                                : Container(),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                                "Status       : ${shipOrderDetails.order.status}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.orange[900],
                                )),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                                "Done Date: ${shipOrderDetails.order.creationDate.year}/${shipOrderDetails.order.creationDate.month}/${shipOrderDetails.order.creationDate.day}"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      SizedBox(height: size.height * 0.02),
                      GestureDetector(
                        onTap: () {
                          switch (status) {
                            case "CONFIRMED":
                              context
                                  .read<ShippingBloc>()
                                  .add(PrepareEvent(widget.orderid));
                              break;
                            case "PREPARE":
                              context
                                  .read<ShippingBloc>()
                                  .add(ShipEvent(widget.orderid));
                              break;
                            case "SHIPPED":
                              context
                                  .read<ShippingBloc>()
                                  .add(DeliverEvent(widget.orderid));
                              break;
                            case "DONE":
                              break;
                          }
                        },
                        child: Center(
                          child: status != "PENDING"
                              ? status != "DONE"
                                  ? Container(
                                      width: size.width * 0.8,
                                      height: size.height * 0.05,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          color: Colors.orange[900]),
                                      child: Center(
                                        child: Text(
                                          status == "CONFIRMED"
                                              ? "Prepare"
                                              : status == "PREPARE"
                                                  ? "SHIP"
                                                  : status == "SHIPPED"
                                                      ? "DELIVER"
                                                      : status == "DELIVER"
                                                          ? "DONE"
                                                          : "",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ))
                                  : SizedBox()
                              : SizedBox(),
                        ),
                      ),
                      SizedBox(height: size.height * 0.005),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.grey[100]),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      SizedBox(height: size.height * 0.01),
                      Center(
                          child: Text(
                        "Shipment Todo",
                        style: TextStyle(color: Colors.grey, fontSize: 30),
                      )),
                      Container(
                        width: size.width,
                        height: size.height * 0.054,
                        color: Colors.grey[300],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "ID",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "Status",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "Vendor",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "Product",
                              style: TextStyle(fontSize: 16),
                            ),
                            // Text(
                            //   "InvoiceNumber",
                            //   style: TextStyle(fontSize: 16),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      shiptodo.isNotEmpty
                          ? Container(
                              width: size.width,
                              height: size.height * 0.3,
                              child: ListView.builder(
                                itemCount: shiptodo.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "${shiptodo[index].id}",
                                          style: TextStyle(
                                            color: Colors.orange[900],
                                          ),
                                        ),
                                        Flexible(
                                            child: Container(
                                          child: Text(
                                              "          ${shiptodo[index].status}"),
                                        )),
                                        SizedBox(
                                          width: size.width * 0.03,
                                        ),
                                        Flexible(
                                          child: Container(
                                              width: size.width * 0.4,
                                              child: Center(
                                                child: Text(
                                                  "${shiptodo[index].vendor.fullName}",
                                                ),
                                              )),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.02,
                                        ),
                                        Flexible(
                                          child: Container(
                                              width: size.width * 0.2,
                                              child: Center(
                                                child: Text(
                                                  shiptodo[index]
                                                      .item
                                                      .product
                                                      .name,
                                                ),
                                              )),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            if (shiptodo[index].status ==
                                                "PENDING") {
                                              context.read<ShippingBloc>().add(
                                                  DoneEvent(
                                                      shiptodo[index].id));
                                            } else {}
                                          },
                                          child: Container(
                                            color: Colors.blue,
                                            height: size.height * 0.02,
                                            width: size.width * 0.1,
                                            child: Center(
                                                child: Text(
                                              shiptodo[index].status ==
                                                      "PENDING"
                                                  ? "DONE"
                                                  : "DONE",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white),
                                            )),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          : Container(
                              child: Center(child: Text("No Ships Todo")))
                    ])),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<bool> onwillpop() async {
    widget.f();

    return true;
  }
}
