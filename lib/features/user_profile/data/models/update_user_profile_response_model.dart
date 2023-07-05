import 'dart:convert';

import 'package:baash/features/user_profile/domain/entities/update_user_profile_response.dart';

UpdateUserProfileResponseModel updateUserProfileResponseModelFromJson(String str) => UpdateUserProfileResponseModel.fromJson(json.decode(str));

String updateUserProfileResponseModelToJson(UpdateUserProfileResponseModel data) => json.encode(data.toJson());

class UpdateUserProfileResponseModel extends UpdateUserProfileResponse {
  UpdateUserProfileResponseModel({
    required message,
    required statusCode,
    required success,
  }) : super(
          message: message,
          statusCode: statusCode,
          success: success,
        );

  factory UpdateUserProfileResponseModel.fromJson(Map<String, dynamic> json) => UpdateUserProfileResponseModel(
        message: MessageUpdateUserProfileResponseModel.fromJson(json["message"]),
        statusCode: json["status_code"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status_code": statusCode,
        "success": success,
      };
}

class MessageUpdateUserProfileResponseModel extends MessageUpdateUserProfileResponse {
  MessageUpdateUserProfileResponseModel({
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

  factory MessageUpdateUserProfileResponseModel.fromJson(Map<String, dynamic> json) => MessageUpdateUserProfileResponseModel(
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
