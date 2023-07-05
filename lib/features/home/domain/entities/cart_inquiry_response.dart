class CartInquiryResponse {
  final MessageCartInquiryResponse? message;
  final int? statusCode;
  final bool? success;

  CartInquiryResponse({
    this.message,
    this.statusCode,
    this.success,
  });
}

class MessageCartInquiryResponse {
  final int? quantity;

  MessageCartInquiryResponse({
    this.quantity,
  });
}
