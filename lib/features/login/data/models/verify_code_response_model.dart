import 'dart:convert';

import 'package:baash/features/login/domain/entities/verify_code_response.dart';

ValidateOtpCodeResponseModel validateOtpCodeResponseModelFromJson(String str) => ValidateOtpCodeResponseModel.fromJson(json.decode(str));

String validateOtpCodeResponseModelToJson(ValidateOtpCodeResponseModel data) => json.encode(data.toJson());

class ValidateOtpCodeResponseModel extends ValidateOtpCodeResponse {
  ValidateOtpCodeResponseModel({
    required message,
    required statusCode,
    required success,
  }) : super(
          message: message,
          statusCode: statusCode,
          success: success,
        );

  factory ValidateOtpCodeResponseModel.fromJson(Map<String, dynamic> json) => ValidateOtpCodeResponseModel(
        message: MessageValidateOtpCodeResponseModel.fromJson(json["message"]),
        statusCode: json["status_code"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status_code": statusCode,
        "success": success,
      };
}

class MessageValidateOtpCodeResponseModel extends MessageValidateOtpCodeResponse {
  MessageValidateOtpCodeResponseModel({
    required token,
    required refresh,
  }) : super(
          token: token,
          refresh: refresh,
        );

  factory MessageValidateOtpCodeResponseModel.fromJson(Map<String, dynamic> json) => MessageValidateOtpCodeResponseModel(
        token: json["token"],
        refresh: json["refresh"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "refresh": refresh,
      };
}
