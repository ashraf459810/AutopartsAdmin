import 'package:admin/UI/Login/Login.dart';
import 'package:admin/injection.dart';
import 'package:flutter/material.dart';

import 'UI/App/App.dart';

Future<void> main() async {
  await iniGetIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: App(),
    );
  }
}
