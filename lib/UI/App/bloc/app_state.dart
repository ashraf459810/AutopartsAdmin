part of 'app_bloc.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class IsVerifyState extends AppState {
  final bool isverify;
  IsVerifyState(this.isverify);
}

class Error extends AppState {
  final String error;
  Error(this.error);
}
