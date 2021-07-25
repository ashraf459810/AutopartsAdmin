import 'dart:async';

import 'package:admin/Data/Repository/IRepository.dart';
import 'package:admin/models/GetAllReturn.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:admin/injection.dart';
part 'return_event.dart';
part 'return_state.dart';

class ReturnBloc extends Bloc<ReturnEvent, ReturnState> {
  ReturnBloc() : super(ReturnInitial());
  var repo = sl.get<IRepository>();
  @override
  Stream<ReturnState> mapEventToState(
    ReturnEvent event,
  ) async* {
    if (event is GetReturnProductsEvent) {
      yield Loading();
      try {
        var response = await repo.iHttpHlper.getrequest(
            "http://176.31.225.174:8080/autoparts/order/getreturnproducttodos?status=${event.status}&name=${event.name}&phone=${event.number}&fromDate=${event.date1}&toDate=${event.date2}&page=${event.page}&size=${event.ssize}");
        GetAllReturn getAllReturn = getAllReturnFromJson(response);
        print(getAllReturn.content.length);
        yield GetReturnProductsState(getAllReturn);
      } catch (error) {
        yield Error(error);
      }
    }
  }
}
