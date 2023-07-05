class PaymentResponse {
  final MessagePaymentResponse message;
  final int statusCode;
  final bool success;

  PaymentResponse({
    required this.message,
    required this.statusCode,
    required this.success,
  });
}

class MessagePaymentResponse {
  final String message;

  MessagePaymentResponse({
    required this.message,
  });
}
