part of 'Banners_bloc.dart';

abstract class BannersState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends BannersState {}

class GetBannersLoading extends BannersState {}

class BannersReceived extends BannersState {
  final BannersResponse banners;

  BannersReceived({required this.banners});

  @override
  List<Object> get props => [banners];
}

class GetBannersError extends BannersState {
  final String message;

  GetBannersError({required this.message});

  @override
  List<Object> get props => [message];
}
