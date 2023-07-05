import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class SettingResponse extends Equatable {
  final bool success;
  final String message;
  final DataResponse? data;

  const SettingResponse({required this.success, required this.message, this.data});

  @override
  List<Object?> get props => [success, message, data];
}

@immutable
class DataResponse extends Equatable {
  final MobileSettingResponse android;
  final MobileSettingResponse ios;

  const DataResponse({required this.android, required this.ios});

  @override
  List<Object?> get props => [android, ios];
}

@immutable
class MobileSettingResponse extends Equatable {
  final String version;
  final String url;
  final bool isForced;

  const MobileSettingResponse({required this.version, required this.url, required this.isForced});

  @override
  List<Object?> get props => [version, url, isForced];
}
