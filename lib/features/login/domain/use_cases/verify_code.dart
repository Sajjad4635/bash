import 'package:dartz/dartz.dart';
import 'package:baash/core/error/failures.dart';
import 'package:baash/core/usecases/usecase.dart';
import 'package:baash/features/login/domain/entities/verify_code_response.dart';
import 'package:baash/features/login/domain/repositories/login_repository.dart';
import 'package:baash/features/login/domain/use_cases/params/verify_code_params.dart';

class VerifyCode implements UseCase<ValidateOtpCodeResponse, VerifyCodeParams> {
  final LoginRepository repository;

  VerifyCode(this.repository);

  @override
  Future<Either<Failure, ValidateOtpCodeResponse>> call(VerifyCodeParams params) async {
    return await repository.verifyCode(params.number, params.code);
  }
}
