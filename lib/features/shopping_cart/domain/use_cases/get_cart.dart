import 'package:baash/core/error/failures.dart';
import 'package:baash/core/usecases/usecase.dart';
import 'package:baash/features/shopping_cart/domain/entities/get_cart_response.dart';
import 'package:baash/features/shopping_cart/domain/repositories/cart_repository.dart';
import 'package:dartz/dartz.dart';

class GetCartUseCase implements UseCase<GetCartResponse, NoParams> {
  final CartRepository repository;

  GetCartUseCase(this.repository);

  @override
  Future<Either<Failure, GetCartResponse>> call(NoParams params) async {
    return await repository.getCart();
  }
}
