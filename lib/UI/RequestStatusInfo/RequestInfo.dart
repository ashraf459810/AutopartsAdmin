import 'package:admin/UI/Return/bloc/return_bloc.dart';

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
  List<String> actions = [
    "TAKE_INFO_FROM_CUSTOMER",
    "TAKE_INFO_FROM_VENDOR_AND_ASK_FOR_DISCOUNT",
    "ASK_CUSTOMER_FOR_DISCOUNT",
    "GET_PRODUCT_FROM_CUSTOMER",
    "CHECK_PRODUCT",
    "RETURN_PRODUCT_TO_VENDOR",
    "RETURN_PRODUCT_TO_CUSTOMER",
    "HANDLE_PAYMENTS",
    "DONE"
  ];
  List<dynamic> notes = [];
  ReturnRequestModel returnRequestModel;
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
                  return Center(child: CircularProgressIndicator());
                }
                if (state is Error) {
                  return Center(child: Text(state.error));
                }
                if (state is GetReturnProductDetailsState) {
                  returnRequestModel = state.requestModel;
                  notes = state.requestModel.notes;
                  status = state.requestModel.status;
                  if (state.requestModel.status == "TAKE_INFO_FROM_CUSTOMER") {
                    vendordiscount = true;
                  }
                  if (state.requestModel.status ==
                      "ASK_CUSTOMER_FOR_DISCOUNT") {
                    iscustomeracceptdiscount = true;
                  }
                  if (state.requestModel.status == "CHECK_PRODUCT") {
                    print("here from the state ");
                    isproductreturned = true;
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
                                "Vendor name   : ${returnRequestModel.vendor.fullName}"),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                                "Vendor mobile : ${returnRequestModel.vendor.mobileNumber}"),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                                "Customer name   : ${returnRequestModel.customer.fullName}"),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                                "Customer mobile : ${returnRequestModel.customer.mobileNumber}"),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                                "Product Name : ${returnRequestModel.item.product.name}"),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                                "Request Status : ${returnRequestModel.status}"),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                                "Reason              : ${returnRequestModel.reason}"),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                                "Date                   : ${returnRequestModel.creationDate.toString().substring(0, 16)}"),
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
                        padding: const EdgeInsets.only(left: 40),
                        child: Container(
                          height: size.height * 0.05,
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: Colors.grey[200]),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "   Add your note here",
                                border: InputBorder.none),
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              note = value;
                            },
                          ),
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
                                                    ? context
                                                        .read<ReturnBloc>()
                                                        .add(
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
                                                            ? context.read<ReturnBloc>().add(
                                                                    IsproductReturnedEvent(
                                                                  false,
                                                                  widget.todoid,
                                                                ))
                                                            // ignore: unnecessary_statements
                                                            : Fluttertoast.showToast(
                                                                msg:
                                                                    "please enter the cost",
                                                                toastLength: Toast
                                                                    .LENGTH_SHORT,
                                                                gravity:
                                                                    ToastGravity
                                                                        .CENTER,
                                                                backgroundColor:
                                                                    Colors.red,
                                                                textColor:
                                                                    Colors
                                                                        .white,
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
                                switch (nextaction) {
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
                                    context.read<ReturnBloc>().add(
                                        AutopartCheckTheProductEvent(
                                            widget.todoid));
                                    break;
                                  case "RETURN_PRODUCT_TO_VENDOR":
                                    context.read<ReturnBloc>().add(
                                        InformTransportCompanyEvent(
                                            widget.todoid));
                                    break;
                                  case "RETURN_PRODUCT_TO_CUSTOMER":
                                    context.read<ReturnBloc>().add(
                                        InformTransportCompanyEvent(
                                            widget.todoid));
                                    break;
                                  case "RETURN_PRODUCT":
                                }
                              },
                              child: Container(
                                height: size.height * 0.05,
                                width: size.width * 0.8,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(0))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.arrow_forward_ios),
                                    status != null
                                        ? Flexible(
                                            child: Text(
                                            selectaction(status),
                                            style: TextStyle(fontSize: 10),
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
                      Container(
                        width: size.width,
                        height: size.height * 0.05,
                        color: Colors.grey[300],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Admin"),
                              Text("Note"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Container(
                        height: size.height * 0.2,
                        child: ListView.builder(
                          itemCount: notes.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                // Text(notes[index].admin.fullName),
                                // Text(notes[index].note),
                              ],
                            );
                          },
                        ),
                      )
                    ]);
              },
            ),
          ),
        ),
      ),
    );
  }

  String selectaction(String status) {
    print("$status here the status");
    for (var i = 0; i < actions.length; i++) {
      if (status == actions[i]) {
        print("here from the func");
        if (status == "CHECK_PRODUCT") {
          return "RETURN PRODUCT";
        }
        nextaction = actions[i + 1];
        return nextaction;
      }
    }
    return "no aactions";
  }
}
