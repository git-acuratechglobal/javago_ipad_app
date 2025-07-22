import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/config/async_widget.dart';
import 'package:java_go/home/bottombar.dart';
import 'package:java_go/home/cafeinformationscreen.dart';
import 'package:java_go/home/changepassword.dart';
import 'package:java_go/home/notifier/cafe_info_notifier/cafe_info_notifier.dart';
import 'package:java_go/home/notifiers/view_order_provider.dart';
import 'package:java_go/home/terms_and_conditions.dart';
import 'package:java_go/service/local_storage_service.dart';
import '../auth/notifier/cafe_data_notifier/cafe_data_notifier.dart';
import '../auth/pages/login/login_screen.dart';
import '../auth/pages/sign_up/connect_strip_web_view.dart';
import '../config/common/api_end_points.dart';
import '../config/widgets/page_loading_widget.dart';
import '../service/firebase_service.dart';

class Account extends ConsumerStatefulWidget {
  const Account({super.key});

  @override
  ConsumerState<Account> createState() => _AccountState();
}

class _AccountState extends ConsumerState<Account> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(cafeInfoNotifierProvider);
    final cafeInfo = ref.watch(getCafeInfoProvider);
    return Stack(
      children: [
        Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xFFF5F3F0),
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: AppBarWidget(
                  showBackButton: false,
                  title: 'Account',
                )),
            body: AsyncWidget(
                value: cafeInfo,
                data: (data) {
                  return SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 117),
                    child: Column(
                      children: [
                        50.verticalSpace,
                        _AccountWidget(
                            onTap: () {
                              context.navigateTo(CafeInformationScreen(
                                fromSettings: true,
                              ));
                            },
                            imagePath: 'assets/images/ic_user.png',
                            title: 'My Profile'),
                        24.verticalSpace,
                        Divider(
                          thickness: 1,
                          color: Color(0x33461C10),
                        ),
                        24.verticalSpace,
                        _AccountWidget(
                            onTap: () {
                              context.navigateTo(ChangePassword());
                            },
                            imagePath: 'assets/images/ic_lock.png',
                            title: 'Change password'),
                        24.verticalSpace,
                        Divider(
                          thickness: 1,
                          color: Color(0x33461C10),
                        ),
                        24.verticalSpace,
                        _AccountWidget(
                            onTap:
                            // data?.squareOnboardingCompleted == 0
                            //     ?
                                () {
                                    ref
                                        .read(cafeInfoNotifierProvider.notifier)
                                        .createSquareAccount();
                                  },
                                // : null,
                            imagePath: 'assets/images/logoutcurve.png',
                            title: data?.squareOnboardingCompleted == 0
                                ? 'Connect Square'
                                : 'Square Connected'),
                        24.verticalSpace,
                        Divider(
                          thickness: 1,
                          color: Color(0x33461C10),
                        ),
                        24.verticalSpace,
                        _AccountWidget(
                            onTap: () {
                              ref
                                  .read(cafeInfoNotifierProvider.notifier)
                                  .syncMenuFromSquare();
                            },
                            imagePath: 'assets/images/logoutcurve.png',
                            title: 'Sync from square'),
                        24.verticalSpace,
                        Divider(
                          thickness: 1,
                          color: Color(0x33461C10),
                        ),
                        24.verticalSpace,
                        _AccountWidget(
                            onTap: () {
                              context.navigateTo(TermsAndConditionsPage());
                            },
                            imagePath: 'assets/images/ic_account_frame.png',
                            title: 'Terms and Conditions'),
                        24.verticalSpace,
                        Divider(
                          thickness: 1,
                          color: Color(0x33461C10),
                        ),
                        24.verticalSpace,
                        _AccountWidget(
                            onTap: () {
                              ref
                                  .read(cafeInfoNotifierProvider.notifier)
                                  .syncMenuToSquare();
                            },
                            imagePath: 'assets/images/ic_account_frame.png',
                            title: 'Sync Menu to Square'),
                        24.verticalSpace,
                        Divider(
                          thickness: 1,
                          color: Color(0x33461C10),
                        ),
                        24.verticalSpace,
                        _AccountWidget(
                            onTap: () {
                              context.navigateTo(CustomWebView(
                                title: "Privacy Policy",
                                initialUrl: "${Api.baseUrl}/privacy-policy",
                              ));
                            },
                            imagePath: 'assets/images/ic_shield.png',
                            title: 'Privacy Policy'),
                        24.verticalSpace,
                        Divider(
                          thickness: 1,
                          color: Color(0x33461C10),
                        ),
                        24.verticalSpace,
                        _AccountWidget(
                            onTap: () {
                              context.navigateTo(CustomWebView(
                                title: "FAQs",
                                initialUrl: "${Api.baseUrl}/FAQs",
                              ));
                            },
                            imagePath: 'assets/images/ic_help-circle.png',
                            title: 'FAQs'),
                        24.verticalSpace,
                        Divider(
                          thickness: 1,
                          color: Color(0x33461C10),
                        ),
                        24.verticalSpace,
                        _AccountWidget(
                            onTap: () async {
                              await _onLogOutSuccess();
                            },
                            imagePath: 'assets/images/logoutcurve.png',
                            title: 'Logout'),
                        300.verticalSpace,
                      ],
                    ),
                  );
                })),
        if (authState is AsyncLoading) PageLoadingWidget(),
      ],
    );
  }

  Future<void> _onLogOutSuccess() async {
    final localStorage = ref.read(localStorageServiceProvider);
    final firebaseService = ref.read(firebaseServiceProvider);

    final newToken = await firebaseService.getFcmToken();
    if (newToken != null) {
      localStorage.setFcmToken(newToken);
    }
    ref.read(localStorageServiceProvider).clearSession();
    context.navigateAndRemoveUntil(LoginScreen());
  }
}

