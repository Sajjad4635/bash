part of 'product_detail_bloc.dart';

abstract class ProductDetailState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends ProductDetailState {}

class GetProductDetailLoading extends ProductDetailState {}

class ProductDetailReceived extends ProductDetailState {
  final ProductDetailResponse allProducts;

  ProductDetailReceived({required this.allProducts});

  @override
  List<Object> get props => [allProducts];
}

class GetProductDetailError extends ProductDetailState {
  final String message;

  GetProductDetailError({required this.message});

  @override
  List<Object> get props => [message];
}
//************************************************************

class AddToCartDetailPageLoading extends ProductDetailState {}

class AddedToCartDetailPage extends ProductDetailState {
  final AddProductToCartResponse addProductToCart;

  AddedToCartDetailPage({required this.addProductToCart});

  @override
  List<Object> get props => [addProductToCart];
}

class AddToCartDetailPageError extends ProductDetailState {
  final String message;

  AddToCartDetailPageError({required this.message});

  @override
  List<Object> get props => [message];
}
//*******************************************

class GetUserProfileLoading extends ProductDetailState {}

class UserProfileReceived extends ProductDetailState {
  final UserProfileResponse userProfile;

  UserProfileReceived({required this.userProfile});

  @override
  List<Object> get props => [userProfile];
}

class GetUserProfileError extends ProductDetailState {
  final String message;

  GetUserProfileError({required this.message});

  @override
  List<Object> get props => [message];
}
