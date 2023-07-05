import '../../domain/entities/setting_response.dart';

class SettingResponseModel extends SettingResponse {
  const SettingResponseModel({required super.success, required super.message, super.data});

  factory SettingResponseModel.fromJson(Map<String, dynamic> json) {
    return SettingResponseModel(success: json['success'], message: json['message'], data: json['data'] == null ? null : DataResponseModel.fromJson(json['data']));
  }
}

class DataResponseModel extends DataResponse {
  const DataResponseModel({required super.android, required super.ios});

  factory DataResponseModel.fromJson(Map<String, dynamic> json) {
    return DataResponseModel(
      android: MobileSettingResponseModel.fromJson(json['android']),
      ios: MobileSettingResponseModel.fromJson(json['ios']),
    );
  }
}

class MobileSettingResponseModel extends MobileSettingResponse {
  const MobileSettingResponseModel({required super.version, required super.url, required super.isForced});

  factory MobileSettingResponseModel.fromJson(Map<String, dynamic> json) {
    return MobileSettingResponseModel(url: json['url'], version: json['version'], isForced: json['is_forced']);
  }
}
