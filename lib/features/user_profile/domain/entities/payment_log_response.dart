class PaymentLogResponse {
  final List<MessagePaymentLogResponse> message;
  final int statusCode;
  final bool success;

  PaymentLogResponse({
    required this.message,
    required this.statusCode,
    required this.success,
  });
}

class MessagePaymentLogResponse {
  final String status;
  final List<CartItemLogPaymentLogResponse> cartItemLogs;
  final DeliveryPersonPaymentLogResponse deliveryPerson;
  final String total;
  final String orderId;
  final String updateDate;

  MessagePaymentLogResponse({
    required this.status,
    required this.cartItemLogs,
    required this.deliveryPerson,
    required this.total,
    required this.orderId,
    required this.updateDate,
  });
}

class CartItemLogPaymentLogResponse {
  final ProductPaymentLogResponse product;
  final int quantity;
  final String perPrice;
  final String totalPrice;

  CartItemLogPaymentLogResponse({
    required this.product,
    required this.quantity,
    required this.perPrice,
    required this.totalPrice,
  });
}

class ProductPaymentLogResponse {
  final int id;
  final String name;
  final String img;
  final String price;

  ProductPaymentLogResponse({
    required this.id,
    required this.name,
    required this.img,
    required this.price,
  });
}

class DeliveryPersonPaymentLogResponse {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String address;

  DeliveryPersonPaymentLogResponse({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.address,
  });
}
