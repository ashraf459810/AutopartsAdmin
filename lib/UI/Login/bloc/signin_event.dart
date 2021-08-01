part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}

class SignInEvent extends SigninEvent {
  final String mobile;
  SignInEvent(this.mobile);
}

class CheckCodeEvent extends SigninEvent {
  final String mobile;
  final String code;
  CheckCodeEvent(this.code, this.mobile);
}
