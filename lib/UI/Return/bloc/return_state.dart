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

class TalkeToVendorState extends ReturnState {
  final ReturnProcessModel returnProcessModel;
  TalkeToVendorState(this.returnProcessModel);
}

class VendorAcceptDiscountState extends ReturnState {
  final ReturnProcessModel returnProcessModel;
  VendorAcceptDiscountState(this.returnProcessModel);
}

class VendorNotAcceptDiscountState extends ReturnState {
  final ReturnProcessModel returnProcessModel;
  VendorNotAcceptDiscountState(this.returnProcessModel);
}

class IsCustomerAcceptDiscountState extends ReturnState {
  final ReturnProcessModel returnProcessModel;
  IsCustomerAcceptDiscountState(this.returnProcessModel);
}

class AutopartCheckTheProductState extends ReturnState {
  final ReturnProcessModel returnProcessModel;
  AutopartCheckTheProductState(this.returnProcessModel);
}

class IsproductReturnedState extends ReturnState {
  final ReturnProcessModel returnProcessModel;

  IsproductReturnedState(
    this.returnProcessModel,
  );
}

class InformTransportCompanyState extends ReturnState {
  final ReturnProcessModel returnProcessModel;
  InformTransportCompanyState(this.returnProcessModel);
}

class AddNotForTodoState extends ReturnState {
  final ReturnProcessModel returnProcessModel;
  AddNotForTodoState(this.returnProcessModel);
}
