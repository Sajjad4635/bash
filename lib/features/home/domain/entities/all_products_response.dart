class AllProductsResponse {
  final MessageAllProductsResponse message;
  final int statusCode;
  final bool success;

  AllProductsResponse({
    required this.message,
    required this.statusCode,
    required this.success,
  });
}

class MessageAllProductsResponse {
  // final dynamic next;
  // final dynamic previous;
  final int count;
  final List<ResultAllProductsResponse> results;

  MessageAllProductsResponse({
    // required this.next,
    // required this.previous,
    required this.count,
    required this.results,
  });
}

class ResultAllProductsResponse {
  final int id;
  final String name;
  final String? img;
  final String price;
  final bool exsist;
  final CategoryAllProductsResponse category;
  final String brand;

  ResultAllProductsResponse({
    required this.id,
    required this.name,
    this.img,
    required this.price,
    required this.exsist,
    required this.category,
    required this.brand,
  });

}

class CategoryAllProductsResponse {
  final int id;
  final String name;
  final String img;

  CategoryAllProductsResponse({
    required this.id,
    required this.name,
    required this.img,
  });

}