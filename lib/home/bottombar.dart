import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/home/account.dart';
import 'package:java_go/home/cafeinfotabscreen.dart';
import 'package:java_go/home/homescreen.dart';

final bottomBarTabProvider = StateProvider.autoDispose((ref) => 1);

class CustomBottomNavBar extends ConsumerStatefulWidget {
  final bool? homescreen;
  CustomBottomNavBar({super.key, this.homescreen = false});

  @override
  ConsumerState<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends ConsumerState<CustomBottomNavBar> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // _onItemTapped(1);
    });
  }

  void _onItemTapped(int index) {
    ref.read(bottomBarTabProvider.notifier).update((_) => index);
  }

  @override
  Widget build(BuildContext context) {
    final bottomBarTab = ref.watch(bottomBarTabProvider);
    return Stack(
      children: [
        Scaffold(
          extendBody: true,
          body: IndexedStack(
            index: bottomBarTab,
            children: [
              CafeInfoTabScreen(),
              Homescreen(),
              Account(),
            ],
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: BottomAppBar(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(
                    label: 'Cafe Info',
                    index: 0,
                    selectedAsset: 'assets/images/ic_coffee_bar.png',
                  ),
                  _buildNavItem(
                    label: 'Order',
                    index: 1,
                    verticalOffset: 0.02.sh,
                  ),
                  _buildNavItem(
                    label: 'Account',
                    index: 2,
                    selectedAsset: 'assets/images/ic_group_bar.png',
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 70,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: OvalBorder(
                  side: BorderSide(
                    width: 2,
                    color: const Color(0xFFC0987C),
                  ),
                ),
              ),
              height: 89.h,
              width: 89.w,
              child: FloatingActionButton(
                onPressed: () {
                  _onItemTapped(1);
                },
                backgroundColor: Colors.white,
                shape: const CircleBorder(),
                child: Image.asset(
                  'assets/images/ic_coffee_mug_bar.png',
                  width: 42.74,
                  height: 53.87,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem({
    required String label,
    required int index,
    String? selectedAsset,
    double verticalOffset = 0.0,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        child: Padding(
          padding: EdgeInsets.only(top: verticalOffset),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (selectedAsset != null)
                Image.asset(
                  selectedAsset,
                  width: 24.w,
                  height: 24.h,
                )
              else
                const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF461C10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// void _onItemTapped(int index) {

//       ref.read(orderTabProvider.notifier).state = index;

//   // if (index == 1) {

//   // }
// }

// @override
// Widget build(BuildContext context) {
//  final  selectedIndex = ref.watch(orderTabProvider);
