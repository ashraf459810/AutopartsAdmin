import 'dart:async';

import 'package:admin/Data/Repository/IRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../injection.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial());
  var repo = sl.get<IRepository>();
  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is IsVerifyEvent) {
      // try {
      var isverify = await repo.iprefsHelper.getisverify();

      yield IsVerifyState(isverify);
      // } catch (e) {
      //   yield Error(e.toString());
      // }
    }
  }
}
