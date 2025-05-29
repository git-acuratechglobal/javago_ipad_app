import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/config/common/widgets.dart';
import '../auth/notifier/stamp_notifier/get_stamp_notifier.dart';
import '../auth/pages/sign_up/loyalitycard.dart';
import '../auth/pages/sign_up/reviewscreen.dart';
import '../auth/pages/steps/stepper_widget.dart';
import '../config/async_widget.dart';
import '../config/common/button.dart';
import '../config/common/extensions.dart';

class LoyalityCardScreen2 extends ConsumerWidget {
  final bool? isOpenFromSignup;
  const LoyalityCardScreen2({super.key, this.isOpenFromSignup = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: (isOpenFromSignup == true)
            ? AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Loyality stamp",
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: Color(0xFF461C10), fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        )
            : null,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 58, vertical: 36),
          child: Column(
            children: [
              isOpenFromSignup ?? true
                  ? Column(
                children: [
                  15.verticalSpace,
                  Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          context.navigateTo(LoyalityCardScreen(
                            isEditMode: true,
                          ));
                        },
                        child: EditContainer(
                          title: 'Add Stamp',
                          icon: (Icons.add_circle_outline),
                        ),
                      )),
                ],
              )
                  : Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      context.navigateTo(LoyalityCardScreen(
                        isEditMode: true,
                      ));
                    },
                    child: EditContainer(
                      title: 'Edit Stamp',
                      icon: (Icons.add_circle_outline),
                    ),
                  )),
              38.verticalSpace,
              LoyalityCard(isOpenFromSignup: isOpenFromSignup),
            ],
          ),
        ),
        floatingActionButton: isOpenFromSignup == true
            ? Padding(
          padding: const EdgeInsets.only(top: 70, right: 40),
          child: SizedBox(
            width: 55,
            height: 53,
            child: PrimaryButton(
              backgroundColor: const Color(0xFFC0987C),
              onClick: () {
                final controller = ref.read(cafePageControllerProvider);
                if (controller.hasClients) {
                  controller.nextPage(
                    duration: Duration(milliseconds: 250),
                    curve: Curves.bounceIn,
                  );
                }
              },
              isIconButton: true,
            ),
          ),
        )
            : null);
  }
}


class LoyalityCard extends ConsumerWidget {
  final bool? isOpenFromSignup;
  const LoyalityCard({super.key, this.isOpenFromSignup});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getStamp = ref.watch(getStampProvider);
    // if (widget.isOpenFromSignup == false) {
    return AsyncWidget(
        onRetry: () {
          ref.invalidate(getStampProvider);
        },
        value: getStamp,
        data: (data) {
          final item = data.loyaltyStamp;
          return Container(
            decoration: BoxDecoration(
              color: Colors.white12,
              border: Border.all(
                color: Colors.black12,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.only(left: 52),
                    width: 1276.w,
                    height: 59.h,
                    decoration: BoxDecoration(color: Color(0xFF9B6842)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 255.w,
                          child: ReviewItembarname(
                            label: 'Loyalty Stamp Color',
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(
                          width: 255.w,
                          child: ReviewItembarname(
                            label: '%  or £ off  of next order',
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(
                          width: 255.w,
                          child: ReviewItembarname(
                            label: 'Minimum Order Value',
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(
                          width: 255.w,
                          child: ReviewItembarname(
                            label: 'No of Total Stamp ',
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                (item == null && isOpenFromSignup == true)
                    ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 22),
                  child: Text("No data available in table"),
                )
                    : Container(
                  padding: EdgeInsets.symmetric(horizontal: 17),
                  width: 1076.w,
                  height: 159,
                  child: Column(
                    children: [
                      19.horizontalSpace,
                      19.verticalSpace,
                      Row(
                        children: [
                          SizedBox(
                              width: 300.w,
                              height: 35,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: item?.stampColor != null
                                    ? Padding(
                                  padding: const EdgeInsets.only(left: 28.0),
                                  child: Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color: HexColor.fromHex(item!.stampColor!),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                )
                                    : Icon(Icons.broken_image, size: 33),
                              )),
                          SizedBox(
                            width: 273.w,
                            child: ReviewItembarname(
                              label: "£ ${item?.discount?.toString() ?? ''}",
                              color: Color(0xFF1B0701),
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            width: 255.w,
                            child: ReviewItembarname(
                              label: item?.minOrderValue?.toString() ?? '',
                              color: Color(0xFF1B0701),
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(
                            width: 199.w,
                            child: ReviewItembarname(
                              label: item?.stampNo?.toString() ?? '',
                              color: Color(0xFF1B0701),
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: const Color(0xFFC0987C),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
    // }
    // else {
    //   return SizedBox.shrink();
    // }
  }
}