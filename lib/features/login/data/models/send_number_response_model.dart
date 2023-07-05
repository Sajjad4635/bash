import 'dart:convert';

import 'package:baash/features/login/domain/entities/send_number_response.dart';

CreateOtpCodeResponseModel createOtpCodeResponseModelFromJson(String str) => CreateOtpCodeResponseModel.fromJson(json.decode(str));

String createOtpCodeResponseModelToJson(CreateOtpCodeResponseModel data) => json.encode(data.toJson());

class CreateOtpCodeResponseModel extends CreateOtpCodeResponse {
  CreateOtpCodeResponseModel({
    required message,
    required statusCode,
    required success,
  }) : super(
          message: message,
          statusCode: statusCode,
          success: success,
        );

  factory CreateOtpCodeResponseModel.fromJson(Map<String, dynamic> json) => CreateOtpCodeResponseModel(
        message: MessageCreateOtpCodeResponseModel.fromJson(json["message"]),
        statusCode: json["status_code"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status_code": statusCode,
        "success": success,
      };
}

class MessageCreateOtpCodeResponseModel extends MessageCreateOtpCodeResponse {
  MessageCreateOtpCodeResponseModel({
    required message,
  }) : super(
          message: message,
        );

  factory MessageCreateOtpCodeResponseModel.fromJson(Map<String, dynamic> json) => MessageCreateOtpCodeResponseModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
