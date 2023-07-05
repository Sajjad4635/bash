import 'dart:convert';

import 'package:baash/features/home/domain/entities/banners_response.dart';

BannersResponseModel bannersResponseModelFromJson(String str) => BannersResponseModel.fromJson(json.decode(str));

String bannersResponseModelToJson(BannersResponseModel data) => json.encode(data.toJson());

class BannersResponseModel extends BannersResponse {
  BannersResponseModel({
    required message,
    required statusCode,
    required success,
  }) : super(
          message: message,
          statusCode: statusCode,
          success: success,
        );

  factory BannersResponseModel.fromJson(Map<String, dynamic> json) => BannersResponseModel(
        message: List<MessageBannersResponseModel>.from(json["message"].map((x) => MessageBannersResponseModel.fromJson(x))),
        statusCode: json["status_code"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "message": List<dynamic>.from(message.map((x) => x)),
        "status_code": statusCode,
        "success": success,
      };
}

class MessageBannersResponseModel extends MessageBannersResponse {
  MessageBannersResponseModel({
    required id,
    required url,
    required img,
  }) : super(
          id: id,
          url: url,
          img: img,
        );

  factory MessageBannersResponseModel.fromJson(Map<String, dynamic> json) => MessageBannersResponseModel(
        id: json["id"],
        url: json["url"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "img": img,
      };
}
