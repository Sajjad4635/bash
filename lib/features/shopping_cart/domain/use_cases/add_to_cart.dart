import 'package:baash/core/error/failures.dart';
import 'package:baash/core/usecases/usecase.dart';
import 'package:baash/features/shopping_cart/domain/entities/add_to_cart_response.dart';
import 'package:baash/features/shopping_cart/domain/entities/get_cart_response.dart';
import 'package:baash/features/shopping_cart/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';

class AddToCartUseCase implements UseCase<AddProductToCartResponse, String> {
  final CartRepository repository;

  AddToCartUseCase(this.repository);

  @override
  Future<Either<Failure, AddProductToCartResponse>> call(String id) async {
    return await repository.addToCart(id);
  }
}
