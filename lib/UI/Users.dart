import 'package:admin/UI/Charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Users extends StatefulWidget {
  Users({Key key}) : super(key: key);

  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  TextEditingController controller = TextEditingController();
  String fullname;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  height: size.height * 0.6,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width * 0.5,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                              "New Users",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 22),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: size.height * 0.38,
                            child: ListView.builder(
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.05,
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              child: CircleAvatar(
                                                  backgroundColor: Colors.blue,
                                                  backgroundImage: NetworkImage(
                                                      "https://static01.nyt.com/images/2020/11/17/business/17techhearing-facebookpreview/17techhearing-facebookpreview-mediumSquareAt3X.jpg")),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: size.width * 0.05,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Financial Controller",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.orange[700]),
                                            ),
                                            Text(
                                              "Mitchell Williamson",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.black87),
                                            ),
                                            Text(
                                              "User ID#01223",
                                              style: TextStyle(
                                                  fontSize: 9,
                                                  color: Colors.grey),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: size.width * 0.3,
                                        ),
                                        SvgPicture.asset(
                                            "lib/assets/Icons - Navigation icon (12 states).svg",
                                            height: size.height * 0.03,
                                            width: size.width * 0.04)
                                      ],
                                    ),
                                 
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                         
                        ],
                      ),
                       Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: size.width * 0.06,
                              ),
                              Container(
                                width: size.width * 0.3,
                                child: Text(
                                  "Add new user ",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.blue,
                              )
                            ],
                          )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: size.height * 0.53,
            width: size.width * 0.9,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width * 0.6,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "New Customer",
                      style: TextStyle(color: Colors.black87, fontSize: 22),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: size.height * 0.3,
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.05,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        child: CircleAvatar(
                                            backgroundColor: Colors.blue,
                                            backgroundImage: NetworkImage(
                                                "https://static01.nyt.com/images/2020/11/17/business/17techhearing-facebookpreview/17techhearing-facebookpreview-mediumSquareAt3X.jpg")),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * 0.05,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Financial Controller",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black87),
                                      ),
                                      Text(
                                        "",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black87),
                                      ),
                                      Text(
                                        "User ID#01223",
                                        style: TextStyle(
                                            fontSize: 9, color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * 0.2,
                                  ),
                                  Text("Vendor")
                                  // SvgPicture.asset("lib/assets/Icons - Navigation icon (12 states).svg",height: size.height*0.03,width: size.width* 0.04)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: size.width * 0.06,
                        ),
                        Container(
                          width: size.width * 0.3,
                          child: Text(
                            "More Insights ",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.blue,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: size.width * 0.54,
                  child: Center(
                      child: Text("Search for user",
                          style: TextStyle(
                              fontSize: 22, color: Colors.blueGrey[700])))),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            width: size.width *0.9,
           
            decoration: BoxDecoration(shape: BoxShape.rectangle,color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 8, right: 16, top: 8, bottom: 8),
                    child: Image.asset(
                      "lib/assets/Profile.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          children: [
                            Container(
                              width: size.width * 0.6,
                              child: Text(
                                'Enter User ID Number',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.black87),
                              ),
                            ),
                          ],
                        ),
                        Container(
                            width: size.width * 0.6,
                            height: size.height * 0.04,
                            alignment: Alignment.centerLeft,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: controller,
                              autofocus: false,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '12345',
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 16),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  fullname = value;
                                });
                              },
                              onSaved: (value) => fullname = value,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: size.height *0.04,),

          InkWell(onTap: (){
            if (fullname != null){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Charts(),));
            }
            else {
            Fluttertoast.showToast(
        msg: "please enter ID number",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
       
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
            }
          },
            child: Container(child: Center(child: Text("Search",style: TextStyle(color: Colors.white,fontSize: 20),)),
              height: size.height *0.06,
            width: size.width *0.8,
            decoration: BoxDecoration(color: Colors.orange[900],borderRadius: BorderRadius.all(Radius.circular(40)),),
            
            ),
          ),
          SizedBox(height: size.height *0.02,)
          ],
      ),
    );
  }
}
