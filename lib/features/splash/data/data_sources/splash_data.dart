import 'package:baash/core/network/chopper_api.dart';

import '../../../../core/local_storage/local_data.dart';

abstract class SplashData {
  Future<String?> getToken();
}

class SplashDataImpl implements SplashData {
  final ChopperAPI chopperAPI;
  final LocalData localData;

  SplashDataImpl({required this.chopperAPI, required this.localData});

  @override
  Future<String?> getToken() async {
    return await localData.token;
  }
}
