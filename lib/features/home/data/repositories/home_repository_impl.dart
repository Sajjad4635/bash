import 'package:baash/core/error/failures.dart';
import 'package:baash/core/network/network_info.dart';
import 'package:baash/features/home/data/data_sources/home_api.dart';
import 'package:baash/features/home/data/models/all_products_response_model.dart';
import 'package:baash/features/home/data/models/banners_response_model.dart';
import 'package:baash/features/home/data/models/cart_inquiry_response_model.dart';
import 'package:baash/features/home/data/models/category_list_response_model.dart';
import 'package:baash/features/home/domain/repositories/home_repository.dart';
import 'package:baash/features/home/domain/use_cases/params/get_all_products_params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/string_consts.dart';
import '../../../../core/error/exceptions.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeApi homeApi;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl({required this.homeApi, required this.networkInfo});

  @override
  Future<Either<Failure, BannersResponseModel>> getBanners() async {
    var value = await networkInfo.isConnected;
    if (value) {
      try {
        var response = await homeApi.getBanners();
        if (response.success) {
          return Right(response);
        } else {
          return const Left(ApiFailure(message: SERVER_ERROR));
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
  Future<Either<Failure, CartInquiryResponseModel>> cartInquiry() async {
    var value = await networkInfo.isConnected;
    if (value) {
      try {
        var response = await homeApi.cartInquiry();
        if (response.success!) {
          return Right(response);
        } else {
          return const Left(ApiFailure(message: SERVER_ERROR));
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
  Future<Either<Failure, AllProductsResponseModel>> getAllProducts(AllProductsParams params) async {
    var value = await networkInfo.isConnected;
    if (value) {
      try {
        var response = await homeApi.getAllProducts(params);
        if (response.success) {
          return Right(response);
        } else {
          return const Left(ApiFailure(message: SERVER_ERROR));
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
  Future<Either<Failure, CategoryListResponseModel>> getCategoryList() async {
    var value = await networkInfo.isConnected;
    if (value) {
      try {
        var response = await homeApi.getCategoryList();
        if (response.success) {
          return Right(response);
        } else {
          return const Left(ApiFailure(message: SERVER_ERROR));
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
