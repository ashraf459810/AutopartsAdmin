part of 'signin_bloc.dart';

@immutable
abstract class SigninState {}

class SigninInitial extends SigninState {}

class Error extends SigninState {
  final String error;
  Error(this.error);
}

class Loading extends SigninState {}

class SignInState extends SigninState {
  final String result;
  SignInState(this.result);
}

class CheckCodeState extends SigninState {
  final OtpResponse otpResponse;
  CheckCodeState(this.otpResponse);
}
