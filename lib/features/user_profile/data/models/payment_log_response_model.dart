import 'dart:convert';

import 'package:baash/features/user_profile/domain/entities/payment_log_response.dart';

PaymentLogResponseModel paymentLogResponseModelFromJson(String str) => PaymentLogResponseModel.fromJson(json.decode(str));

String paymentLogResponseModelToJson(PaymentLogResponseModel data) => json.encode(data.toJson());

class PaymentLogResponseModel extends PaymentLogResponse {
  PaymentLogResponseModel({
    required message,
    required statusCode,
    required success,
  }) : super(
          message: message,
          statusCode: statusCode,
          success: success,
        );

  factory PaymentLogResponseModel.fromJson(Map<String, dynamic> json) => PaymentLogResponseModel(
        message: List<MessagePaymentLogResponseModel>.from(json["message"].map((x) => MessagePaymentLogResponseModel.fromJson(x))),
        statusCode: json["status_code"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "message": List<dynamic>.from(message.map((x) => x)),
        "status_code": statusCode,
        "success": success,
      };
}

class MessagePaymentLogResponseModel extends MessagePaymentLogResponse {
  MessagePaymentLogResponseModel({
    required status,
    required cartItemLogs,
    required deliveryPerson,
    required total,
    required orderId,
    required updateDate,
  }) : super(
          status: status,
          cartItemLogs: cartItemLogs,
          deliveryPerson: deliveryPerson,
          total: total,
          orderId: orderId,
          updateDate: updateDate,
        );

  factory MessagePaymentLogResponseModel.fromJson(Map<String, dynamic> json) => MessagePaymentLogResponseModel(
        status: json["status"],
        cartItemLogs: List<CartItemLogPaymentLogResponseModel>.from(json["cart_item_logs"].map((x) => CartItemLogPaymentLogResponseModel.fromJson(x))),
        deliveryPerson: DeliveryPersonPaymentLogResponseModel.fromJson(json["delivery_person"]),
        total: json["total"],
        orderId: json["order_id"],
        updateDate: json["update_date"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "cart_item_logs": List<dynamic>.from(cartItemLogs.map((x) => x)),
        "delivery_person": deliveryPerson,
        "total": total,
        "order_id": orderId,
        "update_date": updateDate,
      };
}

class CartItemLogPaymentLogResponseModel extends CartItemLogPaymentLogResponse {
  CartItemLogPaymentLogResponseModel({
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

  factory CartItemLogPaymentLogResponseModel.fromJson(Map<String, dynamic> json) => CartItemLogPaymentLogResponseModel(
        product: ProductPaymentLogResponseModel.fromJson(json["product"]),
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

class ProductPaymentLogResponseModel extends ProductPaymentLogResponse {
  ProductPaymentLogResponseModel({
    required id,
    required name,
    required img,
    required price,
  }) : super(
          id: id,
          name: name,
          img: img,
          price: price,
        );

  factory ProductPaymentLogResponseModel.fromJson(Map<String, dynamic> json) => ProductPaymentLogResponseModel(
        id: json["id"],
        name: json["name"],
        img: json["img"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
        "price": price,
      };
}

class DeliveryPersonPaymentLogResponseModel extends DeliveryPersonPaymentLogResponse {
  DeliveryPersonPaymentLogResponseModel({
    required firstName,
    required lastName,
    required phoneNumber,
    required email,
    required address,
  }) : super(
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          email: email,
          address: address,
        );

  factory DeliveryPersonPaymentLogResponseModel.fromJson(Map<String, dynamic> json) => DeliveryPersonPaymentLogResponseModel(
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "email": email,
        "address": address,
      };
}
