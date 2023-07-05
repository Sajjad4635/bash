import 'package:equatable/equatable.dart';

class SendNumberParams extends Equatable {
  final String number;

  const SendNumberParams({required this.number});

  @override
  List<Object?> get props => [number];
}
