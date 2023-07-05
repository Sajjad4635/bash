import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties;

  const Failure({this.properties = const <dynamic>[]});

  @override
  List<Object?> get props => [properties];
}

class DataFailure extends Failure {
  final String message;

  const DataFailure({required this.message});
}

class ServerFailure extends Failure {
  final String message;

  const ServerFailure({required this.message});
}

class ApiFailure extends Failure {
  final String message;

  const ApiFailure({required this.message});
}

class InternetFailure extends Failure {
  final String message;

  ///should be a const value

  const InternetFailure({required this.message});
}
