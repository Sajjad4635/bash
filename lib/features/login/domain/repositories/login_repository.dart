import 'package:dartz/dartz.dart';
import 'package:baash/features/login/domain/entities/verify_code_response.dart';

import '../../../../core/error/failures.dart';
import '../entities/send_number_response.dart';

abstract class LoginRepository {
  Future<Either<Failure, CreateOtpCodeResponse>> sendNumber(String number);

  Future<Either<Failure, ValidateOtpCodeResponse>> verifyCode(String number, int code);
}
