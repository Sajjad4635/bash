class ProductDetailResponse {
  final MessageProductDetailResponse message;
  final int statusCode;
  final bool success;

  ProductDetailResponse({
    required this.message,
    required this.statusCode,
    required this.success,
  });
}

class MessageProductDetailResponse {
  final int id;
  final String name;
  final int inventory;
  final String? er;
  final List<OtherProductErProductDetailResponse> otherProductEr;
  final String price;
  final String descriptions;
  final List<SupplementaryImageProductDetailResponse> supplementaryImages;
  final CategoryProductDetailResponse category;
  final List<ProductFeatureProductDetailResponse> productFeatures;
  final List<dynamic> partSwingProducts;
  final String img;

  MessageProductDetailResponse({
    required this.id,
    required this.name,
    required this.inventory,
    this.er,
    required this.otherProductEr,
    required this.price,
    required this.descriptions,
    required this.supplementaryImages,
    required this.category,
    required this.productFeatures,
    required this.partSwingProducts,
    required this.img,
  });
}

class CategoryProductDetailResponse {
  final int id;
  final String name;
  final String img;

  CategoryProductDetailResponse({
    required this.id,
    required this.name,
    required this.img,
  });
}

class OtherProductErProductDetailResponse {
  final int id;
  final String name;
  final String er;

  OtherProductErProductDetailResponse({
    required this.id,
    required this.name,
    required this.er,
  });
}

class ProductFeatureProductDetailResponse {
  final int id;
  final String name;
  final String value;

  ProductFeatureProductDetailResponse({
    required this.id,
    required this.name,
    required this.value,
  });
}

class SupplementaryImageProductDetailResponse {
  final int id;
  final String img;

  SupplementaryImageProductDetailResponse({
    required this.id,
    required this.img,
  });
}
