import 'package:baash/core/constants/url_consts.dart';
import 'package:chopper/chopper.dart';

/// this is necessary for the generated code to find your class
part 'chopper_api.chopper.dart';

@ChopperApi()
abstract class ChopperAPI extends ChopperService {
  static ChopperAPI create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(BASE_URL),
      services: [_$ChopperAPI()],
      converter: const JsonConverter(),
    );
    return _$ChopperAPI(client);
  }

  @Post(path: '/shop/product/create_payment/')
  Future<Response> createPayment(@Body() Map<String, dynamic> body, @Header('Authorization') String token);

  @Post(path: CREATE_OTP_CODE)
  Future<Response> createOtpCode(@Body() Map<String, dynamic> body);

  @Post(path: VALIDATE_OTP_CODE)
  Future<Response> validateOtpCode(@Body() Map<String, dynamic> body);

  @Post(path: ADD_TO_CART)
  Future<Response> addToCart(@Body() Map<String, dynamic> body, @Header('Authorization') String token);

  @Delete(path: '/shop/product/{id}/cart_item_delete_view/')
  Future<Response> deleteFromCart(@Path() int id, @Header('Authorization') String token);

  @Get(path: GET_CART)
  Future<Response> getCart(@Header('Authorization') String token);

  @Get(path: BANNERS)
  Future<Response> getBanners(@Header('Authorization') String token);

  @Get(path: GET_ALL_PRODUCTS)
  Future<Response> getAllProducts(@QueryMap() Map<String, dynamic> body, @Header('Authorization') String token);

  @Get(path: GET_CATEGORY_LIST)
  Future<Response> getCategoryList(@Header('Authorization') String token);

  @Get(path: '$GET_PRODUCT_DETAIL{id}/product_detail/')
  Future<Response> getProductDetail(@Path() int id, @Header('Authorization') String token);

  @Get(path: '/shop/product/payment_log/')
  Future<Response> paymentLog(@Header('Authorization') String token);

  @Get(path: USER_PROFILE)
  Future<Response> getUserProfile(@Header('Authorization') String token);

  @Post(path: USER_PROFILE)
  Future<Response> createUserProfile(@Body() Map<String, dynamic> body, @Header('Authorization') String token);

  @Patch(path: USER_PROFILE)
  Future<Response> updateUserProfile(@Body() Map<String, dynamic> body, @Header('Authorization') String token);

  @Get(path: '/shop/product/user_cart_inquiry/')
  Future<Response> cartInquiry(@Header('Authorization') String token);
}
