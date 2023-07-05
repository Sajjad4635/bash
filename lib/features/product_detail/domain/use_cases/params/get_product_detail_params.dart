import 'package:equatable/equatable.dart';

class ProductDetailParams extends Equatable {
  final int? category;
  final String? name;
  final int? page;
  final int? pageSize;

  const ProductDetailParams({
    this.category,
    this.name,
    this.page,
    this.pageSize,
  });

  @override
  List<Object?> get props => [
        category,
        name,
        page,
        pageSize,
      ];
}
