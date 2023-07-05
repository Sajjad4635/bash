class UpdateUserProfileResponse {
  final MessageUpdateUserProfileResponse message;
  final int statusCode;
  final bool success;

  UpdateUserProfileResponse({
    required this.message,
    required this.statusCode,
    required this.success,
  });
}

class MessageUpdateUserProfileResponse {
  final String firstName;
  final String lastName;
  final String address;
  final String shopName;
  final String phoneNumber;
  final int province;
  final int county;
  final String email;
  final dynamic img;

  MessageUpdateUserProfileResponse({
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.shopName,
    required this.phoneNumber,
    required this.province,
    required this.county,
    required this.email,
    required this.img,
  });
}
