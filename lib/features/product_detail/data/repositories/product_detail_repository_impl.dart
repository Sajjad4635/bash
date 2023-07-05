import 'package:baash/core/error/failures.dart';
import 'package:baash/core/network/network_info.dart';
import 'package:baash/features/product_detail/data/data_sources/product_detail_api.dart';
import 'package:baash/features/product_detail/data/models/product_detail_response_model.dart';
import 'package:baash/features/product_detail/domain/repositories/product_detail_repository.dart';
import 'package:baash/features/shopping_cart/data/models/add_to_cart_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/string_consts.dart';
import '../../../../core/error/exceptions.dart';

class ProductDetailRepositoryImpl implements ProductDetailRepository {
  final ProductDetailApi productDetailApi;
  final NetworkInfo networkInfo;

  ProductDetailRepositoryImpl({required this.productDetailApi, required this.networkInfo});

  @override
  Future<Either<Failure, ProductDetailResponseModel>> getProductDetail(int id) async {
    var value = await networkInfo.isConnected;
    if (value) {
      try {
        var response = await productDetailApi.getProductDetail(id);
        if (response.message != null) {
          return Right(response);
        } else {
          return Left(ApiFailure(message: SERVER_ERROR));
        }
      } on ServerException catch (e) {
        debugPrint(e.toString());
        return const Left(ServerFailure(message: SERVER_ERROR));
      }
    } else {
      return const Left(InternetFailure(message: NO_INTERNET));
    }
  }

  @override
  Future<Either<Failure, AddProductToCartResponseModel>> addToCart(String id) async {
    var value = await networkInfo.isConnected;
    if (value) {
      try {
        var response = await productDetailApi.addToCart(id);
        if (response.success) {
          return Right(response);
        } else {
          return Left(ApiFailure(message: SERVER_ERROR));
        }
      } on ServerException catch (e) {
        debugPrint(e.toString());
        return const Left(ServerFailure(message: SERVER_ERROR));
      }
    } else {
      return const Left(InternetFailure(message: NO_INTERNET));
    }
  }
}
