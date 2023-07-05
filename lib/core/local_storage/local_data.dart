import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalData {
  Future<String?> get profileString;

  Future<String?> get token;

  void setProfileString(String data);

  void setToken(String data);

  void removeToken(String data);
}

class LocalDataImpl implements LocalData {
  SharedPreferences storage;

  LocalDataImpl({required this.storage});

  @override
  Future<String?> get profileString async => storage.getString('profile');

  @override
  Future<String?> get token async => storage.getString('token');

  @override
  void setProfileString(String data) async {
    await storage.setString('profile', data);
  }

  @override
  void setToken(String data) async {
    await storage.setString('token', data);
  }

  @override
  void removeToken(String key) async {
    await storage.remove(key);
  }
}

//ali
// eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoyMDAxOTA2Mjc3LCJpYXQiOjE2ODY1NDYyNzcsImp0aSI6ImU5OGZiOTIyMzIyYjRhOGY4ODdhYjgxZDBlNmFhNTdhIiwidXNlcl9pZCI6MjF9.nZx6WeeB8E1NHo44ewzWue7pLrPpqX2ymZQ6OxdDTrA
//sajjad
// eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoyMDAxOTA2NDczLCJpYXQiOjE2ODY1NDY0NzMsImp0aSI6ImNhNTU4YmRjOTQ5OTQwMzNhYjk2ODI4NzNmNjMyZjFiIiwidXNlcl9pZCI6Mn0.UqpnMMeME3Gv1jaRz8oIcFYTlWLGssnbDWxYdjRkQwU
