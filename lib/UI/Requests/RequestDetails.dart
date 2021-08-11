import 'package:admin/UI/Requests/bloc/requests_bloc.dart';
import 'package:admin/UI/Widgets/Container.dart';
import 'package:admin/UI/Widgets/Text.dart';
import 'package:admin/models/Quotation.dart';
import 'package:admin/models/Quotationoffers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestDetails extends StatefulWidget {
  final QuotationsRequests quotationsRequests;
  RequestDetails({Key key, this.quotationsRequests}) : super(key: key);

  @override
  _RequestDetailsState createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {
  ScrollController controller = ScrollController();
  int pages = 0;
  int ssize = 10;
  List<Offers> offers = [];
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
            }

            if (state is Error) {
              print("here ");
              return Center(child: text(text: "${state.error}"));
            }
            return Container(
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
                      hight: size.height * 0.06,
                      width: size.width * 0.6,
                      borderRadius: 10,
                      shadow: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          text(text: "Customer name : Sarah Mhmd"),
                          text(
                              text: "mobile number 123123",
                              color: Colors.grey[700],
                              fontsize: 14)
                        ],
                      )),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  container(
                      hight: size.height * 0.66,
                      width: size.width,
                      child: ListView.builder(
                        controller: controller,
                        itemCount: offers.length,
                        itemBuilder: (context, index) {
                          return NotificationListener<ScrollNotification>(
                              onNotification: (notification) {
                                if (notification is ScrollEndNotification &&
                                    controller.position.extentAfter == 0) {
                                  print("here from listener");
                                  pages++;
                                }

                                return false;
                              },
                              child: container(
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
                                  )));
                        },
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
