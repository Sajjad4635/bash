import 'package:baash/core/error/failures.dart';
import 'package:baash/core/network/network_info.dart';
import 'package:baash/features/shopping_cart/data/data_sources/cart_api.dart';
import 'package:baash/features/shopping_cart/data/models/add_to_cart_response_model.dart';
import 'package:baash/features/shopping_cart/data/models/get_cart_response_model.dart';
import 'package:baash/features/shopping_cart/data/models/payment_response_model.dart';
import 'package:baash/features/shopping_cart/domain/repositories/cart_repository.dart';
import 'package:baash/features/shopping_cart/domain/use_cases/params/payment_params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/string_consts.dart';
import '../../../../core/error/exceptions.dart';

class CartRepositoryImpl implements CartRepository {
  final CartApi cartApi;
  final NetworkInfo networkInfo;

  CartRepositoryImpl({required this.cartApi, required this.networkInfo});

  @override
  Future<Either<Failure, GetCartResponseModel>> getCart() async {
    var value = await networkInfo.isConnected;
    if (value) {
      try {
        var response = await cartApi.getCart();
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

  @override
  Future<Either<Failure, AddProductToCartResponseModel>> addToCart(String id) async {
    var value = await networkInfo.isConnected;
    if (value) {
      try {
        var response = await cartApi.addToCart(id);
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

  @override
  Future<Either<Failure, String>> deleteFromCart(String id) async {
    var value = await networkInfo.isConnected;
    if (value) {
      try {
        var response = await cartApi.deleteFromCart(id);
        if (response == 'true') {
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
  Future<Either<Failure, PaymentResponseModel>> createPayment(CreatePaymentParams params) async {
    var value = await networkInfo.isConnected;
    if (value) {
      try {
        var response = await cartApi.createPayment(params);
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
