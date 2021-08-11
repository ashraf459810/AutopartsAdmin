import 'package:admin/UI/Requests/RequestDetails.dart';
import 'package:admin/UI/Widgets/Container.dart';
import 'package:admin/UI/Widgets/Dropdown.dart';
import 'package:admin/UI/Widgets/Text.dart';
import 'package:admin/UI/Widgets/TextForm.dart';
import 'package:admin/models/Brands.dart';
import 'package:admin/models/Cars.dart';
import 'package:admin/models/Quotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/requests_bloc.dart';

class Requests extends StatefulWidget {
  Requests({Key key}) : super(key: key);

  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  ScrollController controller = ScrollController();
  bool searchrequest = false;
  var pages = 0;
  var ssize = 12;
  bool isserach = false;
  var num = 1;
  String carid;
  String status;
  List<QuotationsRequests> quotations;
  List<QuotationsRequests> serachquotation = [];
  List<Brands> brands = [];
  List<Cars> cars = [];
  String brandid;
  String customermobile;
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          RequestsBloc()..add(GetQuotationEvent('', '', '', pages, ssize, '')),
      child: BlocBuilder<RequestsBloc, RequestsState>(
        builder: (context, state) {
          if (state is RequestsInitial) {
            return Container(
                height: size.height,
                child: Center(child: CircularProgressIndicator()));
          }
          if (state is GetQuotationState) {
            quotations = state.quotation;
            context.read<RequestsBloc>().add(BrandsEvent());
          }
          if (state is BrandsState) {
            brands = state.brands;
          }
          if (state is CarState) {
            cars = state.cars;
          }
          if (state is SerachQuotationState) {
            quotations = state.quotation;
          }
          return SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  container(
                      width: size.width * 0.94,
                      borderRadius: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          container(
                            hight: size.height * 0.06,
                            color: Colors.white,
                            shadow: false,
                            bordercolor: Colors.white,
                            child: Row(
                              children: [
                                text(
                                    fontsize: 25, text: "Request For Quotation")
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (num.isOdd) {
                                isserach = true;
                              } else {
                                isserach = false;
                              }
                              num++;
                              setState(() {});
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                text(
                                    text: "Search with optopns",
                                    color: Colors.blue),
                              ],
                            ),
                          ),
                          isserach ? search(size) : Container(),
                          SizedBox(
                            height: (size.height * 0.01),
                          ),
                          container(
                            color: Colors.grey[300],
                            hight: size.height * 0.04,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                text(text: "Request ID"),
                                text(text: "ProductName"),
                                text(text: "Customername"),
                                text(text: "Status"),
                              ],
                            ),
                          ),
                          NotificationListener<ScrollNotification>(
                              onNotification: (notification) {
                                if (notification is ScrollEndNotification &&
                                    controller.position.extentAfter == 0) {
                                  print("here from listener");
                                  pages++;
                                  if (!searchrequest)
                                    context.read<RequestsBloc>().add(
                                        GetQuotationEvent(
                                            '', '', '', pages, ssize, ''));
                                  else
                                    context.read<RequestsBloc>().add(
                                        SearchQuotationEvent(
                                            brandid != null ? brandid : "",
                                            carid != null ? carid : "",
                                            customermobile != null
                                                ? customermobile
                                                : "",
                                            0,
                                            10,
                                            status));
                                }

                                return false;
                              },
                              child: container(
                                  hight: size.height * 0.5,
                                  child: ListView.builder(
                                    controller: controller,
                                    padding: EdgeInsets.only(
                                      top: 10,
                                    ),
                                    itemCount: quotations.length,
                                    itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => RequestDetails(
                                            quotationsRequests:
                                                quotations[index],
                                          ),
                                        ));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                  height: size.height * 0.06,
                                                  width: size.width * 0.2,
                                                  child: text(
                                                      text:
                                                          "${quotations[index].id}",
                                                      color: Colors.grey[700])),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                  height: size.height * 0.06,
                                                  width: size.width * 0.2,
                                                  child: text(
                                                      text:
                                                          "${quotations[index].products[0].name}",
                                                      color: Colors.grey[700])),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                  height: size.height * 0.06,
                                                  width: size.width * 0.2,
                                                  child: text(
                                                      text:
                                                          "${quotations[index].customer.fullName}",
                                                      color: Colors.grey[700])),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                  height: size.height * 0.06,
                                                  width: size.width * 0.2,
                                                  child: text(
                                                      text:
                                                          "${quotations[index].status}",
                                                      color: Colors.grey[700])),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))),
                        ],
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget search(Size size) {
    return container(
        hight: size.height * 0.4,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Builder(
              builder: (context) => container(
                color: Colors.grey[100],
                child: DropDown(
                  hint: "select brand",
                  list: brands,
                  onchanged: (value) {
                    brandid = value.id.toString();
                    context.read<RequestsBloc>().add(CarsEvent(brandid));
                  },
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            container(
              color: Colors.grey[100],
              child: DropDown(
                hint: "select car",
                list: cars,
                onchanged: (value) {
                  carid = value.id.toString();
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            container(
                hight: size.height * 0.07,
                color: Colors.grey[100],
                child: textform(
                    controller: textEditingController,
                    hint: "customer mobile (Optional))",
                    hintsize: 12,
                    validation: "number",
                    function: (value) {
                      customermobile = value;
                    })),
            SizedBox(
              height: size.height * 0.01,
            ),
            container(
                hight: size.height * 0.07,
                color: Colors.grey[100],
                child: DropDown(
                    list: ["PENDING", "CANCELLED", "REJECTED", "DONE"],
                    hint: "Request Status (Optional))",
                    onchanged: (value) {
                      status = value;
                      print(status);
                    })),
            SizedBox(
              height: size.height * 0.03,
            ),
            Builder(
              builder: (context) => GestureDetector(
                onTap: () {
                  pages = 0;
                  searchrequest = true;
                  context.read<RequestsBloc>().add(SearchQuotationEvent(
                        brandid != null ? brandid : "",
                        carid != null ? carid : "",
                        customermobile != null ? customermobile : "",
                        0,
                        10,
                        status,
                      ));
                },
                child: container(
                    hight: size.height * 0.05,
                    width: size.width * 0.4,
                    borderRadius: 10,
                    color: Colors.orange[900],
                    child: Center(
                      child: text(
                          text: "Search", color: Colors.white, fontsize: 18),
                    )),
              ),
            )
          ],
        ));
  }
}
