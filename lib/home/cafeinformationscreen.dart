import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/auth/notifier/cafe_data_notifier/cafe_data_notifier.dart';
import 'package:java_go/config/async_widget.dart';
import 'package:java_go/config/common/cache_network_image.dart';
import 'package:java_go/config/common/widgets.dart';
import 'package:java_go/home/account.dart';
import 'package:java_go/home/notifier/cafe_info_notifier/cafe_info_notifier.dart';
import '../auth/pages/sign_up/reviewscreen.dart';
import '../auth/pages/sign_up/cafe_info_screen.dart';

class CafeInformationScreen extends ConsumerStatefulWidget {
  final bool fromSettings;
  const CafeInformationScreen({this.fromSettings = false, super.key});

  @override
  ConsumerState<CafeInformationScreen> createState() =>
      _CafeInformationScreenState();
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
        body: AsyncWidget(
            value: ref.watch(getCafeInfoProvider),
            data: (data) {
              return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 47, vertical: 44),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            data?.cafeName ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                    color: Color(0xFF694233),
                                    fontWeight: FontWeight.w600),
                          ),
                          Expanded(
                            child: Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: () {
                                    context.navigateTo(CafeInfoScreen(
                                      isFromSignUp: false,
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
                      20.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 423.w,
                              height: 282.h,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: NetworkImageWidget(
                                      imageUrl: data?.bannerImage ?? ""))),
                          60.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Phone Number',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                        color: Color(0xFF694233),
                                      )),
                              11.verticalSpace,
                              Text(
                                data?.phone ?? "",
                                style: TextStyle(
                                  color: const Color(0xFF1B0701),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              72.verticalSpace,
                              Text('Categories',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                        color: Color(0xFF694233),
                                      )),
                              11.verticalSpace,
                              // Text(
                              //   'Bubble \n Vegan \n Smoothie',
                              //   style: TextStyle(
                              //     color: const Color(0xFF1B0701),
                              //     fontSize: 16.sp,
                              //     fontWeight: FontWeight.w500,
                              //   ),
                              // )

                              SizedBox(
                                height: 200,
                                width: 300,
                                child: AsyncWidget(
                                    value: ref
                                        .watch(getCafeTimeAndCategoryProvider),
                                    data: (categoryData) {
                                      final selectedFilterIds =
                                          data?.cafeFilter?.split(',') ?? [];
                                      final filteredCategories = categoryData
                                          .cafeFilters
                                          ?.where((e) => selectedFilterIds
                                              .contains(e.id.toString()))
                                          .toList();
                                      if (filteredCategories == null &&
                                          filteredCategories!.isEmpty) {
                                        return SizedBox();
                                      }
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final category =
                                              filteredCategories[index];
                                          return Text(
                                            category.name ?? "",
                                            style: TextStyle(
                                              color: const Color(0xFF1B0701),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return 5.verticalSpace;
                                        },
                                        itemCount:
                                            filteredCategories.length ?? 0,
                                      );
                                    }),
                              ),
                            ],
                          ),
                          60.horizontalSpace,
                          Padding(
                            padding: EdgeInsets.only(bottom: 180),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Address',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                          color: Color(0xFF694233),
                                        )),
                                11.verticalSpace,
                                SizedBox(
                                  width: 350,
                                  child: Text(
                                    data?.address ?? "",
                                    style: TextStyle(
                                      color: const Color(0xFF1B0701),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Bio',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Color(0xFF694233),
                                ),
                      ),
                      SizedBox(
                        width: 996,
                        height: 77,
                        child: Text(
                          data?.bio ?? "",
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
                            ?.copyWith(
                                color: Color(0xFF694233),
                                fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 300.h,
                            width: 350.w,
                            child: Reviewtiming(
                              key: UniqueKey(),
                              timings: data?.timing ?? [],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Coffee Origin',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                        color: Color(0xFF694233),
                                        fontWeight: FontWeight.w600),
                              ),
                              5.verticalSpace,
                              CustomContainer(
                                label: data?.cafeManagement?.coffeeOrigin ?? "",
                                containerWidth: 227.w,
                                containerHeight: 50.h,
                                borderColor: Colors.black,
                              ),
                              88.verticalSpace,
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Country of Origin',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                              color: Color(0xFF694233),
                                              fontWeight: FontWeight.w600),
                                    ),
                                    5.verticalSpace,
                                    CustomContainer(
                                      label: data?.cafeManagement
                                              ?.coffeeOriginCountry ??
                                          "",
                                      containerWidth: 227.w,
                                      containerHeight: 50.h,
                                      borderColor: Colors.black,
                                    ),
                                    140.verticalSpace,
                                  ])
                            ],
                          ),
                          130.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Coffee Roast',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                        color: Color(0xFF694233),
                                        fontWeight: FontWeight.w600),
                              ),
                              5.verticalSpace,
                              CustomContainer(
                                label: data?.cafeManagement?.coffeeRoast ?? "",
                                containerWidth: 227.w,
                                containerHeight: 50.h,
                                borderColor: Colors.black,
                              ),
                              88.verticalSpace,
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Specialty Coffee',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                              color: Color(0xFF694233),
                                              fontWeight: FontWeight.w600),
                                    ),
                                    5.verticalSpace,
                                    CustomContainer(
                                      label: data?.cafeManagement
                                                  ?.speciallityCoffee ==
                                              1
                                          ? "Yes"
                                          : "No",
                                      containerWidth: 227.w,
                                      containerHeight: 50.h,
                                      borderColor: Colors.black,
                                    ),
                                    140.verticalSpace,
                                  ])
                            ],
                          )
                        ],
                      ),
                    ],
                  ));
            }));
  }
}
