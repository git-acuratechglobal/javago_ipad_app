import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:java_go/sign_up/loyalitycard.dart';
import 'package:java_go/sign_up/menu.dart';
import 'package:java_go/sign_up/publishscreen.dart';
import 'package:java_go/sign_up/reviewscreen.dart';
import 'package:java_go/sign_up/sign_up_page.dart';
import 'package:java_go/sign_up/sign_up_screen.dart';

class CafeSteps extends StatefulWidget {
  const CafeSteps({super.key});

  @override
  State<CafeSteps> createState() => _CafeStepsState();
}

class _CafeStepsState extends State<CafeSteps> {
  final PageController cafeStepPageController = PageController();
  int currentPageIndex = 0;

  late List<Widget> cafesteps = [
    SignUpScreen(),
    SignUpPage(isEditmode: false,),
   SelectManually(),
    LoyalityCardScreen(isEditMode: false),
    Reviewscreen(),
    Publishscreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: cafeStepPageController,
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
      floatingActionButton: currentPageIndex < cafesteps.length - 1
          ? Padding(
              padding: const EdgeInsets.only(top: 70, right: 40),
              child: FloatingActionButton(
                backgroundColor: const Color(0xFFC0987C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {
                  if (currentPageIndex < cafesteps.length - 1) {
                    cafeStepPageController.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: const Icon(Icons.arrow_forward),
              ),
            )
          : null,
      bottomNavigationBar: BottomAppBar(
        height: 150.h,
        color: const Color(0xFFF5F3F0),
        child: StepperWidget(
          activeStep: currentPageIndex,
          onStepTapped: (int tappedIndex) {
            if (tappedIndex < currentPageIndex) {
              cafeStepPageController.animateToPage(
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
