import 'package:admin/UI/Return/bloc/return_bloc.dart';
import 'package:admin/models/GetAllReturn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestInfo extends StatefulWidget {
  final Content returnrequest;
  RequestInfo({Key key, this.returnrequest}) : super(key: key);

  @override
  _RequestInfoState createState() => _RequestInfoState();
}

class _RequestInfoState extends State<RequestInfo> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ReturnBloc(),
      child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Container(
                color: Colors.orange[600],
                child: Text(
                  " Status Info ",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Vendor name   : ${widget.returnrequest.vendor.fullName}"),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                        "Vendor mobile : ${widget.returnrequest.vendor.mobileNumber}"),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                        "Vendor name   : ${widget.returnrequest.customer.fullName}"),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                        "Vendor mobile : ${widget.returnrequest.customer.mobileNumber}"),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                        "Product Name : ${widget.returnrequest.item.product.name}"),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text("Request Status: ${widget.returnrequest.status}"),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text("Request notes  : ${widget.returnrequest.notes}"),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                        "Date                   : ${widget.returnrequest.creationDate.toString().substring(0, 16)}"),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Builder(
                  builder: (context) => InkWell(
                    onTap: () {
                      context
                          .read<ReturnBloc>()
                          .add(TalkeToVendorEvent(widget.returnrequest.id));
                    },
                    child: BlocConsumer<ReturnBloc, ReturnState>(
                      listener: (context, state) {
                        if (state is Error) {
                          return Container(
                              child: Center(child: Text(state.error)));
                        }
                      },
                      builder: (context, state) {
                        if (state is Loading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return Container(
                          height: size.height * 0.06,
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.arrow_forward_ios),
                              Text("Change Status to the Talking Vendor Status")
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
