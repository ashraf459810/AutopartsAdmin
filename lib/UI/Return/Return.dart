import 'package:admin/UI/RequestStatusInfo/RequestInfo.dart';
import 'package:admin/UI/Return/bloc/return_bloc.dart';
import 'package:admin/models/GetAllReturn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Return extends StatefulWidget {
  Return({Key key}) : super(key: key);

  @override
  _ReturnState createState() => _ReturnState();
}

class _ReturnState extends State<Return> {
  DateTime dateTime1;
  DateTime dateTime2;
  String name;
  String chosenstatus;
  bool visible = false;
  int num = 0;
  int number;
  int pages = 0;
  int ssize = 12;
  bool issearch = false;
  ScrollController controller = ScrollController();
  List<Content> returnrequests = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ReturnBloc()
        ..add(GetReturnProductsEvent(
          "",
          "",
          "",
          "",
          pages,
          "",
          ssize,
        )),
      child: Column(
        children: [
          Container(
            height: size.height * 0.05,
            width: size.width,
            color: Colors.white,
            child: Text(
              "  Return Products",
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
                Padding(
                  padding: const EdgeInsets.only(left: 1),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: ListTile(
                            title: Text(
                              "From    ",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange[900]),
                            ),
                            trailing: Icon(Icons.keyboard_arrow_down),
                            onTap: () {
                              _pickeddate();
                            }),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: ListTile(
                          title: Text(
                            "To      ",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange[900]),
                          ),
                          trailing: Icon(Icons.keyboard_arrow_down),
                          onTap: () {
                            _pickeddate2();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  color: Colors.grey[100],
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: " Search by name", border: InputBorder.none),
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
                      number = int.parse(value);
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
                      'TAKE_INFO_FROM_CUSTOMER',
                      ' TAKE_INFO_FROM_VENDOR_AND_ASK_FOR_DISCOUNT',
                      'ASK_CUSTOMER_FOR_DISCOUNT',
                      ' GET_PRODUCT_FROM_CUSTOMER',
                      'CHECK_PRODUCT',
                      'RETURN_PRODUCT_TO_VENDOR',
                      'RETURN_PRODUCT_TO_CUSTOMER',
                      'HANDLE_PAYMENTS',
                      'DONE'
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
                      print("here");
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
                      issearch = true;

                      context.read<ReturnBloc>().add(SearchEvent(
                            dateTime1 != null
                                ? "${dateTime1.year}-${dateTime1.month}-${dateTime1.day}"
                                : "",
                            dateTime2 != null
                                ? "${dateTime2.year}-${dateTime2.month}-${dateTime2.day}"
                                : "",
                            name != null ? name : "",
                            number != null ? number : "",
                            pages,
                            chosenstatus != null ? chosenstatus : "",
                            ssize,
                          ));
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
                        style: TextStyle(color: Colors.white, fontSize: 20),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Date"),
                  Text("       Vendor "),
                  Text("Customer "),
                  Text("Order ID"),
                  Text("Status"),
                ],
              ),
            ),
          ),
          BlocBuilder<ReturnBloc, ReturnState>(
            builder: (context, state) {
              if (state is ReturnInitial) {
                return CircularProgressIndicator();
              }
              if (state is Loading) {
                return CircularProgressIndicator();
              }
              if (state is Error) {
                return Center(child: Text(state.error));
              }
              if (state is GetReturnProductsState) {
                print("here after search");
                returnrequests = state.requests;
                print(returnrequests.length);
              }

              if (state is SearchState) {
                returnrequests = state.requests;
              }
              return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification is ScrollEndNotification &&
                        controller.position.extentAfter == 0) {
                      print("here from listener");
                      pages++;
                      print(pages);
                      if (issearch) {
                        context.read<ReturnBloc>().add(SearchEvent(
                              dateTime1 != null
                                  ? "${dateTime1.year}-${dateTime1.month}-${dateTime1.day}"
                                  : "",
                              dateTime2 != null
                                  ? "${dateTime2.year}-${dateTime2.month}-${dateTime2.day}"
                                  : "",
                              name != null ? name : "",
                              number != null ? number : "",
                              pages,
                              chosenstatus != null ? chosenstatus : "",
                              ssize,
                            ));
                      } else {
                        context.read<ReturnBloc>().add(GetReturnProductsEvent(
                              dateTime1 != null
                                  ? "${dateTime1.year}-${dateTime1.month}-${dateTime1.day}"
                                  : "",
                              dateTime2 != null
                                  ? "${dateTime2.year}-${dateTime2.month}-${dateTime2.day}"
                                  : "",
                              name != null ? name : "",
                              number != null ? number : "",
                              pages,
                              chosenstatus != null ? chosenstatus : "",
                              ssize,
                            ));
                      }
                    }

                    return false;
                  },
                  child: returnrequests.isNotEmpty
                      ? Container(
                          height:
                              visible ? size.height * 0.25 : size.height * 0.5,
                          width: size.width,
                          color: Colors.white,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: ScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            controller: controller,
                            itemCount: returnrequests.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => RequestInfo(
                                      todoid: returnrequests[index].id,
                                      f: () {
                                        context.read<ReturnBloc>().add(
                                            GetReturnProductsEvent(
                                                "", "", "", "", 0, "", 10));
                                      }),
                                ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                        "${returnrequests[index].creationDate.day}/${returnrequests[index].creationDate.month}/${returnrequests[index].creationDate.year}"
                                            .toString()),
                                    Flexible(
                                        child: Container(
                                            width: size.width * 0.2,
                                            child: Text(returnrequests[index]
                                                .vendor
                                                .fullName))),
                                    Flexible(
                                      child: Container(
                                        width: size.width * 0.2,
                                        child: Text(returnrequests[index]
                                            .customer
                                            .fullName),
                                      ),
                                    ),
                                    Text(
                                        "${returnrequests[index].id.toString()}"),
                                    Flexible(
                                      child: Container(
                                        width: size.width * 0.15,
                                        child: Text(
                                          returnrequests[index].status,
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
                        )
                      : Container(
                          child: Center(child: Text("No requests for now")),
                        ));
            },
          )
        ],
      ),
    );
  }

  _pickeddate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: DateTime.now(),
    );
    if (date != null) {
      setState(() {
        dateTime1 = date;
      });
    }
  }

  _pickeddate2() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: DateTime.now(),
    );
    if (date != null) {
      setState(() {
        dateTime2 = date;
      });
    }
  }
}
