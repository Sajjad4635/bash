import 'package:baash/core/error/failures.dart';
import 'package:baash/core/usecases/usecase.dart';
import 'package:baash/features/user_profile/domain/entities/payment_log_response.dart';
import 'package:baash/features/user_profile/domain/entities/update_user_profile_response.dart';
import 'package:baash/features/user_profile/domain/entities/user_profile_response.dart';
import 'package:baash/features/user_profile/domain/use_cases/create_user_profile.dart';
import 'package:baash/features/user_profile/domain/use_cases/get_user_profile.dart';
import 'package:baash/features/user_profile/domain/use_cases/params/update_profile_params.dart';
import 'package:baash/features/user_profile/domain/use_cases/payment_log.dart';
import 'package:baash/features/user_profile/domain/use_cases/update_user_profile.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserProfile getUserProfile;
  final CreateUserProfile createUserProfile;
  final UpdateUserProfile updateUserProfile;
  final PaymentLogUseCase paymentLogUseCase;

  ProfileBloc({
    required this.getUserProfile,
    required this.createUserProfile,
    required this.updateUserProfile,
    required this.paymentLogUseCase,
  }) : super(Empty()) {
    on<GetUserProfileEvent>((event, emit) async {
      emit(Empty());
      emit(GetUserProfileLoading());
      final either = await getUserProfile(NoParams());
      either.fold((l) {
        handleFailureGetUserProfile(l, emit);
      }, (r) {
        emit(
          ///we can use data from 'r'
          UserProfileReceived(userProfile: r),
        );
      });
    });

    on<CreateUserProfileEvent>((event, emit) async {
      emit(Empty());
      emit(CreateUserProfileLoading());
      final either = await createUserProfile(event.updateProfileParams);
      either.fold((l) {
        handleFailureCreateProfile(l, emit);
      }, (r) {
        emit(
          ///we can use data from 'r'
          UserProfileCreated(userProfile: r),
        );
      });
    });

    on<UpdateUserProfileEvent>((event, emit) async {
      emit(Empty());
      emit(UpdateUserProfileLoading());
      final either = await updateUserProfile(event.updateProfileParams);
      either.fold((l) {
        handleFailureUpdateProfile(l, emit);
      }, (r) {
        emit(
          ///we can use data from 'r'
          UserProfileUpdated(userProfile: r),
        );
      });
    });

    on<PaymentLogEvent>((event, emit) async {
      emit(Empty());
      emit(PaymentLogLoading());
      final either = await paymentLogUseCase(NoParams());
      either.fold((l) {
        handleFailurePaymentLog(l, emit);
      }, (r) {
        emit(
          ///we can use data from 'r'
          PaymentLogReceived(paymentLog: r),
        );
      });
    });
  }

  void handleFailureGetUserProfile(Failure failure, emit) {
    switch (failure.runtimeType) {
      case ApiFailure:
        emit(
          GetUserProfileError(
            message: (failure as ApiFailure).message,
          ),
        );
        break;
      case ServerFailure:
        emit(
          GetUserProfileError(
            message: (failure as ServerFailure).message,
          ),
        );
        break;
      case InternetFailure:
        emit(
          GetUserProfileError(
            message: (failure as InternetFailure).message,
          ),
        );
        break;
    }
  }

  void handleFailureCreateProfile(Failure failure, emit) {
    switch (failure.runtimeType) {
      case ApiFailure:
        emit(
          CreateUserProfileError(
            message: (failure as ApiFailure).message,
          ),
        );
        break;
      case ServerFailure:
        emit(
          CreateUserProfileError(
            message: (failure as ServerFailure).message,
          ),
        );
        break;
      case InternetFailure:
        emit(
          CreateUserProfileError(
            message: (failure as InternetFailure).message,
          ),
        );
        break;
    }
  }

  void handleFailureUpdateProfile(Failure failure, emit) {
    switch (failure.runtimeType) {
      case ApiFailure:
        emit(
          UpdateUserProfileError(
            message: (failure as ApiFailure).message,
          ),
        );
        break;
      case ServerFailure:
        emit(
          UpdateUserProfileError(
            message: (failure as ServerFailure).message,
          ),
        );
        break;
      case InternetFailure:
        emit(
          UpdateUserProfileError(
            message: (failure as InternetFailure).message,
          ),
        );
        break;
    }
  }

  void handleFailurePaymentLog(Failure failure, emit) {
    switch (failure.runtimeType) {
      case ApiFailure:
        emit(
          PaymentLogError(
            message: (failure as ApiFailure).message,
          ),
        );
        break;
      case ServerFailure:
        emit(
          PaymentLogError(
            message: (failure as ServerFailure).message,
          ),
        );
        break;
      case InternetFailure:
        emit(
          PaymentLogError(
            message: (failure as InternetFailure).message,
          ),
        );
        break;
    }
  }
}
