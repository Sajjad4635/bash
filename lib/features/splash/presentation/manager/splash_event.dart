part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetSettingEvent extends SplashEvent {}

class GetLocalDataEvent extends SplashEvent {}

class HandleUpdate extends SplashEvent {
  final bool isForced;
  final String link;

  HandleUpdate({required this.isForced, required this.link});
}
