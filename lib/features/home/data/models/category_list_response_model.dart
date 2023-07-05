import 'dart:convert';

import 'package:baash/features/home/domain/entities/category_list_response.dart';

CategoryListResponseModel categoryListResponseModelFromJson(String str) => CategoryListResponseModel.fromJson(json.decode(str));

String categoryListResponseModelToJson(CategoryListResponseModel data) => json.encode(data.toJson());

class CategoryListResponseModel extends CategoryListResponse {
  CategoryListResponseModel({
    required message,
    required statusCode,
    required success,
  }) : super(
          message: message,
          statusCode: statusCode,
          success: success,
        );

  factory CategoryListResponseModel.fromJson(Map<String, dynamic> json) => CategoryListResponseModel(
        message: List<MessageCategoryListResponseModel>.from(json["message"].map((x) => MessageCategoryListResponseModel.fromJson(x))),
        statusCode: json["status_code"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "message": List<dynamic>.from(message.map((x) => x)),
        "status_code": statusCode,
        "success": success,
      };
}

class MessageCategoryListResponseModel extends MessageCategoryListResponse {
  MessageCategoryListResponseModel({
    required id,
    required name,
    required img,
  }) : super(
          id: id,
          name: name,
          img: img,
        );

  factory MessageCategoryListResponseModel.fromJson(Map<String, dynamic> json) => MessageCategoryListResponseModel(
        id: json["id"],
        name: json["name"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
      };
}
