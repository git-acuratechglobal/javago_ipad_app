import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/theme.dart';
import 'package:java_go/home/bottombar.dart';

import 'package:java_go/login/login_screen.dart';
import 'package:java_go/service/local_storage_service.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  runApp( ProviderScope(
      overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
      ],
            child: MyApp(isLoggedIn: isLoggedIn),
    ),);
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: Size(1194, 834),
        builder: (context, child) {
          return MaterialApp(
            title: 'JAVA GO',
            theme: Themes.lightTheme,
            home: isLoggedIn ? const CustomBottomNavBar() : const LoginScreen(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}