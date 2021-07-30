part of 'return_bloc.dart';

@immutable
abstract class ReturnState {}

class ReturnInitial extends ReturnState {}

class GetReturnProductsState extends ReturnState {
  final GetAllReturn getAllReturn;
  final List<Content> requests;
  GetReturnProductsState(this.getAllReturn, this.requests);
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

class AllReturnState extends ReturnState {
  final ReturnRequestModel returnRequestModel;
  AllReturnState(this.returnRequestModel);
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

class GetReturnProductDetailsState extends ReturnState {
  final ReturnRequestModel requestModel;
  GetReturnProductDetailsState(this.requestModel);
}
