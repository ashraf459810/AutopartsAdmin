import 'package:admin/UI/Requests/bloc/requests_bloc.dart';
import 'package:admin/UI/Widgets/Container.dart';
import 'package:admin/UI/Widgets/Dropdown.dart';
import 'package:admin/UI/Widgets/Text.dart';
import 'package:admin/UI/Widgets/TextForm.dart';
import 'package:admin/models/Quotation.dart';
import 'package:admin/models/Quotationoffers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuotationOffers extends StatefulWidget {
  final QuotationsRequests quotationsRequests;
  QuotationOffers({Key key, this.quotationsRequests}) : super(key: key);

  @override
  _QuotationOffersState createState() => _QuotationOffersState();
}

class _QuotationOffersState extends State<QuotationOffers> {
  ScrollController controller = ScrollController();
  var num = 0;
  int pages = 0;
  int ssize = 10;
  List<Offers> offers = [];
  bool isfilter = false;
  String vendornameornumber;
  TextEditingController textEditingController = TextEditingController();
  String status;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => RequestsBloc()
        ..add(GetoffersForQuotationEvent(
            pages, widget.quotationsRequests.id, ssize, '', '')),
      child: Scaffold(
        body: BlocBuilder<RequestsBloc, RequestsState>(
          builder: (context, state) {
            if (state is RequestsInitial) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is GetOffersForQuotationState) {
              offers = state.offers;
              print(offers.length);
            }

            if (state is Error) {
              print("here ");
              return Center(child: text(text: "${state.error}"));
            }
            return SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "lib/assets/cover.png",
                          fit: BoxFit.cover,
                          width: size.width,
                        )
                      ],
                    ),
                    // SizedBox(
                    //   height: size.height * 0.02,
                    // ),
                    container(
                        hight: size.height * 0.08,
                        width: size.width * 0.8,
                        borderRadius: 10,
                        shadow: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            text(
                                text:
                                    "Customer name : ${widget.quotationsRequests.customer.fullName}"),
                            text(
                                text:
                                    "mobile number ${widget.quotationsRequests.customer.mobileNumber}",
                                color: Colors.grey[700],
                                fontsize: 14)
                          ],
                        )),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    GestureDetector(
                      onTap: () {
                        num++;
                        if (num.isOdd) {
                          isfilter = true;
                        } else {
                          isfilter = false;
                        }
                        print(isfilter);
                        setState(() {});
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          text(text: "Filter with options", color: Colors.blue),
                        ],
                      ),
                    ),

                    !isfilter
                        ? Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              container(
                                  color: Colors.grey[100],
                                  width: size.width,
                                  child: DropDown(
                                    hint: "Select Status",
                                    list: [
                                      "SEND_PENDING",
                                      "REPLY_PENDING",
                                      'ACCEPTED',
                                      "REJECTED",
                                      "NOT_AVAILABLE",
                                      "CANCELLED"
                                    ],
                                    onchanged: (value) {
                                      status = value;
                                      print(status);
                                    },
                                  )),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Container(
                                color: Colors.grey[100],
                                height: size.height * 0.085,
                                child: textform(
                                    validation: "",
                                    controller: textEditingController,
                                    hint: "Enter Vendor name Or mobile",
                                    function: (value) {
                                      vendornameornumber = value;
                                    }),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              GestureDetector(
                                onTap: () {
                                  pages = 0;
                                  context.read<RequestsBloc>().add(
                                      GetoffersForQuotationEvent(
                                          0,
                                          widget.quotationsRequests.id,
                                          ssize,
                                          status != null ? status : "",
                                          vendornameornumber != null
                                              ? vendornameornumber
                                              : ""));
                                },
                                child: container(
                                    color: Colors.orange[900],
                                    child: text(
                                        text: "Search",
                                        color: Colors.white,
                                        fontsize: 18),
                                    hight: size.height * 0.06,
                                    width: size.width * 0.3,
                                    borderRadius: 20),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                            ],
                          )
                        : Container(),

                    NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                          if (notification is ScrollEndNotification &&
                              controller.position.extentAfter == 0) {
                            print("here from listener");
                            pages++;
                            if (!isfilter)
                              context.read<RequestsBloc>().add(
                                  FilterOffersEvent(
                                      0,
                                      widget.quotationsRequests.id,
                                      ssize,
                                      status != null ? status : "",
                                      vendornameornumber != null
                                          ? vendornameornumber
                                          : ""));
                            else
                              context.read<RequestsBloc>().add(
                                  GetoffersForQuotationEvent(
                                      0,
                                      widget.quotationsRequests.id,
                                      ssize,
                                      "",
                                      ""));
                          }

                          return false;
                        },
                        child: container(
                            hight: isfilter
                                ? size.height * 0.6
                                : size.height * 0.4,
                            width: size.width,
                            child: ListView.builder(
                              controller: controller,
                              itemCount: offers.length,
                              physics: ScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              itemBuilder: (context, index) {
                                return container(
                                    hight: size.height * 0.2,
                                    child: Column(
                                      children: [
                                        Row(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                container(
                                                  hight: size.height * 0.06,
                                                  width: size.width * 0.15,
                                                  borderRadius: 20,
                                                  color: Colors.orange,
                                                  child: Center(
                                                    child: text(
                                                        text:
                                                            "  Offer${index + 1}",
                                                        color: Colors.white),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              width: size.width * 0.2,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                text(
                                                    text:
                                                        "Vendor Name :${offers[index].vendorName}",
                                                    fontsize: 15),
                                                text(
                                                    text:
                                                        "Price :${offers[index].price}",
                                                    color: Colors.orange[900]),
                                                text(
                                                    text:
                                                        "Status :${offers[index].status}",
                                                    color: Colors.green),
                                                text(
                                                    text:
                                                        "Warranty :${offers[index].warrantyMonths}"),
                                                text(
                                                    text:
                                                        "Days To Delivers :${offers[index].daysToDeliver}"),
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Divider(
                                          color: Colors.grey[500],
                                          thickness: 0.2,
                                        )
                                      ],
                                    ));
                              },
                            )))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
