import 'package:flutter/material.dart';

class Textt extends StatefulWidget {
  Textt({Key key}) : super(key: key);

  @override
  _TexttState createState() => _TexttState();
}

class _TexttState extends State<Textt> {
  @override
  Widget build(BuildContext context) {
    return text();
  }
}

Widget text(
    {String text, Color color, double fontsize, FontWeight fontWeight}) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: fontsize, fontWeight: fontWeight),
  );
}
