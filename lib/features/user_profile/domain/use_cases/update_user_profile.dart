import 'package:baash/core/error/failures.dart';
import 'package:baash/core/usecases/usecase.dart';
import 'package:baash/features/user_profile/domain/entities/update_user_profile_response.dart';
import 'package:baash/features/user_profile/domain/entities/user_profile_response.dart';
import 'package:baash/features/user_profile/domain/repositories/profile_repository.dart';
import 'package:baash/features/user_profile/domain/use_cases/params/update_profile_params.dart';
import 'package:dartz/dartz.dart';

class UpdateUserProfile implements UseCase<UpdateUserProfileResponse, UpdateProfileParams> {
  final ProfileRepository repository;

  UpdateUserProfile(this.repository);

  @override
  Future<Either<Failure, UpdateUserProfileResponse>> call(UpdateProfileParams params) async {
    return await repository.updateProfile(params);
  }
}
