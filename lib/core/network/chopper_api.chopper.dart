// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chopper_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ChopperAPI extends ChopperAPI {
  _$ChopperAPI([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ChopperAPI;

  @override
  Future<Response<dynamic>> createPayment(
    Map<String, dynamic> body,
    String token,
  ) {
    final Uri $url = Uri.parse('/shop/product/create_payment/');
    final Map<String, String> $headers = {
      'Authorization': token,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createOtpCode(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/base/user/create_otp_code/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> validateOtpCode(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/base/user/validate_otp_code/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> addToCart(
    Map<String, dynamic> body,
    String token,
  ) {
    final Uri $url = Uri.parse('/shop/product/cart_item_add_view/');
    final Map<String, String> $headers = {
      'Authorization': token,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteFromCart(
    int id,
    String token,
  ) {
    final Uri $url = Uri.parse('/shop/product/${id}/cart_item_delete_view/');
    final Map<String, String> $headers = {
      'Authorization': token,
    };
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getCart(String token) {
    final Uri $url = Uri.parse('/shop/product/cart_view/');
    final Map<String, String> $headers = {
      'Authorization': token,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getBanners(String token) {
    final Uri $url = Uri.parse('/base/wop/banar_images_view/');
    final Map<String, String> $headers = {
      'Authorization': token,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAllProducts(
    Map<String, dynamic> body,
    String token,
  ) {
    final Uri $url = Uri.parse('/shop/product/product_list/');
    final Map<String, dynamic> $params = body;
    final Map<String, String> $headers = {
      'Authorization': token,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getCategoryList(String token) {
    final Uri $url = Uri.parse('/shop/product/category_list/');
    final Map<String, String> $headers = {
      'Authorization': token,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getProductDetail(
    int id,
    String token,
  ) {
    final Uri $url = Uri.parse('/shop/product/${id}/product_detail/');
    final Map<String, String> $headers = {
      'Authorization': token,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> paymentLog(String token) {
    final Uri $url = Uri.parse('/shop/product/payment_log/');
    final Map<String, String> $headers = {
      'Authorization': token,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getUserProfile(String token) {
    final Uri $url = Uri.parse('/base/user/profile_view/');
    final Map<String, String> $headers = {
      'Authorization': token,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createUserProfile(
    Map<String, dynamic> body,
    String token,
  ) {
    final Uri $url = Uri.parse('/base/user/profile_view/');
    final Map<String, String> $headers = {
      'Authorization': token,
    };
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateUserProfile(
    Map<String, dynamic> body,
    String token,
  ) {
    final Uri $url = Uri.parse('/base/user/profile_view/');
    final Map<String, String> $headers = {
      'Authorization': token,
    };
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> cartInquiry(String token) {
    final Uri $url = Uri.parse('/shop/product/user_cart_inquiry/');
    final Map<String, String> $headers = {
      'Authorization': token,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
