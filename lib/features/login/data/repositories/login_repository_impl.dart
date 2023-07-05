import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:baash/core/error/failures.dart';
import 'package:baash/core/network/network_info.dart';
import 'package:baash/features/login/data/data_sources/login_api.dart';
import 'package:baash/features/login/domain/entities/send_number_response.dart';
import 'package:baash/features/login/domain/entities/verify_code_response.dart';
import 'package:baash/features/login/domain/repositories/login_repository.dart';

import '../../../../core/constants/string_consts.dart';
import '../../../../core/error/exceptions.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginApi loginApi;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl({required this.loginApi, required this.networkInfo});

  @override
  Future<Either<Failure, CreateOtpCodeResponse>> sendNumber(String number) async {
    var value = await networkInfo.isConnected;
    if (value) {
      try {
        var response = await loginApi.sendNumber(number);
        if (response.success) {
          return Right(response);
        } else {
          return Left(ApiFailure(message: response.message.message));
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
  Future<Either<Failure, ValidateOtpCodeResponse>> verifyCode(String number, int code) async {
    var value = await networkInfo.isConnected;
    if (value) {
      try {
        var response = await loginApi.verifyCode(number, code);
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
