part of 'cart_inquiry_bloc.dart';

abstract class cartInquiryState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends cartInquiryState {}

class GetCartInquiryLoading extends cartInquiryState {}

class CartInquiryReceived extends cartInquiryState {
  final CartInquiryResponse cartInquiry;

  CartInquiryReceived({required this.cartInquiry});

  @override
  List<Object> get props => [cartInquiry];
}

class GetCartInquiryError extends cartInquiryState {
  final String message;

  GetCartInquiryError({required this.message});

  @override
  List<Object> get props => [message];
}
