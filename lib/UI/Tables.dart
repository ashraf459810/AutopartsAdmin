import 'package:flutter/material.dart';

class Tables extends StatefulWidget {
  Tables({Key key}) : super(key: key);

  @override
  _TablesState createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  bool con1 = false;
  bool con2 = false;
  bool con3 = false;
    bool con4 = false;
  bool con5 = false;
  bool con6 = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Container(
      height: size.height,
      width: size.width,
      child: Column(children: [
        SizedBox(
          height: size.height * 0.02,
        ),
        Container(
          height: size.height * 0.46,
          width: size.width * 0.9,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  Container(
                      width: size.width * 0.4,
                      child: Center(child: Text("Top Customer Rate"))),
                  SizedBox(
                    width: size.width * 0.11,
                  ),
                  GestureDetector(
                    onTap: () {
                      con1 = true;
                      con2 = false;
                      con3 = false;
                      setState(() {});
                    },
                    child: Container(
                      height: size.height * 0.05,
                      width: size.width * 0.12,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.green[100]),
                          color: con1 ? Colors.orange : Colors.white),
                      child: Center(
                        child: Text(
                          "Last Day",
                          style: TextStyle(fontSize: 8),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      con1 = false;
                      con2 = true;
                      con3 = false;
                      setState(() {});
                    },
                    child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.12,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.green[100],
                            ),
                            color: con2 ? Colors.orange : Colors.white),
                        child: Center(
                            child: Text("Last Week",
                                style: TextStyle(fontSize: 8)))),
                  ),
                  GestureDetector(
                    onTap: () {
                      con1 = false;
                      con2 = false;
                      con3 = true;
                      setState(() {});
                    },
                    child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.12,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(color: Colors.green[100]),
                            color: con3 ? Colors.orange : Colors.white),
                        child: Center(
                          child: Text(
                            "Last Month",
                            style: TextStyle(fontSize: 8),
                          ),
                        )),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                height: size.height * 0.04,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(2))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Customer name        ", style: TextStyle(fontSize: 9)),
                    Text("Purchases         ", style: TextStyle(fontSize: 9)),
                    Text("BOUNCE RATE", style: TextStyle(fontSize: 9)),
                    Text("Products Number", style: TextStyle(fontSize: 9))
                  ],
                ),
              ),

              Container(
                height: size.height * 0.3,
                width: size.width * 0.9,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    
                    return Padding(
                      padding: const EdgeInsets.only(right:15.0),
                      child: Row(   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Mhmd Ali"),
                          Row(
                            children: [
                              Text("67,892 ",style: TextStyle(fontSize: 9)),
                        Text("9.3%",style: TextStyle(fontSize: 7),),
                        Icon(Icons.arrow_drop_up_sharp,color: Colors.green,)
                            ],
                          ),

                          Text("26.3%"),
                          Text("1132")
                        ],
                       

                      ),
                    );
                  },
                ),
              )
            ],
          ),
        )
     ,
     SizedBox(height: size.height *0.02,),


             Container(
          height: size.height * 0.46,
          width: size.width * 0.9,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  Container(
                      width: size.width * 0.4,
                      child: Center(child: Text("Top Vendor Rate"))),
                  SizedBox(
                    width: size.width * 0.11,
                  ),
                  GestureDetector(
                    onTap: () {
                      con4 = true;
                      con5 = false;
                      con6 = false;
                      setState(() {});
                    },
                    child: Container(
                      height: size.height * 0.05,
                      width: size.width * 0.12,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.green[100]),
                          color: con4 ? Colors.orange : Colors.white),
                      child: Center(
                        child: Text(
                          "Last Day",
                          style: TextStyle(fontSize: 8),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      con4 = false;
                      con5 = true;
                      con6 = false;
                      setState(() {});
                    },
                    child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.12,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.green[100],
                            ),
                            color: con5 ? Colors.orange : Colors.white),
                        child: Center(
                            child: Text("Last Week",
                                style: TextStyle(fontSize: 8)))),
                  ),
                  GestureDetector(
                    onTap: () {
                      con4 = false;
                      con5 = false;
                      con6 = true;
                      setState(() {});
                    },
                    child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.12,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(color: Colors.green[100]),
                            color: con6 ? Colors.orange : Colors.white),
                        child: Center(
                          child: Text(
                            "Last Month",
                            style: TextStyle(fontSize: 8),
                          ),
                        )),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                height: size.height * 0.04,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(2))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("  Vendor Name        ", style: TextStyle(fontSize: 9)),
                    Text("Purchases         ", style: TextStyle(fontSize: 9)),
                    Text("BOUNCE RATE", style: TextStyle(fontSize: 9)),
                    Text("Products Number", style: TextStyle(fontSize: 9))
                  ],
                ),
              ),

              Container(
                height: size.height * 0.3,
                width: size.width * 0.9,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    
                    return Padding(
                      padding: const EdgeInsets.only(right:15.0),
                      child: Row(   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Mhmd Ali"),
                          Row(
                            children: [
                              Text("67,892 ",style: TextStyle(fontSize: 9)),
                        Text("9.3%",style: TextStyle(fontSize: 7),),
                        Icon(Icons.arrow_drop_up_sharp,color: Colors.green,)
                            ],
                          ),

                          Text("26.3%"),
                          Text("1132")
                        ],
                       

                      ),
                    );
                  },
                ),
              )
            ],
          ),
        )
     
     
      ]),
    ));
  }
}
