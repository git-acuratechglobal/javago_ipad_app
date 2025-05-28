import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../sign_up/click_and_collect.dart';
import '../sign_up/loyalitycard.dart';
import '../sign_up/menu.dart';
import '../sign_up/publishscreen.dart';
import '../sign_up/reviewscreen.dart';
import '../sign_up/cafe_info_screen.dart';
import '../sign_up/sign_up_screen.dart';

final cafePageControllerProvider = Provider<PageController>((ref) {
  final controller = PageController(initialPage: 1);

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
    CafeInfoScreen(isEditmode: false,),
    ClickAndCollect(isFromSignup: true),
   SelectManually(),
    LoyalityCardScreen(isEditMode: false),
    Reviewscreen(),
    Publishscreen()
  ];

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
      (index: 3, name: 'Menu'),
      (index: 4, name: 'Loyalty card'),
      (index: 5, name: 'Review'),
      (index: 6, name: 'Publish')
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
