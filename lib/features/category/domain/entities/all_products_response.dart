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
  final String? next;
  final String? previous;
  final int count;
  final List<ResultAllProductsResponse> results;

  MessageAllProductsResponse({
    this.next,
    this.previous,
    required this.count,
    required this.results,
  });
}

class ResultAllProductsResponse {
  final int id;
  final String name;
  final String img;
  final int inventory;
  final String price;
  final bool exsist;

  ResultAllProductsResponse({
    required this.id,
    required this.name,
    required this.img,
    required this.inventory,
    required this.price,
    required this.exsist,
  });
}
