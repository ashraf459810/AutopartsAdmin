part of 'return_bloc.dart';

@immutable
abstract class ReturnState {}

class ReturnInitial extends ReturnState {}

class GetReturnProductsState extends ReturnState {
  final GetAllReturn getAllReturn;
  GetReturnProductsState(this.getAllReturn);
}

class Loading extends ReturnState {}

class Error extends ReturnState {
  final String error;
  Error(this.error);
}
