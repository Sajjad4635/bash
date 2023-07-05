part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends CategoryState {}

class GetCategoryListLoading extends CategoryState {}

class CategoryListReceived extends CategoryState {
  final CategoryListResponse categoryList;

  CategoryListReceived({required this.categoryList});

  @override
  List<Object> get props => [categoryList];
}

class GetCategoryListError extends CategoryState {
  final String message;

  GetCategoryListError({required this.message});

  @override
  List<Object> get props => [message];
}

class GetCartInquiryCLoading extends CategoryState {}

class CartInquiryCReceived extends CategoryState {
  final CartInquiryResponse cartInquiry;

  CartInquiryCReceived({required this.cartInquiry});

  @override
  List<Object> get props => [cartInquiry];
}

class GetCartInquiryCError extends CategoryState {
  final String message;

  GetCartInquiryCError({required this.message});

  @override
  List<Object> get props => [message];
}
