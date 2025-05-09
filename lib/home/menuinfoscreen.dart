import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/config/common/widgets.dart';
import 'package:java_go/home/cafeinfotabscreen.dart';
import 'package:java_go/home/menucategoryitemscreen.dart';
import 'package:java_go/sign_up/menu.dart';

class MenuInfoScreen extends ConsumerStatefulWidget {
  const MenuInfoScreen({super.key});

  @override
  ConsumerState<MenuInfoScreen> createState() => _MenuInfoScreenState();
}

class _MenuInfoScreenState extends ConsumerState<MenuInfoScreen> {
  void _showDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.center,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  height: 510.h,
                  width: 625.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: MenuCategoryItemScreen(),
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeIn;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          62.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 57),
            child: Row(
              children: [
                Row(
                  children: [
                    Text(
                      'RESULTS :',
                      style: TextStyle(
                        color: const Color(0xFF848484),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    12.horizontalSpace,
                    Container(
                      height: 54.h,
                      width: 110.w,
                      child: Dropdown('10', Color(0xFF4C2F27)),
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 45, right: 11),
                  child: InkWell(
                    onTap: () {
                      //  ref.read(showMenuEditScreenProvider.notifier).state = true;
                      context.navigateTo(CafeInfoAddTabScreen());
                    },
                    child: Container(
                      width: 100,
                      height: 40,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            weight: 700,
                            color: Colors.black,
                          ),
                          8.horizontalSpace,
                          Text(
                            'Add',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    _showDialog(context);
                  },
                  child: Container(
                    width: 193.w,
                    height: 41.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Menu Category Order',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                8.horizontalSpace,
                SizedBox(
                  width: 212.26.w,
                  height: 42.48.h,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        color: Color(0xFF4C2F27),
                      ),
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: const Color(0xFF7B7B7B),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      fillColor: Color(0xFFF5F3F0),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF4C2F27),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          ReviewItems(),
          // PageIndex(),
          100.verticalSpace
        ],
      ),
    );
  }
}
