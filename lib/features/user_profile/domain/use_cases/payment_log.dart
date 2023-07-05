import 'package:baash/core/error/failures.dart';
import 'package:baash/core/usecases/usecase.dart';
import 'package:baash/features/user_profile/domain/entities/payment_log_response.dart';
import 'package:baash/features/user_profile/domain/entities/user_profile_response.dart';
import 'package:baash/features/user_profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class PaymentLogUseCase implements UseCase<PaymentLogResponse, NoParams> {
  final ProfileRepository repository;

  PaymentLogUseCase(this.repository);

  @override
  Future<Either<Failure, PaymentLogResponse>> call(NoParams params) async {
    return await repository.paymentLog();
  }
}
