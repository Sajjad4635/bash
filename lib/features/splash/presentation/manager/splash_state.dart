part of 'splash_bloc.dart';

@immutable
abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class Empty extends SplashState {
  const Empty();
}

class Error extends SplashState {
  final String message;

  const Error({required this.message});
}

class ErrorInternet extends SplashState {
  const ErrorInternet();
}

class LoginScreenState extends SplashState {
  const LoginScreenState();
}

class HomeScreenState extends SplashState {
  const HomeScreenState();
}
