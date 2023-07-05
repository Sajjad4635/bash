import 'package:baash/features/shopping_cart/domain/entities/add_to_cart_response.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/product_detail_response.dart';

abstract class ProductDetailRepository {
  Future<Either<Failure, ProductDetailResponse>> getProductDetail(int id);

  Future<Either<Failure, AddProductToCartResponse>> addToCart(String id);
}
