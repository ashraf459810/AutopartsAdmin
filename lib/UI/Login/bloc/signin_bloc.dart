import 'dart:async';

import 'package:admin/Data/Repository/IRepository.dart';
import 'package:admin/models/OtpResponse.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:admin/injection.dart';
part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial());
  var repo = sl.get<IRepository>();

  @override
  Stream<SigninState> mapEventToState(
    SigninEvent event,
  ) async* {
    if (event is SignInEvent) {
      yield Loading();
      try {
        String response = await repo.iHttpHlper
            .postrequest("/admin/login?mobileNumber=${event.mobile}");

        yield SignInState(response);
      } catch (error) {
        yield Error("wrong number");
      }
    }

    if (event is CheckCodeEvent) {
      yield Loading();
      try {
        String response = await repo.iHttpHlper.getrequest(
            "/admin/checkotp?mobileNumber=${event.mobile}&code=${event.code}");
        OtpResponse otpResponse = otpResponseFromJson(response);
        await repo.iprefsHelper.savetoken(otpResponse.id.toString());
        await repo.iprefsHelper.setisverify(true);
        yield CheckCodeState(otpResponse);
      } catch (error) {
        yield Error(error.toString());
      }
    }
  }
}
