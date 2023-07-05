import 'package:baash/core/error/failures.dart';
import 'package:baash/core/usecases/usecase.dart';
import 'package:baash/features/shopping_cart/domain/entities/add_to_cart_response.dart';
import 'package:baash/features/shopping_cart/domain/entities/get_cart_response.dart';
import 'package:baash/features/shopping_cart/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteFromCartUseCase implements UseCase<String, String> {
  final CartRepository repository;

  DeleteFromCartUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(String id) async {
    return await repository.deleteFromCart(id);
  }
}
