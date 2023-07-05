part of 'product_detail_bloc.dart';

@immutable
abstract class ProductDetailEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetProductDetailEvent extends ProductDetailEvent {
  final int id;

  GetProductDetailEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class AddToCartDetailPageEvent extends ProductDetailEvent {
  final String id;

  AddToCartDetailPageEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class GetUserProfileEvent extends ProductDetailEvent {}
