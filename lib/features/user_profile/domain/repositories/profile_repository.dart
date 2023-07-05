import 'package:baash/features/user_profile/domain/entities/payment_log_response.dart';
import 'package:baash/features/user_profile/domain/entities/update_user_profile_response.dart';
import 'package:baash/features/user_profile/domain/entities/user_profile_response.dart';
import 'package:baash/features/user_profile/domain/use_cases/params/update_profile_params.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserProfileResponse>> getUserProfile();

  Future<Either<Failure, UpdateUserProfileResponse>> createProfile(UpdateProfileParams params);

  Future<Either<Failure, UpdateUserProfileResponse>> updateProfile(UpdateProfileParams params);

  Future<Either<Failure, PaymentLogResponse>> paymentLog();
}
