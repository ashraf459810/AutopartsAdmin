import 'dart:async';
import 'package:admin/Data/Repository/IRepository.dart';
import 'package:admin/injection.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:admin/models/DueOrdersModel.dart';
part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial());
  var repo = sl.get<IRepository>();
  DueOrders dueOrders;
  @override
  Stream<PaymentState> mapEventToState(
    PaymentEvent event,
  ) async* {
    if (event is OrdersHaveToPayEvent) {
      print("here");
      // yield Loading();
      try {
        var result = await repo.iHttpHlper.getrequest(
            "http://176.31.225.174:8080/autoparts/order/getdueorders?page=${event.page}&size=${event.size}");
        dueOrders = dueOrdersFromJson(result);
        yield OrdersHaveToPayState(dueOrders);
      } catch (e) {
        yield Error(e.toString());
      }
    }
  }
}
