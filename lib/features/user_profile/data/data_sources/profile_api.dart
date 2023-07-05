import 'package:baash/core/error/exceptions.dart';
import 'package:baash/core/local_storage/preferences/pref.dart';
import 'package:baash/core/network/chopper_api.dart';
import 'package:baash/core/network/token_handler.dart';
import 'package:baash/features/user_profile/data/models/payment_log_response_model.dart';
import 'package:baash/features/user_profile/data/models/update_user_profile_response_model.dart';
import 'package:baash/features/user_profile/data/models/user_profile_response_model.dart';
import 'package:baash/features/user_profile/domain/use_cases/params/update_profile_params.dart';
import 'package:baash/injection.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

abstract class ProfileApi {
  Future<UserProfileResponseModel> getUserProfile();

  Future<UpdateUserProfileResponseModel> createProfile(UpdateProfileParams params);

  Future<UpdateUserProfileResponseModel> updateProfile(UpdateProfileParams params);

  Future<PaymentLogResponseModel> paymentLop();
}

class ProfileApiImpl implements ProfileApi {
  ChopperAPI chopperAPI;

  ProfileApiImpl(this.chopperAPI);

  @override
  Future<UserProfileResponseModel> getUserProfile() async {
    try {
      var response = await chopperAPI.getUserProfile(
        await Pref.get('token'),
      );

      //print(response.base.request!.url.toString());

      if ((response.statusCode == 200 || response.statusCode == 201) && response.body != null) {
        debugPrint(response.bodyString.toString());
        // print(response.body);
        return UserProfileResponseModel.fromJson(response.body);
      } else {
        throw ServerException(statusCode: response.statusCode, error: response.bodyString);
      }
    } catch (e) {
      throw ServerException(statusCode: 501, error: e.toString());
    }
  }

  @override
  Future<UpdateUserProfileResponseModel> createProfile(UpdateProfileParams params) async {
    try {
      //print(':::::::::::::::::::::::::::::');
      //print(params.name);
      //print(params.lastName);
      //print(params.shopName);
      //print(params.address);
      //print(params.mobile);
      //print(params.province);
      //print(params.county);
      //print(params.email);
      var response = await chopperAPI.createUserProfile(
        {
          'first_name': params.name,
          'last_name': params.lastName,
          'shop_name': params.shopName,
          'address': params.address,
          'phone_number': params.mobile.toEnglishDigit(),
          'province': params.province,
          'county': params.county,
          'email': params.email,
        },
        await Pref.get('token'),
      );

      //print(response.base.request!.url.toString());
      //print(response.statusCode);

      if ((response.statusCode == 200 || response.statusCode == 201) && response.body != null) {
        debugPrint(response.bodyString.toString());
        // print(response.body);
        return UpdateUserProfileResponseModel.fromJson(response.body);
      } else {
        throw ServerException(statusCode: response.statusCode, error: response.bodyString);
      }
    } catch (e) {
      throw ServerException(statusCode: 501, error: e.toString());
    }
  }

  @override
  Future<UpdateUserProfileResponseModel> updateProfile(UpdateProfileParams params) async {
    try {
      //print(':::::::::::::::::::::::::::::');
      //print(params.name);
      //print(params.lastName);
      //print(params.shopName);
      //print(params.address);
      //print(params.mobile);
      //print(params.province);
      //print(params.county);
      //print(params.email);
      var response = await chopperAPI.updateUserProfile(
        {
          'first_name': params.name,
          'last_name': params.lastName,
          'shop_name': params.shopName,
          'address': params.address,
          'phone_number': params.mobile,
          'province': params.province,
          'county': params.county,
          'email': params.email,
        },
        await Pref.get('token'),
      );

      //print(response.base.request!.url.toString());
      //print(response.statusCode);

      if ((response.statusCode == 200 || response.statusCode == 202) && response.body != null) {
        debugPrint(response.bodyString.toString());
        // print(response.body);
        return UpdateUserProfileResponseModel.fromJson(response.body);
      } else {
        throw ServerException(statusCode: response.statusCode, error: response.bodyString);
      }
    } catch (e) {
      throw ServerException(statusCode: 501, error: e.toString());
    }
  }

  @override
  Future<PaymentLogResponseModel> paymentLop() async {
    try {
      var response = await chopperAPI.paymentLog(
        await Pref.get('token'),
      );

      //print(response.base.request!.url.toString());
      //print(response.statusCode);

      if ((response.statusCode == 200 || response.statusCode == 202) && response.body != null) {
        debugPrint(response.bodyString.toString());
        // print(response.body);
        return PaymentLogResponseModel.fromJson(response.body);
      } else {
        throw ServerException(statusCode: response.statusCode, error: response.bodyString);
      }
    } catch (e) {
      throw ServerException(statusCode: 501, error: e.toString());
    }
  }
}
