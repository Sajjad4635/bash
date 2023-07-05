part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAllProductsEvent extends ProductsEvent {
  AllProductsParams params;

  GetAllProductsEvent({required this.params});

  @override
  List<Object> get props => [params];
}
