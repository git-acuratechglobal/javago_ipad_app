import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/config/common/extensions.dart';
import 'package:java_go/home/notifier/cafe_info_notifier/cafe_info_notifier.dart';
import 'package:java_go/home/state/cafe_info_state/cafe_info_state.dart';
import '../../../config/common/widgets.dart';
import '../../../home/loyalitycardscreen.dart';
import '../sign_up/click_and_collect.dart';
import '../sign_up/connect_strip_web_view.dart';
import '../sign_up/menu.dart';
import '../sign_up/publishscreen.dart';
import '../sign_up/reviewscreen.dart';
import '../sign_up/cafe_info_screen.dart';
import '../sign_up/sign_up_screen.dart';
import '../sign_up/stripe_account_setup.dart';
import '../sign_up/submission_thankyou_screen.dart';

final returnToReviewProvider = StateProvider<bool>((ref) => false);
final cafePageControllerProvider = Provider<PageController>((ref) {
  final controller = PageController(initialPage: 0);

  ref.onDispose(() {
    controller.dispose();
  });
  return controller;
});

class CafeSteps extends ConsumerStatefulWidget {
  const CafeSteps({super.key});

  @override
  ConsumerState<CafeSteps> createState() => _CafeStepsState();
}

class _CafeStepsState extends ConsumerState<CafeSteps> {
  int currentPageIndex = 0;

  late List<Widget> cafesteps = [
    SignUpScreen(),
    CafeInfoScreen(
      isFromSignUp: true,
    ),
    ClickAndCollect(isFromSignup: true),
    SelectManually(
        // isFromSignUp: true,
        ),
    LoyalityCardScreen2(
      isOpenFromSignup: true,
    ),
    Reviewscreen(
      isOpenFromSignup: true,
    ),
    StripeAccountSetup(),
    Publishscreen(),
  ];

