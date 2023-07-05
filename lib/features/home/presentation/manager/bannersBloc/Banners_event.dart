part of 'Banners_bloc.dart';

@immutable
abstract class BannersEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetBannersEvent extends BannersEvent {}
