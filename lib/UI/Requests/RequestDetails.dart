import 'package:admin/UI/Widgets/Container.dart';
import 'package:admin/UI/Widgets/Text.dart';
import 'package:flutter/material.dart';

class RequestDetails extends StatefulWidget {
  RequestDetails({Key key}) : super(key: key);

  @override
  _RequestDetailsState createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Image.asset(
                  "lib/assets/cover.png",
                  fit: BoxFit.cover,
                ))
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
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
                  itemBuilder: (context, index) {
                    return container(
                        hight: size.height * 0.2,
                        child: Column(
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    text(
                                        text: "  Offer${index + 1}",
                                        color: Colors.blueAccent[400])
                                  ],
                                ),
                                SizedBox(
                                  width: size.width * 0.2,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    text(
                                        text: "Vendor Name : Rahb Ahmad",
                                        fontsize: 15),
                                    text(
                                        text: "Price : 1210.00 AED",
                                        color: Colors.orange[900]),
                                    text(
                                        text: "Product Type : New",
                                        color: Colors.green),
                                    text(text: "Warranty : 3 months"),
                                    text(text: "7 Sep, 2020"),
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
                ))
          ],
        ),
      ),
    );
  }
}
