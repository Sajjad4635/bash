part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetUserProfileEvent extends ProfileEvent {}

class CreateUserProfileEvent extends ProfileEvent {
  UpdateProfileParams updateProfileParams;

  CreateUserProfileEvent({
    required this.updateProfileParams,
  });

  @override
  List<Object> get props => [updateProfileParams];
}

class UpdateUserProfileEvent extends ProfileEvent {
  UpdateProfileParams updateProfileParams;

  UpdateUserProfileEvent({
    required this.updateProfileParams,
  });

  @override
  List<Object> get props => [updateProfileParams];
}

class PaymentLogEvent extends ProfileEvent {}