  @override
  void initState() {
    super.initState();
    ref.listenManual(cafeInfoNotifierProvider, (previous, next) async {
      switch (next) {
        case AsyncData<CafeInfoState?> data when data.value != null:
          final cafeState = data.value;
          final controller = ref.read(cafePageControllerProvider);
          if (cafeState?.cafeEvent == CafeEvent.downloadSampleFile) {
            final url = cafeState?.response;
            if (url != null) {
              ref.read(cafeInfoNotifierProvider.notifier).launch(url);
            }
          }
          if (cafeState?.cafeEvent == CafeEvent.addCafeInfo) {
            // if (shouldReturnToReview) {
            //   ref.read(returnToReviewProvider.notifier).state = false;
            //   controller.animateToPage(
            //     5,
            //     duration: const Duration(milliseconds: 300),
            //     curve: Curves.easeInOut,
            //   );
            // } else {
            if (controller.hasClients) {
              controller.nextPage(
                duration: Duration(milliseconds: 250),
                curve: Curves.bounceIn,
              );
            }

            return;
            // }
          }
          if (cafeState?.cafeEvent == CafeEvent.updateClickAndCollect) {
            if (controller.hasClients) {
              controller.nextPage(
                duration: Duration(milliseconds: 250),
                curve: Curves.bounceIn,
              );
            }

            return;
          }
          if (cafeState?.cafeEvent == CafeEvent.createStripAccount) {
            final url = cafeState?.response;
            context.navigateTo(CustomWebView(
              title: "Connect your Stripe Account",
              initialUrl: url,
            ));
            return;
          }
          if (cafeState?.cafeEvent == CafeEvent.stripAccountStatus) {
            context.pop();
            return;
          }

          if (cafeState?.cafeEvent == CafeEvent.publishCafe) {
            context.navigateAndRemoveUntil(SubmissionThankYouScreen());
            return;
          }

        case AsyncError error:
          context.showSnackBar(error.error.toString(), barColor: Colors.red);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageController = ref.watch(cafePageControllerProvider);
    return Scaffold(
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        itemCount: cafesteps.length,
        itemBuilder: (BuildContext context, int index) {
          return cafesteps[index];
        },
      ),
      bottomNavigationBar: BottomAppBar(
        height: 150.h,
        color: const Color(0xFFF5F3F0),
        child: StepperWidget(
          activeStep: currentPageIndex,
          onStepTapped: (int tappedIndex) {
            if (tappedIndex == 0) {
              return;
            }
            if (tappedIndex < currentPageIndex) {
              pageController.animateToPage(
                tappedIndex,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
        ),
      ),
    );
  }
}

class StepperWidget extends StatefulWidget {
  final int activeStep;
  final Function(int)? onStepTapped;

  const StepperWidget({
    super.key,
    required this.activeStep,
    this.onStepTapped,
  });

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  @override
  Widget build(BuildContext context) {
    List<({int index, String name})> stepTitles = [
      (index: 1, name: 'Account'),
      (index: 2, name: 'Cafe'),
      (index: 3, name: 'Click and collect'),
      (index: 4, name: 'Menu'),
      (index: 5, name: 'Loyalty card'),
      (index: 6, name: 'Review'),
      (index: 7, name: 'Stripe'),
      (index: 8, name: 'Publish')
    ];

    return EasyStepper(
      disableScroll: true,
      activeStep: widget.activeStep,
      onStepReached: (index) {
        if (widget.onStepTapped != null) {
          widget.onStepTapped!(index);
        }
      },
      activeStepBackgroundColor: const Color(0xFFF5F3F0),
      unreachedStepBackgroundColor: const Color(0xFFD9D9D9),
      finishedStepBackgroundColor: const Color(0xFFD9D9D9),
      finishedStepTextColor: const Color(0xFF464646),
      activeStepTextColor: const Color(0xFF464646),
      activeStepBorderColor: const Color(0xFF6A442E),
      unreachedStepBorderColor: Colors.transparent,
      unreachedStepTextColor: const Color(0xFF464646),
      activeStepBorderType: BorderType.normal,
      unreachedStepBorderType: BorderType.normal,
      internalPadding: 10,
      borderThickness: 6,
      stepRadius: 30,
      showLoadingAnimation: false,
      lineStyle: LineStyle(
        lineLength: 50,
        lineType: LineType.dashed,
        lineThickness: 2,
        lineSpace: 3,
        unreachedLineType: LineType.dashed,
        defaultLineColor: const Color(0xFF6A442E),
      ),
      steps: List.generate(
        stepTitles.length,
        (index) => EasyStep(
          customStep: Text(
            stepTitles[index].index.toString(),
            style: TextStyle(
              color: const Color(0xFF6A442E),
              fontWeight: FontWeight.w500,
              fontSize: 24.sp,
            ),
          ),
          title: stepTitles[index].name,
        ),
      ),
    );
  }
}

// class SignUpSteps extends StatefulWidget {
//   const SignUpSteps({super.key});

//   @override
//   State<SignUpSteps> createState() => _SignUpStepsState();
// }

// class _SignUpStepsState extends State<SignUpSteps> {
//   bool isSelected = false;
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 2,
//         child: Container(
//           //  width: 327,
//           height: 40.h,
//           decoration: ShapeDecoration(
//             color: const Color(0xFFEBF3F5),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           child: TabBar(
//             indicatorColor: Colors.transparent,
//             tabs: [
//               Tab(
//                   child: Container(
//                 width: 160,
//                 height: 32,
//                 decoration: ShapeDecoration(
//                   color: const Color(0xFF164C63),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8)),
//                 ),
//                 child: Center(
//                     child: Text(
//                   'Address',
//                   style: Theme.of(context)
//                       .textTheme
//                       .bodySmall
//                       ?.copyWith(color: Colors.white),
//                 )),
//               )),
//               Tab(
//                 child: Container(
//                   width: 160,
//                   height: 32,
//                   decoration: ShapeDecoration(
//                     color: const Color(0xFF164C63),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8)),
//                   ),
//                   child:  Center(
//                     child: Text(
//                   'Attributes',
//                   style: Theme.of(context)
//                       .textTheme
//                       .bodyLarge
//                       ?.copyWith(color: Colors.white),
//                 )),
//                 ),
//               )
//             ],
//             dividerColor: Colors.transparent,
//           ),
//         ));
//   }
// }
