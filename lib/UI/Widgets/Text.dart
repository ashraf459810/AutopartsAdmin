import 'package:flutter/material.dart';

Widget text(
    {String text,
    Color color,
    double fontsize,
    FontWeight fontWeight,
    String fontfamily}) {
  return Text(
    text,
    // overflow: TextOverflow.ellipsis,
    style: TextStyle(
        fontFamily: "font",
        color: color,
        fontSize: fontsize,
        fontWeight: fontWeight ?? FontWeight.normal),
  );
}
