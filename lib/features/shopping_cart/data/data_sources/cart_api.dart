import 'package:baash/core/error/exceptions.dart';
import 'package:baash/core/local_storage/preferences/pref.dart';
import 'package:baash/core/network/chopper_api.dart';
import 'package:baash/core/network/token_handler.dart';
import 'package:baash/features/shopping_cart/data/models/add_to_cart_response_model.dart';
import 'package:baash/features/shopping_cart/data/models/get_cart_response_model.dart';
import 'package:baash/features/shopping_cart/data/models/payment_response_model.dart';
import 'package:baash/features/shopping_cart/domain/use_cases/params/payment_params.dart';
import 'package:baash/injection.dart';
import 'package:flutter/material.dart';

abstract class CartApi {
  Future<GetCartResponseModel> getCart();

  Future<AddProductToCartResponseModel> addToCart(String id);

  Future<String> deleteFromCart(String id);

  Future<PaymentResponseModel> createPayment(CreatePaymentParams params);
}

class CartApiImpl implements CartApi {
  ChopperAPI chopperAPI;

  CartApiImpl(this.chopperAPI);

  @override
  Future<GetCartResponseModel> getCart() async {
    try {
      var response = await chopperAPI.getCart(
        await Pref.get('token'),
      );

      if ((response.statusCode == 200 || response.statusCode == 201) && response.body != null) {
        debugPrint(response.bodyString.toString());
        // print(response.body);
        return GetCartResponseModel.fromJson(response.body);
      } else {
        throw ServerException(statusCode: response.statusCode, error: response.bodyString);
      }
    } catch (e) {
      throw ServerException(statusCode: 501, error: e.toString());
    }
  }

  @override
  Future<AddProductToCartResponseModel> addToCart(String id) async {
    try {
      var response = await chopperAPI.addToCart(
        {'product': int.parse(id)},
        await Pref.get('token'),
      );

      //print(response.base.request!.url.toString());

      if ((response.statusCode == 200 || response.statusCode == 201) && response.body != null) {
        debugPrint(response.bodyString.toString());
        // print(response.body);
        return AddProductToCartResponseModel.fromJson(response.body);
      } else {
        throw ServerException(statusCode: response.statusCode, error: response.bodyString);
      }
    } catch (e) {
      throw ServerException(statusCode: 501, error: e.toString());
    }
  }

  @override
  Future<String> deleteFromCart(String id) async {
    try {
      var response = await chopperAPI.deleteFromCart(
        int.parse(id),
        await Pref.get('token'),
      );

      //print(response.base.request!.url.toString());

      if (response.statusCode == 204 || (response.statusCode == 200 || response.statusCode == 201) && response.body != null) {
        debugPrint(response.bodyString.toString());
        // print(response.body);
        return 'true';
      } else {
        throw ServerException(statusCode: response.statusCode, error: response.bodyString);
      }
    } catch (e) {
      throw ServerException(statusCode: 501, error: e.toString());
    }
  }

  @override
  Future<PaymentResponseModel> createPayment(CreatePaymentParams params) async {
    try {
      var response = await chopperAPI.createPayment(
        {
          'cart': params.cart,
          'first_name': params.firstName,
          'last_name': params.lastName,
          'phone_number': params.phoneNumber,
          'email': params.email,
          'address': params.address,
          'mobile': params.mobile,
          'amount': params.amount,
        },
        await Pref.get('token'),
      );

      //print(response.base.request!.url.toString());

      if ((response.statusCode == 200 || response.statusCode == 201) && response.body != null) {
        debugPrint(response.bodyString.toString());
        // print(response.body);
        return PaymentResponseModel.fromJson(response.body);
      } else {
        throw ServerException(statusCode: response.statusCode, error: response.bodyString);
      }
    } catch (e) {
      throw ServerException(statusCode: 501, error: e.toString());
    }
  }
}
