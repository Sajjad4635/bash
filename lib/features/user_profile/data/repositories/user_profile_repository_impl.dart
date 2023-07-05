import 'package:baash/core/error/failures.dart';
import 'package:baash/core/network/network_info.dart';
import 'package:baash/features/user_profile/data/data_sources/profile_api.dart';
import 'package:baash/features/user_profile/data/models/payment_log_response_model.dart';
import 'package:baash/features/user_profile/data/models/update_user_profile_response_model.dart';
import 'package:baash/features/user_profile/data/models/user_profile_response_model.dart';
import 'package:baash/features/user_profile/domain/repositories/profile_repository.dart';
import 'package:baash/features/user_profile/domain/use_cases/params/update_profile_params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/string_consts.dart';
import '../../../../core/error/exceptions.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileApi profileApi;
  final NetworkInfo networkInfo;

  ProfileRepositoryImpl({required this.profileApi, required this.networkInfo});

  @override
  Future<Either<Failure, UserProfileResponseModel>> getUserProfile() async {
    var value = await networkInfo.isConnected;
    if (value) {
      try {
        var response = await profileApi.getUserProfile();
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
  Future<Either<Failure, UpdateUserProfileResponseModel>> createProfile(UpdateProfileParams params) async {
    var value = await networkInfo.isConnected;
    if (value) {
      try {
        var response = await profileApi.createProfile(params);
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
  Future<Either<Failure, UpdateUserProfileResponseModel>> updateProfile(UpdateProfileParams params) async {
    var value = await networkInfo.isConnected;
    if (value) {
      try {
        var response = await profileApi.updateProfile(params);
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
  Future<Either<Failure, PaymentLogResponseModel>> paymentLog() async {
    var value = await networkInfo.isConnected;
    if (value) {
      try {
        var response = await profileApi.paymentLop();
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
