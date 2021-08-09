import 'package:admin/UI/Widgets/Container.dart';
import 'package:admin/UI/Widgets/Text.dart';
import 'package:flutter/material.dart';

import 'RequestDetails.dart';

class Requests extends StatefulWidget {
  Requests({Key key}) : super(key: key);

  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.04,
        ),
        container(
          hight: size.height * 0.67,
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
                  children: [text(fontsize: 25, text: "Request For Quotation")],
                ),
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
              container(
                  hight: size.height * 0.5,
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    itemCount: 20,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RequestDetails(),
                        ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: size.height * 0.06,
                              width: size.width * 0.2,
                              child: Flexible(
                                  child: text(
                                      text: "Request ID",
                                      color: Colors.grey[700]))),
                          Container(
                              height: size.height * 0.06,
                              width: size.width * 0.2,
                              child: Flexible(
                                  child: text(
                                      text: "Request ID",
                                      color: Colors.grey[700]))),
                          Container(
                              height: size.height * 0.06,
                              width: size.width * 0.2,
                              child: Flexible(
                                  child: text(
                                      text: "Request ID",
                                      color: Colors.grey[700]))),
                          Container(
                              height: size.height * 0.06,
                              width: size.width * 0.2,
                              child: Flexible(
                                  child: text(
                                      text: "Request ID",
                                      color: Colors.grey[700]))),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
