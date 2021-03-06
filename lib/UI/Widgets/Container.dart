import 'package:flutter/material.dart';

Widget container({
  double hight,
  double width,
  double borderRadius,
  Color color,
  Color bordercolor,
  Widget child,
  bool shadow,
}) {
  return Container(
    height: hight,
    width: width,
    child: Center(child: child),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadius ?? 0),
      ),
      border: Border.all(color: bordercolor ?? Colors.white),
      boxShadow: [
        shadow ?? false
            ? BoxShadow(
                color: Colors.grey[400].withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 6,
                offset: Offset(0, 1), // changes position of shadow
              )
            : BoxShadow(color: Colors.white)
      ],
      color: color ?? Colors.white,
    ),
  );
}
