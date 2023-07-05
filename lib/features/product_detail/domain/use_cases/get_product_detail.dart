import 'package:baash/core/error/failures.dart';
import 'package:baash/core/usecases/usecase.dart';
import 'package:baash/features/product_detail/domain/entities/product_detail_response.dart';
import 'package:baash/features/product_detail/domain/repositories/product_detail_repository.dart';
import 'package:dartz/dartz.dart';

class GetProductDetail implements UseCase<ProductDetailResponse, int> {
  final ProductDetailRepository repository;

  GetProductDetail(this.repository);

  @override
  Future<Either<Failure, ProductDetailResponse>> call(int id) async {
    return await repository.getProductDetail(id);
  }
}
