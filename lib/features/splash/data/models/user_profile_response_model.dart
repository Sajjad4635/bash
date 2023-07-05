import 'dart:convert';

import 'package:baash/features/splash/domain/entities/user_profile_response.dart';

UserProfileResponseModel userProfileResponseModelFromJson(String str) => UserProfileResponseModel.fromJson(json.decode(str));

String userProfileResponseModelToJson(UserProfileResponseModel data) => json.encode(data.toJson());

class UserProfileResponseModel extends UserProfileResponse {
  UserProfileResponseModel({
    required username,
    required profile,
  }) : super(
          username: username,
          profile: profile,
        );

  factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) => UserProfileResponseModel(
        username: json["username"],
        profile: ProfileResponseModel.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "profile": profile,
      };
}

class ProfileResponseModel extends ProfileResponse {
  ProfileResponseModel({
    required firstName,
    required lastName,
    required address,
    required shopName,
    required phoneNumber,
    required email,
    required img,
  }) : super(
          firstName: firstName,
          lastName: lastName,
          address: address,
          shopName: shopName,
          phoneNumber: phoneNumber,
          email: email,
          img: img,
        );

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) => ProfileResponseModel(
        firstName: json["first_name"],
        lastName: json["last_name"],
        address: json["address"],
        shopName: json["shop_name"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "address": address,
        "shop_name": shopName,
        "phone_number": phoneNumber,
        "email": email,
        "img": img,
      };
}
