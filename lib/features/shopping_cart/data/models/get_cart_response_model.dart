import 'dart:convert';

import 'package:baash/features/shopping_cart/domain/entities/get_cart_response.dart';

GetCartResponseModel getCartResponseModelFromJson(String str) => GetCartResponseModel.fromJson(json.decode(str));

String getCartResponseModelToJson(GetCartResponseModel data) => json.encode(data.toJson());

class GetCartResponseModel extends GetCartResponse {
  GetCartResponseModel({
    required message,
    required statusCode,
    required success,
  }) : super(
          message: message,
          statusCode: statusCode,
          success: success,
        );

  factory GetCartResponseModel.fromJson(Map<String, dynamic> json) => GetCartResponseModel(
        message: MessageGetCartResponseModel.fromJson(json["message"]),
        statusCode: json["status_code"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status_code": statusCode,
        "success": success,
      };
}

class MessageGetCartResponseModel extends MessageGetCartResponse {
  MessageGetCartResponseModel({
    required cartItems,
    required status,
    required total,
    required paymentId,
  }) : super(
          cartItems: cartItems,
          status: status,
          total: total,
          paymentId: paymentId,
        );

  factory MessageGetCartResponseModel.fromJson(Map<String, dynamic> json) => MessageGetCartResponseModel(
        cartItems: List<CartItemGetCartResponseModel>.from(json["cart_items"].map((x) => CartItemGetCartResponseModel.fromJson(x))),
        status: json["status"],
        total: json["total"],
        paymentId: json["payment_id"],
      );

  Map<String, dynamic> toJson() => {
        "cart_items": List<dynamic>.from(cartItems.map((x) => x)),
        "status": status,
        "total": total,
        "payment_id": paymentId,
      };
}

class CartItemGetCartResponseModel extends CartItemGetCartResponsea {
  CartItemGetCartResponseModel({
    required product,
    required quantity,
    required perPrice,
    required totalPrice,
  }) : super(
          product: product,
          quantity: quantity,
          perPrice: perPrice,
          totalPrice: totalPrice,
        );

  factory CartItemGetCartResponseModel.fromJson(Map<String, dynamic> json) => CartItemGetCartResponseModel(
        product: ProductGetCartResponseModel.fromJson(json["product"]),
        quantity: json["quantity"],
        perPrice: json["per_price"],
        totalPrice: json["total_price"],
      );

  Map<String, dynamic> toJson() => {
        "product": product,
        "quantity": quantity,
        "per_price": perPrice,
        "total_price": totalPrice,
      };
}

class ProductGetCartResponseModel extends ProductGetCartResponse {
  ProductGetCartResponseModel({
    required id,
    required name,
    required category,
    required inventory,
    required price,
    required img,
  }) : super(
          id: id,
          name: name,
          category: category,
          inventory: inventory,
          price: price,
          img: img,
        );

  factory ProductGetCartResponseModel.fromJson(Map<String, dynamic> json) => ProductGetCartResponseModel(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        inventory: json["inventory"],
        price: json["price"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "inventory": inventory,
        "price": price,
        "img": img,
      };
}
