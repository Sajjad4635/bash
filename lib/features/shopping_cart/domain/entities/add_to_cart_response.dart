class AddProductToCartResponse {
  final MessageAddProductToCartResponse message;
  final int statusCode;
  final bool success;

  AddProductToCartResponse({
    required this.message,
    required this.statusCode,
    required this.success,
  });
}

class MessageAddProductToCartResponse {
  final int product;
  final int quantity;
  final String perPrice;

  MessageAddProductToCartResponse({
    required this.product,
    required this.quantity,
    required this.perPrice,
  });
}
