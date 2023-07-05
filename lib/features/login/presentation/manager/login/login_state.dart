part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends LoginState {}

class SendCodeLoading extends LoginState {}

class Loading extends LoginState {}

class NumberSent extends LoginState {
  final String number;

  NumberSent({required this.number});

  @override
  List<Object> get props => [number];
}

class CodeSent extends LoginState {
  final ValidateOtpCodeResponse verifyCodeResponse;

  CodeSent({required this.verifyCodeResponse});

  @override
  List<Object> get props => [verifyCodeResponse];
}

class Error extends LoginState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}
