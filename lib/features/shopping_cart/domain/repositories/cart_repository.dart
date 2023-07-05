import 'package:baash/features/shopping_cart/domain/entities/add_to_cart_response.dart';
import 'package:baash/features/shopping_cart/domain/entities/get_cart_response.dart';
import 'package:baash/features/shopping_cart/domain/entities/payment_response.dart';
import 'package:baash/features/shopping_cart/domain/use_cases/params/payment_params.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class CartRepository {
  Future<Either<Failure, GetCartResponse>> getCart();

  Future<Either<Failure, AddProductToCartResponse>> addToCart(String id);

  Future<Either<Failure, String>> deleteFromCart(String id);

  Future<Either<Failure, PaymentResponse>> createPayment(CreatePaymentParams params);
}
