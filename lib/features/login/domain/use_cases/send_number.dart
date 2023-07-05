import 'package:dartz/dartz.dart';
import 'package:baash/core/error/failures.dart';
import 'package:baash/core/usecases/usecase.dart';
import 'package:baash/features/login/domain/entities/send_number_response.dart';
import 'package:baash/features/login/domain/repositories/login_repository.dart';
import 'package:baash/features/login/domain/use_cases/params/send_number_params.dart';

class SendNumber implements UseCase<CreateOtpCodeResponse, SendNumberParams> {
  final LoginRepository repository;

  SendNumber(this.repository);

  @override
  Future<Either<Failure, CreateOtpCodeResponse>> call(SendNumberParams params) async {
    return await repository.sendNumber(params.number);
  }
}
