import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/config/async_widget.dart';
import 'package:java_go/home/bottombar.dart';
import 'package:java_go/home/homescreen.dart';
import 'package:java_go/home/notifiers/view_order_provider.dart';

final tabIndexProvider = StateProvider<int>((ref) => 0);

class CustomTabBar extends ConsumerStatefulWidget {
  final String title;
  final void Function(int val) onTap;
  const CustomTabBar({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  ConsumerState<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends ConsumerState<CustomTabBar> {
  bool isSelectd = false;

  @override
  Widget build(BuildContext context) {
    final currentTabIndex = ref.watch(tabIndexProvider);
    return AppBar(
        backgroundColor: Color(0xFFF5F3F0),
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: () {
              context.pop();
            },
            child: Image.asset(
              'assets/images/ic_left_arrow.png',
              color: Color(0xFF461C10),
              height: 55.h,
              width: 55.w,
            )),
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
            child: InkWell(
              onTap: () {
                widget.onTap(1);
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
                    'Order 1',
                    style: TextStyle(
                      color: const Color(0xFF414141),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
        bottom: TabBar(
          onTap: (val) => widget.onTap(val),
          tabAlignment: TabAlignment.fill,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: const Color(0xFF461C10),
          unselectedLabelColor: Colors.white,
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          labelStyle: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
          unselectedLabelStyle:
              TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
          tabs: [
            _buildTab(
              iconPath: 'assets/images/ic_bar_chart.png',
              label: 'Stats',
              iconWidth: 30,
              iconHeight: 31,
              spacing: 40,
            ),
            _buildTab(
              iconPath: 'assets/images/ic_book.png',
              label: 'Item availability',
              iconWidth: 19.w,
              iconHeight: 19.h,
              spacing: 25,
            ),
            _buildTab(
              iconPath: 'assets/images/ic_left_arrow.png',
              label: 'Order history',
              iconWidth: 24.w,
              iconHeight: 24.h,
              spacing: 30,
            ),
          ],
        ));
  }

  Widget _buildTab({
    required String iconPath,
    required String label,
    required double iconWidth,
    required double iconHeight,
    required double spacing,
  }) {
    return Tab(
      child: Container(
        width: 244,
        height: 51,
        decoration: ShapeDecoration(
          color: const Color(0xFFC0987C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          shadows: [
            BoxShadow(
              color: const Color(0x3F000000),
              blurRadius: 2,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Image.asset(
                iconPath,
                width: iconWidth,
                height: iconHeight,
              ),
            ),
            SizedBox(width: spacing),
            Text(
              label,
              style: TextStyle(
                // color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTabBarCafeInfo extends ConsumerStatefulWidget {
  final String title;
  final bool? onBackPress;
  final TabController tabController;
  const CustomTabBarCafeInfo(
      {super.key,
      required this.title,
      required this.onTap,
      this.onBackPress,
      required this.tabController});
  final void Function(int val) onTap;
  @override
  ConsumerState<CustomTabBarCafeInfo> createState() =>
      _CustomTabBarCafeInfoState();
}

class _CustomTabBarCafeInfoState extends ConsumerState<CustomTabBarCafeInfo> {
  bool isSelectd = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        leading: widget.onBackPress != null && widget.onBackPress!
            ? InkWell(
                onTap: context.pop,
                child: Image.asset(
                  'assets/images/ic_left_arrow.png',
                  color: Color(0xFF461C10),
                  height: 55.h,
                  width: 55.w,
                ),
              )
            : null,
        // leading: Image.asset(
        //           'assets/images/ic_left_arrow.png',
        //           color: Color(0xFF461C10),
        //           height: 55.h,
        //           width: 55.w,
        //         ),
        backgroundColor: Color(0xFFF5F3F0),
        title: Text(
          widget.title,
          style: TextStyle(
            color: const Color(0xFF461C10),
            fontSize: 32,
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
                final inProgressOrders =
                    items.where((order) => order.orderCompleted != 1).toList().length;
                return Padding(
                  padding: EdgeInsets.only(right: 57),
                  child: InkWell(
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
                      ),
                    ),
                  ),
                );
              })
        ],
        bottom: TabBar(
          controller: widget.tabController,
          onTap: (val) => widget.onTap(val),
          tabAlignment: TabAlignment.fill,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: const Color(0xFF461C10),
          unselectedLabelColor: Colors.white,
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          labelStyle: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
          unselectedLabelStyle:
              TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
          tabs: [
            _buildTab(
              label: 'Cafe information',
            ),
            _buildTab(
              label: 'Menu',
            ),
            _buildTab(
              label: 'Click and Collect',
            ),
            _buildTab(
              label: 'Loyality Card',
            ),
          ],
        ));
  }

  Widget _buildTab({
    required String label,
  }) {
    return Tab(
      child: Container(
        width: 244,
        height: 51,
        decoration: ShapeDecoration(
          color: const Color(0xFFC0987C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          shadows: [
            BoxShadow(
              color: const Color(0x3F000000),
              blurRadius: 2,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              // color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
