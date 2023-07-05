import 'package:baash/core/error/failures.dart';
import 'package:baash/core/usecases/usecase.dart';
import 'package:baash/features/home/domain/entities/cart_inquiry_response.dart';
import 'package:baash/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class CartInquiryUseCase implements UseCase<CartInquiryResponse, NoParams> {
  final HomeRepository repository;

  CartInquiryUseCase(this.repository);

  @override
  Future<Either<Failure, CartInquiryResponse>> call(NoParams params) async {
    return await repository.cartInquiry();
  }
}
