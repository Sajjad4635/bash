import 'dart:convert';

import 'package:baash/features/product_detail/domain/entities/product_detail_response.dart';

ProductDetailResponseModel productDetailResponseModelFromJson(String str) => ProductDetailResponseModel.fromJson(json.decode(str));

String productDetailResponseModelToJson(ProductDetailResponseModel data) => json.encode(data.toJson());

class ProductDetailResponseModel extends ProductDetailResponse {
  ProductDetailResponseModel({
    required message,
    required statusCode,
    required success,
  }) : super(
          message: message,
          statusCode: statusCode,
          success: success,
        );

  factory ProductDetailResponseModel.fromJson(Map<String, dynamic> json) => ProductDetailResponseModel(
        message: MessageProductDetailResponseModel.fromJson(json["message"]),
        statusCode: json["status_code"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status_code": statusCode,
        "success": success,
      };
}

class MessageProductDetailResponseModel extends MessageProductDetailResponse {
  MessageProductDetailResponseModel({
    required id,
    required name,
    required inventory,
    required er,
    required otherProductEr,
    required price,
    required descriptions,
    required supplementaryImages,
    required category,
    required productFeatures,
    required partSwingProducts,
    required img,
  }) : super(
          id: id,
          name: name,
          inventory: inventory,
          er: er,
          otherProductEr: otherProductEr,
          price: price,
          descriptions: descriptions,
          supplementaryImages: supplementaryImages,
          category: category,
          productFeatures: productFeatures,
          partSwingProducts: partSwingProducts,
          img: img,
        );

  factory MessageProductDetailResponseModel.fromJson(Map<String, dynamic> json) => MessageProductDetailResponseModel(
        id: json["id"],
        name: json["name"],
        inventory: json["inventory"],
        er: json["er"],
        otherProductEr: List<OtherProductErProductDetailResponseModel>.from(json["other_product_er"].map((x) => OtherProductErProductDetailResponseModel.fromJson(x))),
        price: json["price"],
        descriptions: json["descriptions"],
        supplementaryImages: List<SupplementaryImageProductDetailResponseModel>.from(json["supplementary_images"].map((x) => SupplementaryImageProductDetailResponseModel.fromJson(x))),
        category: CategoryProductDetailResponseModel.fromJson(json["category"]),
        productFeatures: List<ProductFeatureProductDetailResponseModel>.from(json["product_features"].map((x) => ProductFeatureProductDetailResponseModel.fromJson(x))),
        partSwingProducts: List<dynamic>.from(json["part_swing_products"].map((x) => x)),
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "inventory": inventory,
        "er": er,
        "other_product_er": List<dynamic>.from(otherProductEr.map((x) => x)),
        "price": price,
        "descriptions": descriptions,
        "supplementary_images": List<dynamic>.from(supplementaryImages.map((x) => x)),
        "category": category,
        "product_features": List<dynamic>.from(productFeatures.map((x) => x)),
        "part_swing_products": List<dynamic>.from(partSwingProducts.map((x) => x)),
        "img": img,
      };
}

class CategoryProductDetailResponseModel extends CategoryProductDetailResponse {
  CategoryProductDetailResponseModel({
    required id,
    required name,
    required img,
  }) : super(
          id: id,
          name: name,
          img: img,
        );

  factory CategoryProductDetailResponseModel.fromJson(Map<String, dynamic> json) => CategoryProductDetailResponseModel(
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

class OtherProductErProductDetailResponseModel extends OtherProductErProductDetailResponse {
  OtherProductErProductDetailResponseModel({
    required id,
    required name,
    required er,
  }) : super(
          id: id,
          name: name,
          er: er,
        );

  factory OtherProductErProductDetailResponseModel.fromJson(Map<String, dynamic> json) => OtherProductErProductDetailResponseModel(
        id: json["id"],
        name: json["name"],
        er: json["er"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "er": er,
      };
}

class ProductFeatureProductDetailResponseModel extends ProductFeatureProductDetailResponse {
  ProductFeatureProductDetailResponseModel({
    required id,
    required name,
    required value,
  }) : super(
          id: id,
          name: name,
          value: value,
        );

  factory ProductFeatureProductDetailResponseModel.fromJson(Map<String, dynamic> json) => ProductFeatureProductDetailResponseModel(
        id: json["id"],
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "value": value,
      };
}

class SupplementaryImageProductDetailResponseModel extends SupplementaryImageProductDetailResponse {
  SupplementaryImageProductDetailResponseModel({
    required id,
    required img,
  }) : super(
          id: id,
          img: img,
        );

  factory SupplementaryImageProductDetailResponseModel.fromJson(Map<String, dynamic> json) => SupplementaryImageProductDetailResponseModel(
        id: json["id"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "img": img,
      };
}
