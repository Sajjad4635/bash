class CreateOtpCodeResponse {
  final MessageCreateOtpCodeResponse message;
  final int statusCode;
  final bool success;

  CreateOtpCodeResponse({
    required this.message,
    required this.statusCode,
    required this.success,
  });
}

class MessageCreateOtpCodeResponse {
  final String message;

  MessageCreateOtpCodeResponse({
    required this.message,
  });
}
