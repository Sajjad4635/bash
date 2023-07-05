import 'dart:convert';

import 'package:baash/features/shopping_cart/domain/entities/payment_response.dart';

PaymentResponseModel paymentResponseModelFromJson(String str) => PaymentResponseModel.fromJson(json.decode(str));

String paymentResponseModelToJson(PaymentResponseModel data) => json.encode(data.toJson());

class PaymentResponseModel extends PaymentResponse {
  PaymentResponseModel({
    required message,
    required statusCode,
    required success,
  }) : super(
          message: message,
          statusCode: statusCode,
          success: success,
        );

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) => PaymentResponseModel(
        message: MessagePaymentResponseModel.fromJson(json["message"]),
        statusCode: json["status_code"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status_code": statusCode,
        "success": success,
      };
}

class MessagePaymentResponseModel extends MessagePaymentResponse {
  MessagePaymentResponseModel({
    required message,
  }) : super(
          message: message,
        );

  factory MessagePaymentResponseModel.fromJson(Map<String, dynamic> json) => MessagePaymentResponseModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
