import 'package:baash/core/error/failures.dart';
import 'package:baash/core/usecases/usecase.dart';
import 'package:baash/features/product_detail/domain/repositories/product_detail_repository.dart';
import 'package:baash/features/shopping_cart/domain/entities/add_to_cart_response.dart';
import 'package:dartz/dartz.dart';

class AddToCartDetailPageUseCase implements UseCase<AddProductToCartResponse, String> {
  final ProductDetailRepository repository;

  AddToCartDetailPageUseCase(this.repository);

  @override
  Future<Either<Failure, AddProductToCartResponse>> call(String id) async {
    return await repository.addToCart(id);
  }
}
