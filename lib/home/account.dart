import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/home/bottombar.dart';
import 'package:java_go/home/cafeinformationscreen.dart';
import 'package:java_go/home/changepassword.dart';
import 'package:java_go/home/notifiers/view_order_provider.dart';
import 'package:java_go/service/local_storage_service.dart';

import '../auth/pages/login/login_screen.dart';

class Account extends ConsumerStatefulWidget {
  const Account({super.key});

  @override
  ConsumerState<Account> createState() => _AccountState();
}

class _AccountState extends ConsumerState<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFF5F3F0),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              showBackButton: false,
              title: 'Account',
            )),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 117),
          child: Column(
            children: [
              50.verticalSpace,
              GestureDetector(
                  onTap: () {
                    context.navigateTo(CafeInformationScreen(
                      fromSettings: true,
                    ));
                  },
                  child: AccountWidget(
                      imagePath: 'assets/images/ic_user.png',
                      title: 'My Profile')),
              24.verticalSpace,
              Divider(
                thickness: 1,
                color: Color(0x33461C10),
              ),
              24.verticalSpace,
              InkWell(
                onTap: () {
                  context.navigateTo(ChangePassword());
                },
                child: AccountWidget(
                    imagePath: 'assets/images/ic_lock.png',
                    title: 'Change password'),
              ),
              24.verticalSpace,
              Divider(
                thickness: 1,
                color: Color(0x33461C10),
              ),
              24.verticalSpace,
              AccountWidget(
                  imagePath: 'assets/images/ic_account_frame.png',
                  title: 'Terms and Conditions'),
              24.verticalSpace,
              Divider(
                thickness: 1,
                color: Color(0x33461C10),
              ),
              24.verticalSpace,
              AccountWidget(
                  imagePath: 'assets/images/ic_shield.png',
                  title: 'Privacy Policy'),
              24.verticalSpace,
              Divider(
                thickness: 1,
                color: Color(0x33461C10),
              ),
              24.verticalSpace,
              AccountWidget(
                  imagePath: 'assets/images/ic_help-circle.png', title: 'FAQs'),
              24.verticalSpace,
              Divider(
                thickness: 1,
                color: Color(0x33461C10),
              ),
              24.verticalSpace,
              InkWell(
                  onTap: () {
                    ref.read(localStorageServiceProvider).clearSession();
                    context.navigateAndRemoveUntil(LoginScreen());
                  },
                  child: AccountWidget(
                      imagePath: 'assets/images/logoutcurve.png',
                      title: 'Logout')),
              24.verticalSpace,
              24.verticalSpace,
            ],
          ),
        ));
  }
}

class AccountWidget extends StatefulWidget {
  final String imagePath;
  final String title;
  const AccountWidget(
      {super.key, required this.imagePath, required this.title});

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    final orders = ref.watch(todayOrdersProvider);
    final items = orders.value?.getCombinedUniqueOrders;
    final inProgressOrders =
        items?.where((order) => order.orderCompleted != 1).toList().length;
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
          Padding(
            padding: EdgeInsets.only(right: 57),
            child: widget.myOrders
                ? InkWell(
                    onTap: () {
                      ref.read(bottomBarTabProvider.notifier).update((_) => 1);
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
          )
        ]);
  }
}
