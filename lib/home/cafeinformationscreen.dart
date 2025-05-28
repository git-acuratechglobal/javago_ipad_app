import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/config/common/widgets.dart';
import 'package:java_go/home/account.dart';

import '../auth/pages/sign_up/reviewscreen.dart';
import '../auth/pages/sign_up/cafe_info_screen.dart';

class CafeInformationScreen extends ConsumerStatefulWidget {
  final bool fromSettings;
  const CafeInformationScreen({this.fromSettings = false, super.key});

  @override
  ConsumerState<CafeInformationScreen> createState() => _CafeInformationScreenState();
}

class _CafeInformationScreenState extends ConsumerState<CafeInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.fromSettings
          ? PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: AppBarWidget(
                myOrders: false,
                title: 'My Profile',
              ))
          : null,
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 47, vertical: 44),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Emily’s cafe',
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
                            context.navigateTo(CafeInfoScreen(
                              isEditmode: true,
                            ));
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
                      width: 423.w, height: 282.h, child: Image.asset('assets/images/cafe.png')),
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
                        '07 123456789',
                        style: TextStyle(
                          color: const Color(0xFF1B0701),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      72.verticalSpace,
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
                  70.horizontalSpace,
                  Padding(
                    padding: EdgeInsets.only(bottom: 180),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Address',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Color(0xFF694233),
                                )),
                        11.verticalSpace,
                        Text(
                          '21438 Ingomar, 34 Street, Barnet, EN5 2EH.',
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
                  "Cafe bio/ description Lorem Ipsum is simply dummy text of the  printing and typesetting industry. Cafe bio/ description Lorem  Ipsum is simply dummy text of the printing and typesetting  industry. Cafe bio/ description Lorem Ipsum is simply dummy text of the     printing and typesetting industry.  ",
                  style: TextStyle(
                    color: const Color(0xFF727272),
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
              Row(
                children: [
                  SizedBox(
                    height: 300.h,
                    width: 350.w,
                    child: Reviewtiming(),
                  ),
                  Column(
                    children: [
                      Text(
                        'Coffee Origin',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: Color(0xFF694233), fontWeight: FontWeight.w600),
                      ),
                      CustomContainer(
                        label: 'Single Origin',
                        containerWidth: 227.w,
                        containerHeight: 30.h,
                        borderColor: Colors.black,
                      ),
                      88.verticalSpace,
                      Column(children: [
                        Text(
                          'Country of Origin',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: Color(0xFF694233), fontWeight: FontWeight.w600),
                        ),
                        CustomContainer(
                          label: 'Single Origin',
                          containerWidth: 227.w,
                          containerHeight: 30.h,
                          borderColor: Colors.black,
                        ),
                        140.verticalSpace,
                      ])
                    ],
                  ),
                  130.horizontalSpace,
                  Column(
                    children: [
                      Text(
                        'Coffee Roast',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: Color(0xFF694233), fontWeight: FontWeight.w600),
                      ),
                      CustomContainer(
                        label: 'Medium',
                        containerWidth: 227.w,
                        containerHeight: 30.h,
                        borderColor: Colors.black,
                      ),
                      88.verticalSpace,
                      Column(children: [
                        Text(
                          'Specialty Coffee',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: Color(0xFF694233), fontWeight: FontWeight.w600),
                        ),
                        CustomContainer(
                          label: 'Yes',
                          containerWidth: 227.w,
                          containerHeight: 30.h,
                          borderColor: Colors.black,
                        ),
                        140.verticalSpace,
                      ])
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
