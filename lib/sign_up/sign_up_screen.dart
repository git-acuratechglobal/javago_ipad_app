import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3F0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'SIGN UP',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            125.verticalSpace,
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('EMAIL ID'),
                  12.verticalSpace,
                  SizedBox(
                    width: 310.w,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 12),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFC0987C),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFC0987C),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/images/email.png',
                                color: const Color(0xFF6A442E),
                                height: 20,
                                width: 20,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(width: 10),
                              Container(
                                height: 20,
                                child: const VerticalDivider(
                                  width: 1.5,
                                  thickness: 1.5,
                                  color: Color(0xFF6A442E),
                                ),
                              ),
                            ],
                          ),
                        ),
                        hintText: 'Enter your email',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: const Color(0xFF1C0E07)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            37.verticalSpace,
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('PASSWORD'),
                  12.verticalSpace,
                  SizedBox(
                    width: 310.w,
                    child: TextFormField(
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 12),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFC0987C),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFC0987C),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/images/frame1.png',
                                color: Color(0xFF6A442E),
                                height: 20,
                                width: 20,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(width: 10),
                              Container(
                                height: 20,
                                child: VerticalDivider(
                                  width: 1.5,
                                  thickness: 1.5,
                                  color: Color(0xFF6A442E),
                                ),
                              ),
                            ],
                          ),
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                          child: _isPasswordVisible
                              ? Image.asset(
                                  'assets/images/ic_hide_password.png')
                              : Image.asset(
                                  'assets/images/ic_show_password.png'),
                        ),
                        hintText: 'Enter Password',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Color(0xFF1C0E07)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            37.verticalSpace,
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('CONIFRM PASSWORD'),
                  12.verticalSpace,
                  SizedBox(
                    width: 310.w,
                    child: TextFormField(
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFC0987C),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFC0987C),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/images/frame1.png',
                                color: Color(0xFF6A442E),
                                height: 20,
                                width: 20,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(width: 10),
                              Container(
                                height: 20,
                                child: VerticalDivider(
                                  width: 1.5,
                                  thickness: 1.5,
                                  color: Color(0xFF6A442E),
                                ),
                              ),
                            ],
                          ),
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                          child: _isPasswordVisible
                              ? Image.asset(
                                  'assets/images/ic_hide_password.png')
                              : Image.asset(
                                  'assets/images/ic_show_password.png'),
                        ),
                        hintText: 'Confirm Password',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Color(0xFF1C0E07)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(right: 75),
            //   child: Align(
            //     alignment: Alignment.bottomRight,
            //     child: ElevatedButton(
            //       onPressed: () {
            //         context.navigateTo(SignUpPage());
            //       },
            //       child: Image.asset(
            //         'assets/images/arrow-left1.png',
            //         height: 24.h,
            //         width: 24.h,
            //       ),
            //     ),
            //   ),
            // ),
            // 120.verticalSpace,
          ],
        ),
      ),
    );
  }
}
