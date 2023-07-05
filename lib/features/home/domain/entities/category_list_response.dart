class CategoryListResponse {
  final List<MessageCategoryListResponse> message;
  final int statusCode;
  final bool success;

  CategoryListResponse({
    required this.message,
    required this.statusCode,
    required this.success,
  });
}

class MessageCategoryListResponse {
  final int id;
  final String name;
  final String img;

  MessageCategoryListResponse({
    required this.id,
    required this.name,
    required this.img,
  });
}
