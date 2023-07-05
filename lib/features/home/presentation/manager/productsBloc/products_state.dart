part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends ProductsState {}

class GetAllProductsLoading extends ProductsState {}

class AllProductsReceived extends ProductsState {
  final AllProductsResponse allProducts;

  AllProductsReceived({required this.allProducts});

  @override
  List<Object> get props => [allProducts];
}

class GetAllProductsError extends ProductsState {
  final String message;

  GetAllProductsError({required this.message});

  @override
  List<Object> get props => [message];
}

class GetCartInquiryTLoading extends ProductsState {}

class CartInquiryTReceived extends ProductsState {
  final CartInquiryResponse cartInquiry;

  CartInquiryTReceived({required this.cartInquiry});

  @override
  List<Object> get props => [cartInquiry];
}

class GetCartInquiryTError extends ProductsState {
  final String message;

  GetCartInquiryTError({required this.message});

  @override
  List<Object> get props => [message];
}
