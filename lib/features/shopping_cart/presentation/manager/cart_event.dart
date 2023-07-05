part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCartEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final String id;

  AddToCartEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class DeleteFromCartEvent extends CartEvent {
  final String id;

  DeleteFromCartEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class CreatePaymentEvent extends CartEvent {
  final CreatePaymentParams params;

  CreatePaymentEvent({
    required this.params,
  });

  @override
  List<Object> get props => [params];
}
