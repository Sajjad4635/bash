class BannersResponse {
  final List<MessageBannersResponse> message;
  final int statusCode;
  final bool success;

  BannersResponse({
    required this.message,
    required this.statusCode,
    required this.success,
  });
}

class MessageBannersResponse {
  final int id;
  final dynamic url;
  final String img;

  MessageBannersResponse({
    required this.id,
    required this.url,
    required this.img,
  });
}
