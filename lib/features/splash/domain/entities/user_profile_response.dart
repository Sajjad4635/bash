class UserProfileResponse {
  final String username;
  final ProfileResponse profile;

  UserProfileResponse({
    required this.username,
    required this.profile,
  });
}

class ProfileResponse {
  final String firstName;
  final String lastName;
  final String address;
  final String shopName;
  final String phoneNumber;
  final String email;
  final dynamic img;

  ProfileResponse({
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.shopName,
    required this.phoneNumber,
    required this.email,
    required this.img,
  });
}
