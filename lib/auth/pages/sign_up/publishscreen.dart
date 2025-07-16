import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/auth/notifier/auth_notifier.dart';
import 'package:java_go/auth/notifier/cafe_data_notifier/cafe_data_notifier.dart';
import 'package:java_go/config/async_widget.dart';
import 'package:java_go/config/common/button.dart';
import 'package:java_go/home/bottombar.dart';

import '../../../config/common/api_end_points.dart';
import '../../../home/notifier/cafe_info_notifier/cafe_info_notifier.dart';
import '../../../home/terms_and_conditions.dart';
import '../steps/stepper_widget.dart';
import 'connect_strip_web_view.dart';

class Publishscreen extends ConsumerStatefulWidget {
  const Publishscreen({super.key});

  @override
  ConsumerState<Publishscreen> createState() => _PublishscreenState();
}

class _PublishscreenState extends ConsumerState<Publishscreen> {
  bool istapped = false;
  bool isAccountReviewed = false;
  bool isTermsAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F3F0),
        appBar: AppBar(
            title: Text(
              "Publish",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: const Color(0xFF461C10), fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.transparent),
        body: AsyncWidget(
            value: ref.watch(getCafeInfoProvider),
            data: (data) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // if (data?.stripeOnboardingCompleted == 1) 117.verticalSpace,
                    // if (data?.stripeOnboardingCompleted == 0)
                    //   Center(
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: [
                    //         Text(
                    //           'Payment Information',
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .headlineLarge
                    //               ?.copyWith(
                    //                   color: Color(0xFF461C10),
                    //                   fontWeight: FontWeight.w600),
                    //         ),
                    //         SizedBox(
                    //           height: MediaQuery.sizeOf(context).height / 15,
                    //         ),
                    //         Text(
                    //           "Please click below to securely add your payment details. You won’t be charged right away.",
                    //           style: TextStyle(fontSize: 16),
                    //         ),
                    //         SizedBox(height: 16),
                    //         Text(
                    //           "Your free trial and monthly subscription rate will depend on your position as one of our early cafe partners:",
                    //           style: TextStyle(fontSize: 16),
                    //         ),
                    //         SizedBox(height: 12),
                    //         Padding(
                    //           padding: const EdgeInsets.only(left: 200),
                    //           child: _buildBulletPoint(
                    //             "Cafes 1–14: Enjoy your first year free, then £12.99/month",
                    //           ),
                    //         ),
                    //         SizedBox(height: 8),
                    //         Padding(
                    //           padding: const EdgeInsets.only(left: 200),
                    //           child: _buildBulletPoint(
                    //             "Cafes 15–25: Get your first month free, then £20/month (save £96/year)",
                    //           ),
                    //         ),
                    //         SizedBox(height: 8),
                    //         Padding(
                    //           padding: const EdgeInsets.only(left: 200),
                    //           child: _buildBulletPoint(
                    //             "Cafes 26+: £28/month, or £23/month when billed annually",
                    //           ),
                    //         ),
                    //         SizedBox(height: 30),
                    //         Text(
                    //           "We’ll confirm your pricing tier via email after sign-up. You can cancel any time before your free trial ends to avoid being charged.",
                    //           style: TextStyle(fontSize: 16),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // if (data?.stripeOnboardingCompleted == 1)
                    //   SizedBox(
                    //     height: MediaQuery.sizeOf(context).height / 8,
                    //   ),
                    // if (data?.stripeOnboardingCompleted == 0)
                    //   SizedBox(
                    //     height: MediaQuery.sizeOf(context).height / 5,
                    //   ),
                    // if (data?.stripeOnboardingCompleted == 1) ...[
                    Padding(
                      padding: const EdgeInsets.only(left: 281),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                activeColor: Colors.black,
                                value: isAccountReviewed,
                                onChanged: (value) {
                                  setState(() => isAccountReviewed = value!);
                                },
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    text:
                                        'I have reviewed my account and can confirm the information I have provided is correct',
                                    style: TextStyle(
                                        color: Colors.brown, fontSize: 13.sp),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                activeColor: Colors.black,
                                value: isTermsAgreed,
                                onChanged: (value) {
                                  setState(() => isTermsAgreed = value!);
                                },
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.brown, fontSize: 13.sp),
                                    children: [
                                      TextSpan(
                                          style: TextStyle(
                                              color: Colors.brown,
                                              fontSize: 13.sp),
                                          text:
                                              'I have read and agree to the '),
                                      TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            context.navigateTo(
                                                TermsAndConditionsPage());
                                          },
                                        text: 'Terms of Service',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // ],
                    // if (data?.stripeOnboardingCompleted == 1)
                    //   SizedBox(
                    //     height: MediaQuery.sizeOf(context).height / 18,
                    //   ),
                    50.verticalSpace,
                    if (data?.stripeOnboardingCompleted == 1)
                      SizedBox(
                        width: 300,
                        child: PrimaryButton(
                            title: "Publish",
                            isLoading:
                                ref.watch(cafeInfoNotifierProvider).isLoading,
                            onClick: () {
                              if (isAccountReviewed && isTermsAgreed) {
                                ref
                                    .read(cafeInfoNotifierProvider.notifier)
                                    .publishCafe();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Please confirm your account details and agree to the Terms of Service.'),
                                    backgroundColor: Colors.redAccent,
                                  ),
                                );
                              }
                            }),
                      ),

                    // if (!istapped)
                    //   InkWell(
                    //     onTap: () {
                    //       final controller = ref.read(cafePageControllerProvider);
                    //       if (controller.hasClients) {
                    //         controller.jumpToPage(5);
                    //       }
                    //     },
                    //     child: Text(
                    //       'Back',
                    //       style: TextStyle(
                    //         fontSize: 20.sp,
                    //         fontWeight: FontWeight.w600,
                    //         color: const Color(0xFF4C2F27),
                    //       ),
                    //     ),
                    //   ),
                  ],
                ),
              );
            }));
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("• ", style: TextStyle(fontSize: 16)),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
