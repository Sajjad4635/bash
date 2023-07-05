class ValidateOtpCodeResponse {
  final MessageValidateOtpCodeResponse message;
  final int statusCode;
  final bool success;

  ValidateOtpCodeResponse({
    required this.message,
    required this.statusCode,
    required this.success,
  });
}

class MessageValidateOtpCodeResponse {
  final String token;
  final String refresh;

  MessageValidateOtpCodeResponse({
    required this.token,
    required this.refresh,
  });
}
