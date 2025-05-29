import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/auth/notifier/auth_notifier.dart';
import 'package:java_go/config/common/button.dart';
import 'package:java_go/home/bottombar.dart';

import '../steps/stepper_widget.dart';

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
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF5F3F0),
      ),
      body: Column(
        children: [
          if (istapped)
            Center(
              child: Text(
                'Stripe',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: const Color(0xFF461C10), fontWeight: FontWeight.bold),
              ),
            ),
          if (istapped) 117.verticalSpace,
          if (!istapped)
            Center(
              child: Column(
                children: [
                  Text(
                    'Payment Information',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: Color(0xFF461C10), fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 15,
                  ),
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.6,
                      child: Text(
                          'Please click below to add your payment details. You will not be charged until after the 8-month free trial. After which, your subscription will automatically continue at £12.99 per month. You can cancel anytime before the trial ends to avoid being charged')),
                ],
              ),
            ),
          if (istapped)
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 8,
            ),
          if (!istapped)
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 5,
            ),
          if (istapped) ...[
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
                        child: Text(
                          'I have reviewed my account and can confirm the information I have provided is correct',
                          style: TextStyle(color: Colors.brown, fontSize: 14.sp),
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
                            style: TextStyle(color: Colors.brown, fontSize: 14.sp),
                            children: const [
                              TextSpan(text: 'I have read and agree to the '),
                              TextSpan(
                                text: 'Terms of Service',
                                style: TextStyle(fontWeight: FontWeight.bold),
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
          ],
          if (istapped)
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 18,
            ),
          if (istapped)
            SizedBox(
                width: 300,
                child: PrimaryButton(
                  title: "Publish",
                    isLoading: ref.watch(authNotifierProvider).isLoading,
                    onClick: (){
                      if (isAccountReviewed && isTermsAgreed) {
                        ref.read(authNotifierProvider.notifier).publishCafe();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Please confirm your account details and agree to the Terms of Service.'),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                      }
                    }),),
          45.verticalSpace,
          if (!istapped)
            SizedBox(
              width: 244,
              height: 51,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC0987C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(38),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    istapped = true;
                  });
                },
                child: const Text('Connect to Stripe'),
              ),
            ),
          45.verticalSpace,
          if (!istapped)
            InkWell(
              onTap: () {
                final controller = ref.read(cafePageControllerProvider);
                if (controller.hasClients) {
                  controller.jumpToPage(5);
                }
              },
              child: Text(
                'Back',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF4C2F27),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
