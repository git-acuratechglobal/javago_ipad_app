

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// final sharedPrefsProvider = Provider<SharedPreferences>((ref) {
//   throw UnimplementedError(); // Provide it in main()
// });

// final loginStatusProvider = FutureProvider<bool>((ref) async {
//   final prefs = ref.watch(sharedPrefsProvider);
//   return prefs.getBool('isLoggedIn') ?? false;
// });

// final loginManageProvider = Provider<LoginManage>((ref) {
//   final prefs = ref.watch(sharedPrefsProvider);
//   return LoginManage(prefs);
// });

// class LoginManage {
//   final SharedPreferences _prefs;
//   static const _key = 'isLoggedIn';

//   LoginManage(this._prefs);

//   Future<void> setLogin(bool value) async {
//     await _prefs.setBool(_key, value);
//   }

//   bool isLoggedIn() {
//     return _prefs.getBool(_key) ?? false;
//   }

//   Future<void> logout() async {
//     await _prefs.remove(_key);
//   }
// }