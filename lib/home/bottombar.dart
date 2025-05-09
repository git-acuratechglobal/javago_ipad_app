import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/home/account.dart';
import 'package:java_go/home/cafeinfotabscreen.dart';
import 'package:java_go/home/homescreen.dart';
import 'package:java_go/home/notifiers/home_notifier.dart';


class CustomBottomNavBar extends ConsumerStatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  ConsumerState<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends ConsumerState<CustomBottomNavBar> {
  int selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (index == 1) { 
    // ref.read(homeNotifierProvider.notifier).getOrders();
  }

    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: selectedIndex,
        children: [
          CafeInfoTabScreen(),
          Homescreen(),
          Account(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
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
                verticalOffset: 30.0,
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
