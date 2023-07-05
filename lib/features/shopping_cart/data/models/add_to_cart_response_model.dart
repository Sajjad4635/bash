import 'dart:convert';

import 'package:baash/features/shopping_cart/domain/entities/add_to_cart_response.dart';

AddProductToCartResponseModel addProductToCartResponseModelFromJson(String str) => AddProductToCartResponseModel.fromJson(json.decode(str));

String addProductToCartResponseModelToJson(AddProductToCartResponseModel data) => json.encode(data.toJson());

class AddProductToCartResponseModel extends AddProductToCartResponse {
  AddProductToCartResponseModel({
    required message,
    required statusCode,
    required success,
  }) : super(
          message: message,
          statusCode: statusCode,
          success: success,
        );

  factory AddProductToCartResponseModel.fromJson(Map<String, dynamic> json) => AddProductToCartResponseModel(
        message: MessageAddProductToCartResponseModel.fromJson(json["message"]),
        statusCode: json["status_code"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status_code": statusCode,
        "success": success,
      };
}

class MessageAddProductToCartResponseModel extends MessageAddProductToCartResponse {
  MessageAddProductToCartResponseModel({
    required product,
    required quantity,
    required perPrice,
  }) : super(
          product: product,
          quantity: quantity,
          perPrice: perPrice,
        );

  factory MessageAddProductToCartResponseModel.fromJson(Map<String, dynamic> json) => MessageAddProductToCartResponseModel(
        product: json["product"],
        quantity: json["quantity"],
        perPrice: json["per_price"],
      );

  Map<String, dynamic> toJson() => {
        "product": product,
        "quantity": quantity,
        "per_price": perPrice,
      };
}
