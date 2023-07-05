import 'package:dartz/dartz.dart';
import 'package:baash/core/error/failures.dart';
import 'package:baash/core/usecases/usecase.dart';
import 'package:baash/features/splash/domain/repositories/splash_repository.dart';

class GetToken implements UseCase<String, NoParams> {
  final SplashRepository repository;

  GetToken(this.repository);

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await repository.getToken();
  }
}
