import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:baash/core/error/exceptions.dart';
import 'package:baash/core/network/chopper_api.dart';
import 'package:baash/features/login/data/models/verify_code_response_model.dart';

import '../models/send_number_response_model.dart';

abstract class LoginApi {
  Future<CreateOtpCodeResponseModel> sendNumber(String number);

  Future<ValidateOtpCodeResponseModel> verifyCode(String number, int code);
}

class LoginApiImpl implements LoginApi {
  ChopperAPI chopperAPI;

  LoginApiImpl(this.chopperAPI);

  @override
  Future<CreateOtpCodeResponseModel> sendNumber(String number) async {
    try {
      var response = await chopperAPI.createOtpCode({'mobile': number});

      print('::::::::::${response.statusCode}');
      if ((response.statusCode == 200 || response.statusCode == 201) && response.body != null) {
        debugPrint(response.bodyString);
        return CreateOtpCodeResponseModel.fromJson(json.decode(response.bodyString));
      } else {
        throw ServerException(statusCode: response.statusCode, error: response.bodyString);
      }
    } catch (e) {
      throw ServerException(statusCode: 501, error: e.toString());
    }
  }

  @override
  Future<ValidateOtpCodeResponseModel> verifyCode(String number, int code) async {
    try {
      var response = await chopperAPI.validateOtpCode({'mobile': number, 'code': code});
      if ((response.statusCode == 200 || response.statusCode == 201) && response.body != null) {
        debugPrint(response.bodyString);
        return ValidateOtpCodeResponseModel.fromJson(json.decode(response.bodyString));
      } else {
        throw ServerException(statusCode: response.statusCode, error: response.bodyString);
      }
    } catch (e) {
      throw ServerException(statusCode: 501, error: e.toString());
    }
  }
}
