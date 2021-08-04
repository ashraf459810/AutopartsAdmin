import 'package:admin/UI/App/bloc/app_bloc.dart';
import 'package:admin/UI/HomePage.dart';
import 'package:admin/UI/Login/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc()..add(IsVerifyEvent()),
      child: Scaffold(
          body: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state is Error) {
            return Center(child: Text(state.error));
          }
          if (state is IsVerifyState) {
            if (state.isverify == true) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
            } else
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => SignInTab(),
              ));
          }
        },
        child: Container(),
      )),
    );
  }
}
