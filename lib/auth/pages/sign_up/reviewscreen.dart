import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/auth/notifier/cafe_data_notifier/cafe_data_notifier.dart';
import 'package:java_go/config/common/cache_network_image.dart';
import 'package:java_go/config/common/widgets.dart';
import 'package:java_go/home/loyalitycardscreen.dart';

import '../../../config/async_widget.dart';
import '../../../config/common/button.dart';
import '../steps/stepper_widget.dart';

class Reviewscreen extends ConsumerWidget {
  final bool? isOpenFromSignup;
  final bool? isOpenFromSignupEdit;

  const Reviewscreen({
    super.key,
    this.isOpenFromSignup = false,
    this.isOpenFromSignupEdit = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getProfile = ref.watch(getCafeInfoProvider);

    return Scaffold(
        backgroundColor: const Color(0xFFF5F3F0),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5F3F0),
          automaticallyImplyLeading: false,
          title: Text(
            'REVIEW',
            style: TextStyle(
              color: const Color(0xFF461C10),
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 26),
          child: AsyncWidget(
              value: getProfile,
              data: (data) {
                final profile = data;

                return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'EMAIL ID: ${profile!.email ?? ''}',
                    style: TextStyle(
                      color: const Color(0xFF461C10),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  25.verticalSpace,
                  // Text(
                  //   'PASSWORD: XXXXXXX',
                  //   style: TextStyle(
                  //     color: const Color(0xFF461C10),
                  //     fontSize: 16.sp,
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  // ),
                  12.verticalSpace,
                  Divider(
                    thickness: 1,
                    color: Color(0xFFA0A0A0),
                  ),
                  25.verticalSpace,
                  Row(
                    children: [
                      Text(
                        profile.cafeName ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(color: Color(0xFF694233), fontWeight: FontWeight.w600),
                      ),
                      Expanded(
                        child: Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                  ref.read(returnToReviewProvider.notifier).update((ref)=>true);
                                final controller = ref.read(cafePageControllerProvider);
                                if (controller.hasClients) {
                                  controller.jumpToPage(1);
                                }
                              },
                              child: EditContainer(
                                title: 'Edit Profile',
                                icon: (Icons.add_circle_outline),
                              ),
                            )),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 423.w,
                        height: 282.h,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: NetworkImageWidget(imageUrl: profile.bannerImage!))
                      ),
                      60.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Phone Number',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Color(0xFF694233),
                              )),
                          11.verticalSpace,
                          Text(
                            profile.phone ?? '',
                            style: TextStyle(
                              color: const Color(0xFF1B0701),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          30.verticalSpace,
                          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text('Categories',
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Color(0xFF694233),
                                )),
                            11.verticalSpace,
                            Text(
                              'Bubble \n Vegan \n Smoothie',
                              style: TextStyle(
                                color: const Color(0xFF1B0701),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ])
                        ],
                      ),
                      124.horizontalSpace,
                      Padding(
                        padding: EdgeInsets.only(bottom: 150),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Address',
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Color(0xFF694233),
                                )),
                            11.verticalSpace,
                            Text(
                              profile.address ?? '',
                              style: TextStyle(
                                color: const Color(0xFF1B0701),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  67.verticalSpace,
                  Text(
                    'Bio',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Color(0xFF694233),
                    ),
                  ),
                  SizedBox(
                    width: 996,
                    height: 77,
                    child: Text(
                      profile.bio ?? '',
                      style: TextStyle(
                        color: const Color(0xFF1B0701),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  17.verticalSpace,
                  Text(
                    'Cafe Hours',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Color(0xFF694233), fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 300.h,
                    width: 350.w,
                    child: Reviewtiming(timings: profile.timing??[],),
                  ),
                  Divider(
                    thickness: 1,
                    color: Color(0xFFA0A0A0),
                  ),
                  25.verticalSpace,
                  Row(
                    children: [
                      Text(
                        'Click and Collect: ',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      40.horizontalSpace,
                      Text(
                        profile.cafeManagement?.clickAndCollect == 1 ? 'Yes' : 'No',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              ref.read(returnToReviewProvider.notifier).update((ref)=>true);
                              final controller = ref.read(cafePageControllerProvider);
                              if (controller.hasClients) {
                                controller.jumpToPage(2);
                              }
                            },
                            child: EditContainer(
                              title: 'Edit ',
                              icon: Icons.add_circle_outline,
                              onTap: () {
                                final controller = ref.read(cafePageControllerProvider);
                                controller.jumpToPage(1);
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  30.verticalSpace,
                  Row(
                    children: [
                      Text(
                        'Maximum orders: ',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      40.horizontalSpace,
                      Text(
                        profile.cafeManagement!.maxOrdersClickCollect?.toString() ?? '0',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  24.verticalSpace,
                  Divider(
                    thickness: 1,
                    color: Color(0xFFA0A0A0),
                  ),
                  35.verticalSpace,
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        ref.read(returnToReviewProvider.notifier).update((ref)=>true);
                        final controller = ref.read(cafePageControllerProvider);
                        if (controller.hasClients) {
                          controller.jumpToPage(3);
                        }
                      },
                      child: EditContainer(
                        title: 'Edit ',
                        icon: Icons.add_circle_outline,
                        onTap: () {
                          final controller = ref.read(cafePageControllerProvider);
                          controller.jumpToPage(1);
                        },
                      ),
                    ),
                  ),

                  ///cafe Menu Items review
                  ReviewItems(

                  ),

                  // PageIndex(),
                  Divider(
                    thickness: 1,
                    color: Color(0xFFA0A0A0),
                  ),
                  29.verticalSpace,
                  Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          ref.read(returnToReviewProvider.notifier).update((ref)=>true);
                          final controller = ref.read(cafePageControllerProvider);
                          if (controller.hasClients) {
                            controller.jumpToPage(4);
                          }
                        },
                        child: EditContainer(
                          title: 'Edit Stamp',
                          icon: (Icons.add_circle_outline),
                        ),
                      )),
                  38.verticalSpace,
                  LoyalityCard(
                    isOpenFromSignup: true,
                  )
                ]);
              }),
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

class EditContainer extends StatefulWidget {
  final String title;
  final VoidCallback? onTap;
  final IconData? icon;
  const EditContainer({
    super.key,
    required this.title,
    this.icon,
    this.onTap,
  });

  @override
  State<EditContainer> createState() => _EditContainerState();
}

class _EditContainerState extends State<EditContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 178.w,
      height: 50.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color(0xFF9B6842),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.icon != null) ...[
            Icon(
              widget.icon,
              color: Colors.white,
            ),
            SizedBox(width: 10),
          ],
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
