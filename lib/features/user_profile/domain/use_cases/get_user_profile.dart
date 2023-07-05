import 'package:baash/core/error/failures.dart';
import 'package:baash/core/usecases/usecase.dart';
import 'package:baash/features/user_profile/domain/entities/user_profile_response.dart';
import 'package:baash/features/user_profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserProfile implements UseCase<UserProfileResponse, NoParams> {
  final ProfileRepository repository;

  GetUserProfile(this.repository);

  @override
  Future<Either<Failure, UserProfileResponse>> call(NoParams params) async {
    return await repository.getUserProfile();
  }
}
