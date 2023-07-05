import 'package:baash/core/error/failures.dart';
import 'package:baash/core/usecases/usecase.dart';
import 'package:baash/features/shopping_cart/domain/entities/payment_response.dart';
import 'package:baash/features/shopping_cart/domain/repositories/cart_repository.dart';
import 'package:baash/features/shopping_cart/domain/use_cases/params/payment_params.dart';
import 'package:dartz/dartz.dart';

class CreatePaymentUseCase implements UseCase<PaymentResponse, CreatePaymentParams> {
  final CartRepository repository;

  CreatePaymentUseCase(this.repository);

  @override
  Future<Either<Failure, PaymentResponse>> call(CreatePaymentParams params) async {
    return await repository.createPayment(params);
  }
}
