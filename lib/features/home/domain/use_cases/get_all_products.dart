import 'package:baash/core/error/failures.dart';
import 'package:baash/core/usecases/usecase.dart';
import 'package:baash/features/home/domain/entities/all_products_response.dart';
import 'package:baash/features/home/domain/repositories/home_repository.dart';
import 'package:baash/features/home/domain/use_cases/params/get_all_products_params.dart';
import 'package:dartz/dartz.dart';

class GetAllProducts implements UseCase<AllProductsResponse, AllProductsParams> {
  final HomeRepository repository;

  GetAllProducts(this.repository);

  @override
  Future<Either<Failure, AllProductsResponse>> call(AllProductsParams params) async {
    return await repository.getAllProducts(params);
  }
}
