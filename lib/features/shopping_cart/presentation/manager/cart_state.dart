part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends CartState {}

class GetCartLoading extends CartState {}

class CartReceived extends CartState {
  final GetCartResponse cartResponse;

  CartReceived({required this.cartResponse});

  @override
  List<Object> get props => [cartResponse];
}

class GetCartError extends CartState {
  final String message;

  GetCartError({required this.message});

  @override
  List<Object> get props => [message];
}
//*********************************************

class AddToCartLoading extends CartState {}

class AddedToCart extends CartState {
  final AddProductToCartResponse addProductToCart;

  AddedToCart({required this.addProductToCart});

  @override
  List<Object> get props => [addProductToCart];
}

class AddToCartError extends CartState {
  final String message;

  AddToCartError({required this.message});

  @override
  List<Object> get props => [message];
}
//*********************************************

class DeleteFromCartLoading extends CartState {}

class DeletedFromCart extends CartState {
  final String status;

  DeletedFromCart({required this.status});

  @override
  List<Object> get props => [status];
}

class DeleteFromCartError extends CartState {
  final String message;

  DeleteFromCartError({required this.message});

  @override
  List<Object> get props => [message];
}

//*********************************************
class CreatePaymentLoading extends CartState {}

class PaymentCreated extends CartState {
  final PaymentResponse payment;

  PaymentCreated({required this.payment});

  @override
  List<Object> get props => [payment];
}

class CreatePaymentError extends CartState {
  final String message;

  CreatePaymentError({required this.message});

  @override
  List<Object> get props => [message];
}
//*********************************************
