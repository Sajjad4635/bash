class GetCartResponse {
  final MessageGetCartResponse message;
  final int statusCode;
  final bool success;

  GetCartResponse({
    required this.message,
    required this.statusCode,
    required this.success,
  });
}

class MessageGetCartResponse {
  final List<CartItemGetCartResponsea> cartItems;
  final String? status;
  final String total;
  final int paymentId;

  MessageGetCartResponse({
    required this.cartItems,
    this.status,
    required this.total,
    required this.paymentId,
  });
}

class CartItemGetCartResponsea {
  final ProductGetCartResponse product;
  final int quantity;
  final String perPrice;
  final String totalPrice;

  CartItemGetCartResponsea({
    required this.product,
    required this.quantity,
    required this.perPrice,
    required this.totalPrice,
  });
}

class ProductGetCartResponse {
  final int id;
  final String name;
  final String category;
  final int inventory;
  final String price;
  final String img;

  ProductGetCartResponse({
    required this.id,
    required this.name,
    required this.category,
    required this.inventory,
    required this.price,
    required this.img,
  });
}
