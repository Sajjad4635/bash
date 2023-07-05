import 'package:baash/core/error/exceptions.dart';
import 'package:baash/core/local_storage/preferences/pref.dart';
import 'package:baash/core/network/chopper_api.dart';
import 'package:baash/features/home/data/models/banners_response_model.dart';
import 'package:baash/features/home/data/models/cart_inquiry_response_model.dart';
import 'package:baash/features/home/data/models/category_list_response_model.dart';
import 'package:baash/features/home/domain/use_cases/params/get_all_products_params.dart';
import 'package:flutter/material.dart';

import '../models/all_products_response_model.dart';

abstract class HomeApi {
  Future<CartInquiryResponseModel> cartInquiry();

  Future<BannersResponseModel> getBanners();

  Future<AllProductsResponseModel> getAllProducts(AllProductsParams params);

  Future<CategoryListResponseModel> getCategoryList();
}

class HomeApiImpl implements HomeApi {
  ChopperAPI chopperAPI;

  HomeApiImpl(this.chopperAPI);

  @override
  Future<CartInquiryResponseModel> cartInquiry() async {
    try {
      var response = await chopperAPI.cartInquiry(
        await Pref.get('token'),
      );

      //print(response.base.request!.url.toString());

      if ((response.statusCode == 200 || response.statusCode == 201) && response.body != null) {
        debugPrint(response.bodyString.toString());
        // print(response.body);
        return CartInquiryResponseModel.fromJson(response.body);
      } else {
        throw ServerException(statusCode: response.statusCode, error: response.bodyString);
      }
    } catch (e) {
      throw ServerException(statusCode: 501, error: e.toString());
    }
  }

  @override
  Future<BannersResponseModel> getBanners() async {
    try {
      var response = await chopperAPI.getBanners(
        await Pref.get('token'),
      );

      //print(response.base.request!.url.toString());

      if ((response.statusCode == 200 || response.statusCode == 201) && response.body != null) {
        debugPrint(response.bodyString.toString());
        // print(response.body);
        return BannersResponseModel.fromJson(response.body);
      } else {
        throw ServerException(statusCode: response.statusCode, error: response.bodyString);
      }
    } catch (e) {
      throw ServerException(statusCode: 501, error: e.toString());
    }
  }

  @override
  Future<AllProductsResponseModel> getAllProducts(params) async {
    try {
      var response = await chopperAPI.getAllProducts(
        {
          'category': params.category,
          'name': params.name,
          'page': params.page,
          'page_size': params.pageSize,
        },
        await Pref.get('token'),
      );

      //print(response.base.request!.url.toString());

      if ((response.statusCode == 200 || response.statusCode == 201) && response.body != null) {
        debugPrint(response.bodyString.toString());
        // print(response.body);
        return AllProductsResponseModel.fromJson(response.body);
      } else {
        throw ServerException(statusCode: response.statusCode, error: response.bodyString);
      }
    } catch (e) {
      throw ServerException(statusCode: 501, error: e.toString());
    }
  }

  @override
  Future<CategoryListResponseModel> getCategoryList() async {
    try {
      var response = await chopperAPI.getCategoryList(
        await Pref.get('token'),
      );

      //print(response.base.request!.url.toString());

      if ((response.statusCode == 200 || response.statusCode == 201) && response.body != null) {
        debugPrint(response.bodyString.toString());
        // print(response.body);
        return CategoryListResponseModel.fromJson(response.body);
      } else {
        throw ServerException(statusCode: response.statusCode, error: response.bodyString);
      }
    } catch (e) {
      throw ServerException(statusCode: 501, error: e.toString());
    }
  }
}
