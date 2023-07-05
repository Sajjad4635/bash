import 'dart:convert';

import 'package:baash/features/home/domain/entities/cart_inquiry_response.dart';

CartInquiryResponseModel cartInquiryResponseModelFromJson(String str) => CartInquiryResponseModel.fromJson(json.decode(str));

String cartInquiryResponseModelToJson(CartInquiryResponseModel data) => json.encode(data.toJson());

class CartInquiryResponseModel extends CartInquiryResponse {
  CartInquiryResponseModel({
    required message,
    required statusCode,
    required success,
  }) : super(
          message: message,
          statusCode: statusCode,
          success: success,
        );

  factory CartInquiryResponseModel.fromJson(Map<String, dynamic> json) => CartInquiryResponseModel(
        message: MessageCartInquiryResponseModel.fromJson(json["message"]),
        statusCode: json["status_code"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status_code": statusCode,
        "success": success,
      };
}

class MessageCartInquiryResponseModel extends MessageCartInquiryResponse {
  MessageCartInquiryResponseModel({
    required quantity,
  }) : super(
          quantity: quantity,
        );

  factory MessageCartInquiryResponseModel.fromJson(Map<String, dynamic> json) => MessageCartInquiryResponseModel(
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
      };
}
