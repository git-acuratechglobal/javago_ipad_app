import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_storage_service.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) {
  return throw UnimplementedError();
}

@Riverpod(keepAlive: true)
LocalStorageService localStorageService(Ref ref) {
  return LocalStorageService(ref.watch(sharedPreferencesProvider));
}

class LocalStorageService {
  final SharedPreferences _preferences;

  LocalStorageService(this._preferences);

  static const String _authTokenKey = "token";
  static const String _userLoginSaved = "user";

  static const String _stripAccountId = "accountId";

  Future<void> setToken(String token) async {
    await _preferences.setString(_authTokenKey, token);
  }

  String getToken() {
    return _preferences.getString(_authTokenKey) ?? "";
  }

  Future<void> setUserLoginSaved(bool isLoginSaved) async {
    await _preferences.setBool(_userLoginSaved, isLoginSaved);
  }

  bool getUserLoginSaved() {
    return _preferences.getBool(_userLoginSaved) ?? false;
  }

  Future<void> setStripAccountId(String accountId) async {
    await _preferences.setString(_stripAccountId, accountId);
  }

  String? getStripAccountId() {
    return _preferences.getString(_stripAccountId);
  }

  Future<void> clearSession() async {
    _preferences.remove(_authTokenKey);
    _preferences.remove(_userLoginSaved);
  }
}
