import 'package:admin/UI/Shipment/ShipmentDetails.dart';
import 'package:admin/UI/Shipment/bloc/shipping_bloc.dart';
import 'package:admin/models/ShipmentModel/ShipmentModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Shipping extends StatefulWidget {
  Shipping({Key key}) : super(key: key);

  @override
  _ShippingState createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {
  ScrollController controller = ScrollController();
  int num = 0;
  bool visible = false;
  String name;
  String number;
  String chosenstatus;
  int pages = 0;
  int ssize = 10;
  bool issearch = false;
  List<Shipments> orders = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          ShippingBloc()..add(GetAllShipEvent('', '', '', pages, ssize, false)),
      child: Container(
        child: BlocBuilder<ShippingBloc, ShippingState>(
          builder: (context, state) {
            if (state is GetAllShipState) {
              orders = state.shiporders;
              print("here from the all state ");
              print(orders.length);
            }
            if (state is ShippingInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                Container(
                  height: size.height * 0.05,
                  width: size.width,
                  color: Colors.white,
                  child: Text(
                    "     Shipping",
                    style: TextStyle(fontSize: 30, color: Colors.grey),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (num.isEven)
                          visible = true;
                        else
                          visible = false;
                        num++;
                        setState(() {});
                      },
                      child: Container(
                        height: size.height * 0.04,
                        child: Text(
                          "Search by options",
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: visible,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Container(
                        color: Colors.grey[100],
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: " Search by name",
                              border: InputBorder.none),
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Container(
                        color: Colors.grey[100],
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: " Search by phone number",
                              border: InputBorder.none),
                          onChanged: (value) {
                            number = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Container(
                        height: size.height * 0.07,
                        width: size.width,
                        color: Colors.grey[100],
                        child: DropdownButton<String>(
                          hint: Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Text(
                              chosenstatus != null
                                  ? chosenstatus
                                  : "   Select status",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          items: <String>[
                            'PENDING',
                            'CANCELLED',
                            'CONFIRMED',
                            'PREPARE',
                            'SHIPPED',
                            'DONE',
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: new Text(
                                value,
                                style: TextStyle(fontSize: 10),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            chosenstatus = value;
                            setState(() {});
                          },
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      Builder(
                        builder: (context) => GestureDetector(
                          onTap: () {
                            pages = 0;
                            if (chosenstatus != null ||
                                name != null ||
                                number != null) {
                              context.read<ShippingBloc>().add(GetAllShipEvent(
                                  name != null ? name : "",
                                  number != null ? number : "",
                                  chosenstatus != null ? chosenstatus : "",
                                  pages,
                                  ssize,
                                  true));
                            } else {}
                          },
                          child: Container(
                            height: size.height * 0.06,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                                color: Colors.orange[800],
                                borderRadius: BorderRadius.circular(40)),
                            child: Center(
                                child: Text(
                              "Search",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                    ],
                  ),
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.05,
                  color: Colors.grey[300],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("ID"),
                        Text("Customer Name"),
                        Text("Status"),
                      ],
                    ),
                  ),
                ),
                NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      if (notification is ScrollEndNotification &&
                          controller.position.extentAfter == 0) {
                        print("here from listener");
                        pages++;
                        print(pages);
                        if (name == null &&
                            number == null &&
                            chosenstatus == null) {
                          context.read<ShippingBloc>().add(
                              GetAllShipEvent('', '', '', pages, ssize, false));
                        } else
                          context.read<ShippingBloc>().add(GetAllShipEvent(
                              name, number, chosenstatus, pages, ssize));
                      }

                      return false;
                    },
                    child: Container(
                      height: visible ? size.height * 0.25 : size.height * 0.5,
                      width: size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        controller: controller,
                        itemCount: orders.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => ShipmentDetails(
                                      orderid: orders[index].id,
                                      f: () {
                                        print("here from call back");
                                        context.read<ShippingBloc>().add(
                                            GetAllShipEvent(
                                                '', '', '', pages, ssize));
                                      },
                                    )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(orders[index].id.toString()),
                                Text(orders[index].customerName),
                                Flexible(
                                  child: Container(
                                    width: size.width * 0.15,
                                    child: Text(
                                      orders[index].status,
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}
