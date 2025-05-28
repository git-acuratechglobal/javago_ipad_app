import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/theme.dart';
import 'package:java_go/home/bottombar.dart';
import 'package:java_go/service/local_storage_service.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'auth/pages/login/login_screen.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  final prefs = await SharedPreferences.getInstance();
  runApp( ProviderScope(
      overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
      ],
            child: MyApp(),
    ),);
}

class MyApp extends ConsumerWidget {

  const MyApp({super.key, });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
     final isLoggedIn=ref.watch(localStorageServiceProvider).getToken();
    return ScreenUtilInit(
        designSize: Size(1194, 834),
        builder: (context, child) {
          return MaterialApp(
            title: 'JAVA GO',
            theme: Themes.lightTheme,
            home:
            // isLoggedIn.isNotEmpty ?  CustomBottomNavBar() :
            const LoginScreen(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}