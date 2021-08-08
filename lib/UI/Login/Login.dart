// ignore: must_be_immutable
import 'package:admin/UI/Login/bloc/signin_bloc.dart';
import 'package:admin/UI/Wisdgets/Container.dart';
import 'package:admin/UI/Wisdgets/Dropdown.dart';
import 'package:admin/UI/Wisdgets/Text.dart';

import 'package:admin/UI/codeVerfication/VerficationCode.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInTab extends StatefulWidget {
  @override
  _SignInTabState createState() => _SignInTabState();
}

class _SignInTabState extends State<SignInTab> {
  bool selected = false;
  List<Test> lii = [Test(1, "name"), Test(2, "name2"), Test(4, "name4")];
  var model;
  String hint = "s";
  String mobileNumber;

  final formKey = GlobalKey<FormState>();
  TextEditingController mobileNumbercontroller = TextEditingController();
  FocusNode f1 = FocusNode();

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var chosenvalue;
    return BlocProvider(
        create: (context) => SigninBloc(),
        child: Scaffold(
          body: Container(
            child: Column(
              children: [
                Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/assets/login_bg.png'),
                          fit: BoxFit.fill)),
                  child: Column(
                    children: [
                      Container(
                        width: size.width,
                        child: Image.asset(
                          'lib/assets/logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Card(
                        child: Container(
                          height: size.height * 0.13,
                          width: size.width * 0.9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: size.height * 0.02),
                              Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.04,
                                  ),
                                  Container(
                                    child: Text(
                                      'Mobile Number',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.orange[900]),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.04,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.1,
                                  ),
                                  SizedBox(
                                    child: Container(
                                        width: size.width * 0.4,
                                        height: 35,
                                        alignment: Alignment.centerLeft,
                                        child: Form(
                                          key: formKey,
                                          child: TextFormField(
                                              validator: (value) {
                                                if (value.startsWith("0")) {
                                                  return "no need for the first digit";
                                                }
                                                if (value.isEmpty) {
                                                  return "please fill the number";
                                                }
                                                if (value.length > 10) {
                                                  return "please check number";
                                                }
                                                return null;
                                              },
                                              focusNode: f1,
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  mobileNumbercontroller,
                                              autofocus: false,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    left: 15, bottom: 10),
                                                border: InputBorder.none,
                                                hintText: '999999999',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[400],
                                                    fontSize: 16),
                                              ),
                                              onSaved: (newValue) =>
                                                  mobileNumber = newValue,
                                              onChanged: (text) {
                                                setState(() {
                                                  mobileNumber = text;
                                                });
                                              }),
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.2,
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      SizedBox(
                        height: 21,
                      ),
                      BlocConsumer<SigninBloc, SigninState>(
                        builder: (context, state) {
                          if (state is Loading) {
                            return CircularProgressIndicator();
                          }
                          return signButton(size.width);
                        },
                        listener: (context, state) {
                          if (state is Error) {
                            Fluttertoast.showToast(
                                msg: state.error,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                          if (state is SignInState) {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => VerifyEmailScreen(
                                mobile: "971" + mobileNumber,
                              ),
                            ));
                          }
                        },
                      ),
                      SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  InputDecoration fieldDecoration(String hint) {
    return InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 16),
//        filled: true,
        fillColor: Colors.white);
  }

  Widget signButton(double s) {
    return Builder(
      builder: (context) {
        return InkWell(
          onTap: () {
            if (formKey.currentState.validate() && mobileNumber != null) {
              context.read<SigninBloc>().add(SignInEvent("971" + mobileNumber));
            } else {
              Fluttertoast.showToast(
                  msg: "please fill all the fields",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          child: Container(
            width: s * 0.9,
            decoration: BoxDecoration(
              color: Colors.orange[700],
              //                      color: orange,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: false,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(200),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.orange,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(200),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.orange,
                        size: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class Test {
  int id;
  String name;
  Test(this.id, this.name);
}
