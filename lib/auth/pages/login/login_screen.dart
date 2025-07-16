import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/config/common/button.dart';
import 'package:java_go/config/validator.dart';
import 'package:java_go/home/bottombar.dart';
import 'package:java_go/service/local_storage_service.dart';
import '../../notifier/auth_notifier.dart';
import '../../state/auth_state/auth_state.dart';
import '../steps/stepper_widget.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _isPasswordVisible = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.listenManual(authNotifierProvider, (previous, next) async {
        switch (next) {
          case AsyncData<AuthState?> data when data.value != null:
            final authState = data.value;
            final controller = ref.read(cafePageControllerProvider);
            final saveUserLogin = ref.read(localStorageServiceProvider);
            final shouldReturnToReview = ref.read(returnToReviewProvider);

            if (authState?.authEvent == AuthEvent.login) {
              final profile = authState?.cafeModel;
              final controller = ref.read(cafePageControllerProvider);

              final steps = [
                MapEntry(0, profile?.signupCompleted),
                MapEntry(1, profile?.profileCompleted),
                MapEntry(3, profile?.menuCompleted),
                MapEntry(4, profile?.loyaltyCompleted),
                MapEntry(6, profile?.stripeOnboardingCompleted),
                MapEntry(6, profile?.squareOnboardingCompleted),
                MapEntry(7, profile?.isPublished == 0 ? 0 : 1),
              ];

              final nextStepPage = steps
                  .firstWhere(
                    (entry) => entry.value == 0,
                    orElse: () => const MapEntry(-1, 1),
                  )
                  .key;

              if (nextStepPage >= 0) {
                context.navigateAndRemoveUntil(const CafeSteps());
                Future.delayed(const Duration(milliseconds: 300), () {
                  if (controller.hasClients) {
                    controller.jumpToPage(nextStepPage);
                  }
                });
              } else {
                if (context.mounted) {
                  saveUserLogin.setUserLoginSaved(true);
                  context.navigateAndRemoveUntil(CustomBottomNavBar());
                }
              }

              return;
            }
            if (authState?.authEvent == AuthEvent.signUp) {
              if (controller.hasClients) {
                controller.nextPage(
                  duration: Duration(milliseconds: 250),
                  curve: Curves.bounceIn,
                );
              }
              return;
            }

          case AsyncError error:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error.error.toString())),
            );
        }
      });
    });
  }

  Future<void> _onLoginPressed() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final validators = ref.read(validatorsProvider);

    final emailError = validators.validateEmail(email);

    ref.read(authNotifierProvider.notifier).login(email, password);
    if (emailError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(emailError)),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(
          child: Container(
              decoration: BoxDecoration(color: const Color(0xFFC0987C)),
              child: Center(
                child: Container(
                  width: 308,
                  height: 360,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(154),
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/logo_java_go.png',
                      width: 196.w,
                      height: 181.02.h,
                    ),
                  ),
                ),
              )),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(color: Color(0xFFF5F3F0)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 121),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cafe Log in',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Color(0xFF461C10)),
                  ),
                  48.verticalSpace,
                  TextFormField(
                    cursorColor: Color(0xFFC0987C),
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintStyle:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: const Color(0xFF1C0E07),
                                ),
                        prefixIcon: Container(
                          width: 70.w,
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 10.w),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset(
                                'assets/images/email.png',
                                color: Color(0xFF6A442E),
                                height: 20.h,
                                width: 20.h,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(width: 10.w),
                              Container(
                                height: 20.h,
                                child: VerticalDivider(
                                  width: 2.w,
                                  thickness: 1.5,
                                  color: Color(0xFF6A442E),
                                ),
                              ),
                              SizedBox(width: 10.w),
                            ],
                          ),
                        ),
                        hintText: 'Enter your email'),
                  ),
                  25.verticalSpace,
                  TextFormField(
                    cursorColor: Color(0xFFC0987C),
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        width: 70.w,
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/frame1.png',
                              color: Color(0xFF6A442E),
                              height: 20.h,
                              width: 20.h,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(width: 10.w),
                            Container(
                              height: 20.h,
                              child: VerticalDivider(
                                width: 1.5.w,
                                thickness: 1.5.h,
                                color: Color(0xFF6A442E),
                              ),
                            ),
                            SizedBox(width: 10.w),
                          ],
                        ),
                      ),
                      suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                          child: !_isPasswordVisible
                              ? Image.asset(
                                  'assets/images/ic_hide_password.png')
                              : Image.asset(
                                  'assets/images/ic_show_password.png')),
                      hintText: 'Password',
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: const Color(0xFF1C0E07),
                              ),
                    ),
                  ),
                  25.verticalSpace,
                  Text(
                    'Forgot Password?',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Color(0xFF461C10),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFF461C10),
                        ),
                  ),
                  107.verticalSpace,
                  Align(
                    alignment: Alignment.bottomRight,
                    child: PrimaryButton(
                      isIconButton: true,
                      isLoading: ref.watch(authNotifierProvider).isLoading,
                      onClick: () => _onLoginPressed(),
                    ),
                  ),

                  // Align(
                  //   alignment: Alignment.bottomRight,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       // context.navigateTo(CafeSteps());

                  //     },
                  //     child: Image.asset(
                  //       'assets/images/arrow-left1.png',
                  //       height: 24.h,
                  //       width: 24.h,
                  //     ),
                  //   ),
                  // ),
                  47.verticalSpace,
                  Center(
                    child: InkWell(
                      onTap: () {
                        context.navigateTo(CafeSteps());
                      },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Don’t have an account?',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Color(0xFF4E403B),
                                  ),
                            ),
                            TextSpan(text: ' '),
                            TextSpan(
                              text: 'Sign Up ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Color(0xFF461C10),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFF461C10),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
