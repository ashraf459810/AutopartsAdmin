import 'package:admin/UI/payment/bloc/payment_bloc.dart';
import 'package:admin/models/DueOrdersModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Payment extends StatefulWidget {
  Payment({Key key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  List<Content> orders = [];
  ScrollController controller = ScrollController();
  int page = 0;
  int ssize = 20;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          PaymentBloc()..add(OrdersHaveToPayEvent(page, ssize)),
      child: Container(
        height: size.height * 0.71,
        child: Column(children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            height: size.height * 0.6,
            width: size.width * 0.9,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  height: size.height * 0.04,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("VendorName      ", style: TextStyle(fontSize: 9)),
                      Text("vendor id      ", style: TextStyle(fontSize: 9)),
                      Text("bill     ", style: TextStyle(fontSize: 9)),
                      Text("order id   ", style: TextStyle(fontSize: 9))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: BlocBuilder<PaymentBloc, PaymentState>(
                    builder: (context, state) {
                      if (state is Error) {
                        return Center(child: Text(state.error));
                      }

                      if (state is OrdersHaveToPayState) {
                        orders = state.dueOrdersModel.content;
                      }
                      return NotificationListener<ScrollNotification>(
                          onNotification: (notification) {
                            if (notification is ScrollEndNotification &&
                                controller.position.extentAfter == 0) {
                              print("here from listener");
                              page++;
                              print(page);

                              context
                                  .read<PaymentBloc>()
                                  .add(OrdersHaveToPayEvent(page, ssize));
                            }

                            return false;
                          },
                          child: orders.isNotEmpty
                              ? Container(
                                  height: size.height * 0.5,
                                  width: size.width * 0.9,
                                  child: ListView.builder(
                                    itemCount: orders.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(orders[index].fullName),
                                            Row(
                                              children: [
                                                Text(
                                                    orders[index]
                                                        .vendorId
                                                        .toString(),
                                                    style:
                                                        TextStyle(fontSize: 9)),
                                              ],
                                            ),
                                            Text(orders[index]
                                                .amount
                                                .toString()),
                                            Text(orders[index]
                                                .orderId
                                                .toString())
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : Container(
                                  height: size.height * 0.2,
                                  child: Center(
                                    child: Text(
                                      "No orders have to be paid ",
                                      style: TextStyle(
                                          color: Colors.orange[900],
                                          fontSize: 16),
                                    ),
                                  ),
                                ));
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
        ]),
      ),
    );
  }
}
