import 'package:equatable/equatable.dart';

class UpdateProfileParams extends Equatable {
  final String name;
  final String lastName;
  final String shopName;
  final String address;
  final String mobile;
  final int province;
  final int county;
  final String email;

  UpdateProfileParams({
    required this.name,
    required this.lastName,
    required this.shopName,
    required this.address,
    required this.mobile,
    required this.province,
    required this.county,
    required this.email,
  });

  @override
  List<Object?> get props => [
        name,
        lastName,
        shopName,
        address,
        mobile,
        province,
        county,
        email,
      ];
}
