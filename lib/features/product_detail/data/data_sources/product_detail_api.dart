import 'package:baash/core/error/exceptions.dart';
import 'package:baash/core/local_storage/preferences/pref.dart';
import 'package:baash/core/network/chopper_api.dart';
import 'package:baash/features/shopping_cart/data/models/add_to_cart_response_model.dart';
import 'package:flutter/material.dart';

import '../models/product_detail_response_model.dart';

abstract class ProductDetailApi {
  Future<ProductDetailResponseModel> getProductDetail(int id);

  Future<AddProductToCartResponseModel> addToCart(String id);
}

class ProductDetailApiImpl implements ProductDetailApi {
  ChopperAPI chopperAPI;

  ProductDetailApiImpl(this.chopperAPI);

  @override
  Future<ProductDetailResponseModel> getProductDetail(id) async {
    try {
      var response = await chopperAPI.getProductDetail(
        id,
        await Pref.get('token'),
      );

      //print(response.base.request!.url.toString());
      //print(response.statusCode);

      if ((response.statusCode == 200 || response.statusCode == 201) && response.body != null) {
        // debugprint(response.bodyString);
        return ProductDetailResponseModel.fromJson(response.body);
      } else {
        throw ServerException(statusCode: response.statusCode, error: response.body);
      }
    } catch (e) {
      throw ServerException(statusCode: 501, error: e.toString());
    }
  }

  @override
  Future<AddProductToCartResponseModel> addToCart(String id) async {
    try {
      //print('::::::::::::::::::::::::::::::::::::::::::');
      var response = await chopperAPI.addToCart(
        {'product': int.parse(id)},
        await Pref.get('token'),
      );

      //print('response.base.request!.url.toString()');
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
}
