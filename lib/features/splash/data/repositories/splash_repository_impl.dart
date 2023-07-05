import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:baash/core/error/failures.dart';
import 'package:baash/core/network/network_info.dart';
import 'package:baash/features/login/domain/entities/verify_code_response.dart';
import 'package:baash/features/splash/data/data_sources/splash_data.dart';
import 'package:baash/features/splash/domain/entities/setting_response.dart';
import 'package:baash/features/splash/domain/repositories/splash_repository.dart';

import '../../../../core/constants/string_consts.dart';
import '../../../../core/error/exceptions.dart';

class SplashRepositoryImpl implements SplashRepository {
  final NetworkInfo networkInfo;
  final SplashData splashData;

  SplashRepositoryImpl({required this.networkInfo, required this.splashData});

  @override
  Future<Either<Failure, String>> getToken() async {
    String? token = await splashData.getToken();
    if (token != null) {
      //print(token);
      return Right(token);
    } else {
      return const Left(DataFailure(message: DATA_NOT_AVAILABLE));
    }
  }
}
