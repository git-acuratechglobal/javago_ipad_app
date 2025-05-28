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

  Future<void> setToken(String token) async {
    await _preferences.setString(_authTokenKey, token);
  }

  String getToken() {
    return _preferences.getString(_authTokenKey) ?? "";
  }


  Future<void>clearSession()async{
    _preferences.remove(_authTokenKey);
  }

}
