import 'dart:convert';

import 'package:baash/features/category/domain/entities/all_products_response.dart';

AllProductsResponseModel allProductsResponseModelFromJson(String str) => AllProductsResponseModel.fromJson(json.decode(str));

String allProductsResponseModelToJson(AllProductsResponseModel data) => json.encode(data.toJson());

class AllProductsResponseModel extends AllProductsResponse {
  AllProductsResponseModel({
    required message,
    required statusCode,
    required success,
  }) : super(
          message: message,
          statusCode: statusCode,
          success: success,
        );

  factory AllProductsResponseModel.fromJson(Map<String, dynamic> json) => AllProductsResponseModel(
        message: MessageAllProductsResponseModel.fromJson(json["message"]),
        statusCode: json["status_code"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status_code": statusCode,
        "success": success,
      };
}

class MessageAllProductsResponseModel extends MessageAllProductsResponse {
  MessageAllProductsResponseModel({
    required next,
    required previous,
    required count,
    required results,
  }) : super(
          next: next,
          previous: previous,
          count: count,
          results: results,
        );

  factory MessageAllProductsResponseModel.fromJson(Map<String, dynamic> json) => MessageAllProductsResponseModel(
        next: json["next"],
        previous: json["previous"],
        count: json["count"],
        results: List<ResultAllProductsResponseModel>.from(json["results"].map((x) => ResultAllProductsResponseModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "next": next,
        "previous": previous,
        "count": count,
        "results": List<dynamic>.from(results.map((x) => x)),
      };
}

class ResultAllProductsResponseModel extends ResultAllProductsResponse {
  ResultAllProductsResponseModel({
    required id,
    required name,
    required img,
    required inventory,
    required price,
    required exsist,
  }) : super(
          id: id,
          name: name,
          img: img,
          inventory: inventory,
          price: price,
          exsist: exsist,
        );

  factory ResultAllProductsResponseModel.fromJson(Map<String, dynamic> json) => ResultAllProductsResponseModel(
        id: json["id"],
        name: json["name"],
        img: json["img"],
        inventory: json["inventory"],
        price: json["price"],
        exsist: json["exsist"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
        "inventory": inventory,
        "price": price,
        "exsist": exsist,
      };
}
