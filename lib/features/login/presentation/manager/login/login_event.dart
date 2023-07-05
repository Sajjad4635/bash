part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginSendNumber extends LoginEvent {
  final String number;

  LoginSendNumber({required this.number});

  @override
  List<Object> get props => [number];
}

class LoginSendCode extends LoginEvent {
  final int code;
  final String number;

  LoginSendCode({required this.code, required this.number});

  @override
  List<Object> get props => [code, number];
}
