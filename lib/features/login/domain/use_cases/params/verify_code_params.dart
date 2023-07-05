import 'package:equatable/equatable.dart';

class VerifyCodeParams extends Equatable {
  final String number;
  final int code;

  const VerifyCodeParams({required this.number, required this.code});

  @override
  List<Object?> get props => [number, code];
}
