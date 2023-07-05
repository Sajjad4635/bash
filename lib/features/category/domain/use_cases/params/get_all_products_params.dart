import 'package:equatable/equatable.dart';

class AllProductsParams extends Equatable {
  final int? category;
  final String? name;
  final int? page;
  final int? pageSize;

  const AllProductsParams({
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
