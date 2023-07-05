class UserProfileResponse {
  final MessageUserProfileResponse message;
  final int statusCode;
  final bool success;

  UserProfileResponse({
    required this.message,
    required this.statusCode,
    required this.success,
  });
}

class MessageUserProfileResponse {
  final String username;
  final ProfileUserProfileResponse? profile;
  final bool isSuperuser;
  final bool isStaff;

  MessageUserProfileResponse({
    required this.username,
    this.profile,
    required this.isSuperuser,
    required this.isStaff,
  });
}

class ProfileUserProfileResponse {
  final String? firstName;
  final String? lastName;
  final String? address;
  final String? shopName;
  final String? phoneNumber;
  final String? province;
  final String? county;
  final String? email;
  final String? img;

  ProfileUserProfileResponse({
    this.firstName,
    this.lastName,
    this.address,
    this.shopName,
    this.phoneNumber,
    this.province,
    this.county,
    this.email,
    this.img,
  });
}
