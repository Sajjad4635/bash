part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends ProfileState {}

class GetUserProfileLoading extends ProfileState {}

class UserProfileReceived extends ProfileState {
  final UserProfileResponse userProfile;

  UserProfileReceived({required this.userProfile});

  @override
  List<Object> get props => [userProfile];
}

class GetUserProfileError extends ProfileState {
  final String message;

  GetUserProfileError({required this.message});

  @override
  List<Object> get props => [message];
}

//*******************************************

class UpdateUserProfileLoading extends ProfileState {}

class UserProfileUpdated extends ProfileState {
  final UpdateUserProfileResponse userProfile;

  UserProfileUpdated({required this.userProfile});

  @override
  List<Object> get props => [userProfile];
}

class UpdateUserProfileError extends ProfileState {
  final String message;

  UpdateUserProfileError({required this.message});

  @override
  List<Object> get props => [message];
}

//*******************************************

class CreateUserProfileLoading extends ProfileState {}

class UserProfileCreated extends ProfileState {
  final UpdateUserProfileResponse userProfile;

  UserProfileCreated({required this.userProfile});

  @override
  List<Object> get props => [userProfile];
}

class CreateUserProfileError extends ProfileState {
  final String message;

  CreateUserProfileError({required this.message});

  @override
  List<Object> get props => [message];
}

//*******************************************

class PaymentLogLoading extends ProfileState {}

class PaymentLogReceived extends ProfileState {
  final PaymentLogResponse paymentLog;

  PaymentLogReceived({required this.paymentLog});

  @override
  List<Object> get props => [paymentLog];
}

class PaymentLogError extends ProfileState {
  final String message;

  PaymentLogError({required this.message});

  @override
  List<Object> get props => [message];
}
