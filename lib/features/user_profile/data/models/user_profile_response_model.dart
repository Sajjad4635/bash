import 'dart:convert';

import 'package:baash/features/user_profile/domain/entities/user_profile_response.dart';

UserProfileResponseModel userProfileResponseModelFromJson(String str) => UserProfileResponseModel.fromJson(json.decode(str));

String userProfileResponseModelToJson(UserProfileResponseModel data) => json.encode(data.toJson());

class UserProfileResponseModel extends UserProfileResponse {
  UserProfileResponseModel({
    required message,
    required statusCode,
    required success,
  }) : super(
          message: message,
          statusCode: statusCode,
          success: success,
        );

  factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) => UserProfileResponseModel(
        message: MessageUserProfileResponseModel.fromJson(json["message"]),
        statusCode: json["status_code"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status_code": statusCode,
        "success": success,
      };
}

class MessageUserProfileResponseModel extends MessageUserProfileResponse {
  MessageUserProfileResponseModel({
    required username,
    profile,
    required isSuperuser,
    required isStaff,
  }) : super(
          username: username,
          profile: profile,
          isSuperuser: isSuperuser,
          isStaff: isStaff,
        );

  factory MessageUserProfileResponseModel.fromJson(Map<String, dynamic> json) => MessageUserProfileResponseModel(
        username: json["username"],
        profile: json["profile"] == null ? null : ProfileUserProfileResponseModel.fromJson(json["profile"]),
        isSuperuser: json["is_superuser"],
        isStaff: json["is_staff"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "profile": profile,
        "is_superuser": isSuperuser,
        "is_staff": isStaff,
      };
}

class ProfileUserProfileResponseModel extends ProfileUserProfileResponse {
  ProfileUserProfileResponseModel({
    required firstName,
    required lastName,
    required address,
    required shopName,
    required phoneNumber,
    required province,
    required county,
    required email,
    required img,
  }) : super(
          firstName: firstName,
          lastName: lastName,
          address: address,
          shopName: shopName,
          phoneNumber: phoneNumber,
          province: province,
          county: county,
          email: email,
          img: img,
        );

  factory ProfileUserProfileResponseModel.fromJson(Map<String, dynamic> json) => ProfileUserProfileResponseModel(
        firstName: json["first_name"],
        lastName: json["last_name"],
        address: json["address"],
        shopName: json["shop_name"],
        phoneNumber: json["phone_number"],
        province: json["province"],
        county: json["county"],
        email: json["email"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "address": address,
        "shop_name": shopName,
        "phone_number": phoneNumber,
        "province": province,
        "county": county,
        "email": email,
        "img": img,
      };
}
