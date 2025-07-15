import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:java_go/Theme/theme.dart';
import 'package:java_go/service/firebase_service.dart';
import 'package:java_go/service/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth/pages/login/login_screen.dart';
import 'auth/pages/steps/stepper_widget.dart';
import 'home/bottombar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  final spTest = dotenv.env['STRIPE_PUBLISH_KEY_TEST'];
  Stripe.publishableKey = spTest!;
  await Stripe.instance.applySettings();
  await FirebaseMessageService.initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  final prefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: JavaGoApp(),
    ),
  );
}

class JavaGoApp extends ConsumerStatefulWidget {
  const JavaGoApp({super.key});

  @override
  ConsumerState createState() => _JavaGoAppState();
}

class _JavaGoAppState extends ConsumerState<JavaGoApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleFcmToken();
    });
  }

  Future<void> _handleFcmToken() async {
    final localStorage = ref.read(localStorageServiceProvider);
    final firebaseService = ref.read(firebaseServiceProvider);

    final savedToken = localStorage.getFcmToken();
    if (savedToken != null) return;

    final newToken = await firebaseService.getFcmToken();
    if (newToken != null) {
      localStorage.setFcmToken(newToken);
      ref.invalidate(localStorageServiceProvider);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoggedIn =
        ref.watch(localStorageServiceProvider).getUserLoginSaved();
    return ScreenUtilInit(
        designSize: Size(1194, 834),
        builder: (context, child) {
          return MaterialApp(
            title: 'JAVA GO',
            theme: Themes.lightTheme,
            home: isLoggedIn ? CustomBottomNavBar() : const LoginScreen(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
