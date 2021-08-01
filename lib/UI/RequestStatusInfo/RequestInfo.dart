import 'package:admin/UI/Return/bloc/return_bloc.dart';

import 'package:admin/models/ReturnProcessModel.dart';
import 'package:admin/models/ReturnTodoDetails.dart' as n;
import 'package:admin/models/ReturnRequestModel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RequestInfo extends StatefulWidget {
  final int todoid;

  RequestInfo({Key key, this.todoid}) : super(key: key);

  @override
  _RequestInfoState createState() => _RequestInfoState();
}

class _RequestInfoState extends State<RequestInfo> {
  var payment;
  bool isreturnproduct = false;
  String nextaction;
  bool yesno = false;
  bool iscustomeracceptdiscount = false;
  bool isproductreturned = false;
  String note;
  String discount;
  bool isyes = false;
  String status;
  String transcost;
  n.ReturnDetails returnDetails;
  var notes = [];
  ReturnRequestModel returnRequestModel;
  ReturnProcessModel returnProcessModel;
  bool vendordiscount = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          ReturnBloc()..add(GetReturnProductDetailsEvent(widget.todoid)),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: BlocBuilder<ReturnBloc, ReturnState>(
              builder: (context, state) {
                if (state is ReturnInitial) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is Loading) {
                  return Center(child: LinearProgressIndicator());
                }
                if (state is Error) {
                  return Container(
                      height: size.height,
                      child: Center(child: Text(state.error)));
                }
                if (state is AddNotForTodoState) {
                  Fluttertoast.showToast(
                      msg: "Note Added successfully",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  notes = state.addNote.notes;
                }

                if (state is AllReturnState) {
                  isyes = false;
                  iscustomeracceptdiscount = false;
                  vendordiscount = false;
                  isproductreturned = false;
                  returnRequestModel = state.returnRequestModel;
                  status = state.returnRequestModel.status;
                  payment = state.returnRequestModel.paymentTodos;
                  print(
                      "${state.returnRequestModel.status} here the status from the state");
                  if (state.returnRequestModel.status ==
                      "ASK_CUSTOMER_FOR_DISCOUNT") {
                    iscustomeracceptdiscount = true;
                  }
                  if (state.returnRequestModel.status == "CHECK_PRODUCT") {
                    print("here from the state ");
                    isproductreturned = true;
                  }
                  if (state.returnRequestModel.status ==
                      "TAKE_INFO_FROM_VENDOR_AND_ASK_FOR_DISCOUNT") {
                    vendordiscount = true;
                  }
                }
                if (state is GetReturnProductDetailsState) {
                  print("here the details state ");
                  returnDetails = state.requestModel;
                  notes = state.requestModel.notes;
                  status = state.requestModel.status;
                  payment = state.requestModel.paymentTodos;

                  if (state.requestModel.status ==
                      "ASK_CUSTOMER_FOR_DISCOUNT") {
                    iscustomeracceptdiscount = true;
                  }
                  if (state.requestModel.status == "CHECK_PRODUCT") {
                    print("here from the state ");
                    isproductreturned = true;
                  }
                  if (state.requestModel.status ==
                      "TAKE_INFO_FROM_VENDOR_AND_ASK_FOR_DISCOUNT") {
                    vendordiscount = true;
                  }
                }
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Container(
                        color: Colors.orange[600],
                        child: Text(
                          " Status Info ",
                          style: TextStyle(fontSize: 30, color: Colors.white),
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
                                "Vendor name   : ${returnDetails.vendor.fullName}"),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                                "Vendor mobile : ${returnDetails.vendor.mobileNumber}"),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                                "Customer name   : ${returnDetails.customer.fullName}"),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                                "Customer mobile : ${returnDetails.customer.mobileNumber}"),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                                "Product Name : ${returnDetails.item.product.name}"),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              "Status : $status",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.orange[900]),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                                "Reason              : ${returnDetails.reason}"),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                                "Date                   : ${returnDetails.creationDate.toString().substring(0, 16)}"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text("           Enter your note"),
                      SizedBox(height: size.height * 0.005),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              color: Colors.grey[200],
                              child: Row(
                                children: [
                                  Container(
                                    height: size.height * 0.05,
                                    width: size.width * 0.75,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0),
                                        color: Colors.grey[200]),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(left: 10),
                                          hintText: "   Add your note here",
                                          border: InputBorder.none),
                                      keyboardType: TextInputType.text,
                                      onChanged: (value) {
                                        note = value;
                                      },
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.read<ReturnBloc>().add(
                                          AddNotForTodoEvent(
                                              note, widget.todoid));
                                    },
                                    child: Container(
                                      child: Icon(
                                        Icons.send_outlined,
                                        color: Colors.orange[600],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      (vendordiscount ||
                              iscustomeracceptdiscount ||
                              isproductreturned)
                          ? Container(
                              height: size.height * 0.15,
                              width: size.width,
                              child: Column(
                                children: [
                                  vendordiscount
                                      ? Text("Vendor accept discount?")
                                      : iscustomeracceptdiscount
                                          ? Text("Customer accept discount?")
                                          : isproductreturned
                                              ? Text("is product returned?")
                                              : Container(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          isyes = true;
                                          setState(() {});
                                          if (isproductreturned == true &&
                                              transcost != null) {
                                            context.read<ReturnBloc>().add(
                                                IsproductReturnedEvent(
                                                    true,
                                                    widget.todoid,
                                                    int.parse(transcost)));
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: "please enter the cost",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          }
                                          if (iscustomeracceptdiscount) {
                                            context.read<ReturnBloc>().add(
                                                    IsCustomerAcceptDiscountEvent(
                                                  true,
                                                  widget.todoid,
                                                ));
                                          }
                                        },
                                        child: Container(
                                          color: Colors.green,
                                          height: size.height * 0.03,
                                          width: size.width * 0.2,
                                          child: Center(
                                              child: Text(
                                            "yes",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                        ),
                                      ),
                                      !isyes
                                          ? GestureDetector(
                                              onTap: () {
                                                vendordiscount
                                                    ? context.read<ReturnBloc>().add(
                                                        VendorNotAcceptDiscountEvent(
                                                            false,
                                                            widget.todoid))
                                                    : iscustomeracceptdiscount
                                                        ? context
                                                            .read<ReturnBloc>()
                                                            .add(IsCustomerAcceptDiscountEvent(
                                                                false,
                                                                widget.todoid))
                                                        : isproductreturned
                                                            ? transcost != null
                                                                ? context.read<ReturnBloc>().add(
                                                                    IsproductReturnedEvent(
                                                                        false,
                                                                        widget
                                                                            .todoid,
                                                                        int.parse(
                                                                            transcost)))
                                                                // ignore: unnecessary_statements
                                                                : Fluttertoast.showToast(
                                                                    msg:
                                                                        "please enter the cost",
                                                                    toastLength:
                                                                        Toast
                                                                            .LENGTH_SHORT,
                                                                    gravity: ToastGravity
                                                                        .CENTER,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .red,
                                                                    textColor:
                                                                        Colors
                                                                            .white,
                                                                    fontSize:
                                                                        16.0)
                                                            : Fluttertoast.showToast(
                                                                msg: "please enter the cost",
                                                                toastLength: Toast.LENGTH_SHORT,
                                                                gravity: ToastGravity.CENTER,
                                                                backgroundColor: Colors.red,
                                                                textColor: Colors.white,
                                                                fontSize: 16.0);
                                              },
                                              child: Container(
                                                color: Colors.red,
                                                height: size.height * 0.03,
                                                width: size.width * 0.2,
                                                child: Center(
                                                    child: Text(
                                                  "No",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                              ),
                                            )
                                          : Container(),
                                    ],
                                  ),

                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),

                                  ///here
                                  vendordiscount
                                      ? Container(
                                          height: size.height * 0.06,
                                          width: size.width * 0.8,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                              color: Colors.grey[200]),
                                          child: TextFormField(
                                              decoration: InputDecoration(
                                                  hintText:
                                                      "   Add The Discount",
                                                  border: InputBorder.none),
                                              keyboardType:
                                                  TextInputType.number,
                                              onChanged: (value) {
                                                discount = value;
                                              }),
                                        )
                                      : isproductreturned
                                          ? Container(
                                              height: size.height * 0.06,
                                              width: size.width * 0.8,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                  color: Colors.grey[200]),
                                              child: TextFormField(
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          "   Add The trans cost",
                                                      border: InputBorder.none),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  onChanged: (value) {
                                                    transcost = value;
                                                  }),
                                            )
                                          : Container()
                                ],
                              ),
                            )
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Builder(
                          builder: (context) => InkWell(
                              onTap: () {
                                switch (status) {
                                  case "TAKE_INFO_FROM_CUSTOMER":
                                    context
                                        .read<ReturnBloc>()
                                        .add(TalkeToVendorEvent(widget.todoid));
                                    break;
                                  case "TAKE_INFO_FROM_VENDOR_AND_ASK_FOR_DISCOUNT":
                                    discount != null
                                        ? context.read<ReturnBloc>().add(
                                            VendorAcceptDiscountEvent(
                                                int.parse(discount),
                                                true,
                                                widget.todoid))
                                        : Fluttertoast.showToast(
                                            msg: "please add the discount",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                    break;
                                  case "CHECK_PRODUCT":
                                    transcost != null
                                        ? context.read<ReturnBloc>().add(
                                            IsproductReturnedEvent(
                                                true,
                                                widget.todoid,
                                                int.parse(transcost)))
                                        : Fluttertoast.showToast(
                                            msg: "please enter the cost",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);

                                    break;
                                  case "RETURN_PRODUCT_TO_VENDOR":
                                    context.read<ReturnBloc>().add(
                                        InformTransportCompanyEvent(
                                            widget.todoid));
                                    break;

                                  case "GET_PRODUCT_FROM_CUSTOMER":
                                    context.read<ReturnBloc>().add(
                                        InformTransportCompanyEvent(
                                            widget.todoid));
                                    break;
                                  case "RETURN_PRODUCT_TO_CUSTOMER":
                                    context.read<ReturnBloc>().add(
                                        InformTransportCompanyEvent(
                                            widget.todoid));
                                    break;
                                }
                              },
                              child: Container(
                                height: size.height * 0.05,
                                width: size.width * 0.8,
                                decoration: BoxDecoration(
                                    color: Colors.orange[600],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(0))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    status != null
                                        ? Flexible(
                                            child: Text(
                                            "Next Step",
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.white),
                                          ))
                                        : Container()
                                  ],
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      notes.isNotEmpty
                          ? Container(
                              width: size.width,
                              height: size.height * 0.054,
                              color: Colors.grey[300],
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Admin",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "Note",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      notes.isNotEmpty
                          ? Container(
                              height: size.height * 0.3,
                              child: ListView.builder(
                                itemCount: notes.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "               ${notes[index].admin.fullName}",
                                          style: TextStyle(
                                              color: Colors.orange[900]),
                                        ),
                                        Flexible(
                                            child: Container(
                                                width: size.width * 0.3,
                                                child:
                                                    Text(notes[index].note))),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          : Container(),
                      SizedBox(height: size.height * 0.01),
                      payment.isNotEmpty
                          ? Container(
                              width: size.width,
                              height: size.height * 0.054,
                              color: Colors.grey[300],
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "From",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    "To",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    "Status",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    "Amount",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  // Text(
                                  //   "InvoiceNumber",
                                  //   style: TextStyle(fontSize: 16),
                                  // ),
                                ],
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      payment.isNotEmpty
                          ? Container(
                              height: size.height * 0.3,
                              child: ListView.builder(
                                itemCount: payment.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${payment[index].fromSide}",
                                          style: TextStyle(
                                            color: Colors.orange[900],
                                          ),
                                        ),
                                        Flexible(
                                            child: Container(
                                          width: size.width * 0.3,
                                          child: Text(payment[index].toSide),
                                        )),
                                        Flexible(
                                            child: Container(
                                          child: Text(payment[index].status),
                                        )),
                                        Flexible(
                                            child: Container(
                                          child: Text(
                                              payment[index].amount.toString()),
                                        )),
                                        GestureDetector(
                                          onTap: () {
                                            context.read<ReturnBloc>().add(
                                                CollectEvent(returnDetails
                                                    .paymentTodos[index].id));
                                          },
                                          child: Container(
                                            color: Colors.blue,
                                            height: size.height * 0.02,
                                            width: size.width * 0.1,
                                            child: Center(
                                                child: Text(
                                              "Collect",
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
                          : Container()
                    ]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