class _AccountWidget extends StatefulWidget {
  final String imagePath;
  final String title;
  final void Function()? onTap;
  const _AccountWidget(
      {required this.imagePath, required this.title, this.onTap});

  @override
  State<_AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<_AccountWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            widget.imagePath,
            width: 24.13,
            height: 24.13,
          ),
          Text(
            widget.title,
            style: TextStyle(
              color: const Color(0xFF4A4A4A),
              fontSize: 24.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarWidget extends ConsumerStatefulWidget {
  final String title;
  final bool showBackButton;
  final bool myOrders;
  const AppBarWidget({
    super.key,
    required this.title,
    this.myOrders = true,
    this.showBackButton = true,
  });

  @override
  ConsumerState<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends ConsumerState<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Color(0xFFF5F3F0),
        automaticallyImplyLeading: false,
        leading: widget.showBackButton
            ? InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Image.asset(
                  'assets/images/ic_left_arrow.png',
                  color: const Color(0xFF461C10),
                  height: 55.h,
                  width: 55.w,
                ),
              )
            : null,
        title: Text(
          widget.title,
          style: TextStyle(
            color: const Color(0xFF461C10),
            fontSize: 32.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          AsyncWidget(
              wantToShowLoading: false,
              height: 48.h,
              value: ref.watch(todayOrdersProvider),
              data: (ordersData) {
                final items = ordersData.getCombinedUniqueOrders;
                final inProgressOrders = items
                    .where((order) => order.orderCompleted != 1)
                    .toList()
                    .length;
                return Padding(
                  padding: EdgeInsets.only(right: 57),
                  child: widget.myOrders
                      ? InkWell(
                          onTap: () {
                            ref
                                .read(bottomBarTabProvider.notifier)
                                .update((_) => 1);
                          },
                          child: Container(
                              width: 158.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                color: Color(0xFF5CF97F),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 2,
                                    offset: Offset(0, 2),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  'Orders: ${inProgressOrders}',
                                  style: TextStyle(
                                    color: const Color(0xFF414141),
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              )),
                        )
                      : null,
                );
              }),
        ]);
  }
}
