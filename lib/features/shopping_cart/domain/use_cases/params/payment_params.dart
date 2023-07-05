import 'package:equatable/equatable.dart';

class CreatePaymentParams extends Equatable {
  final int cart;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String address;
  final String mobile;
  final String amount;

  const CreatePaymentParams({
    required this.cart,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.mobile,
    required this.amount,
  });

  @override
  List<Object?> get props => [
        cart,
        firstName,
        lastName,
        phoneNumber,
        email,
        address,
        mobile,
        amount,
      ];
}
