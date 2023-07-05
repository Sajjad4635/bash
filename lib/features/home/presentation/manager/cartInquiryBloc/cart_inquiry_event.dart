part of 'cart_inquiry_bloc.dart';

@immutable
abstract class cartInquirysEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCartInquiryEvent extends cartInquirysEvent {}
