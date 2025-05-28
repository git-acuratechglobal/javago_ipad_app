import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/home/bottombar.dart';

import 'package:java_go/home/item_availability.dart';
import 'package:java_go/home/notifiers/view_order_provider.dart';

import 'package:java_go/home/orderhistoryscreen.dart';

import 'package:java_go/home/statsscreen.dart';

class Homescreen extends ConsumerStatefulWidget {
  const Homescreen({super.key});

  @override
  ConsumerState<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends ConsumerState<Homescreen> with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _tabControllerOrder;
  bool isTabbed = false;
  int _selectedTabIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabControllerOrder = TabController(initialIndex: 1, length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabControllerOrder.dispose();
    super.dispose();
  }

  String _getTitle() {
    if (isTabbed) {
      switch (_selectedTabIndex) {
        case 0:
          return 'Stats';
        case 1:
          return 'Orders';
        case 2:
          return 'Order History';
        default:
          return 'Orders';
      }
    } else {
      return 'Home';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF5F3F0),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(190),
        child: CustomTabBarHomeScreenWidget(
          tabController: _tabController,
          tabControllerOrder: _tabControllerOrder,
          title: _getTitle(),
          onTabChanged: (bool tabbed, int index) {
            // setState(() {
            //   isTabbed = tabbed;
            //   _selectedTabIndex = index;
            // });
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabControllerOrder,
              children: [
                StatsScreen(),
                ItemAvailabilityScreen(tabController: _tabController),
                const OrderHistoryScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTabBarHomeScreenWidget extends ConsumerStatefulWidget {
  final TabController tabController;
  final TabController tabControllerOrder;
  final String title;
  final Function(bool, int) onTabChanged;

  const CustomTabBarHomeScreenWidget({
    super.key,
    required this.tabController,
    required this.tabControllerOrder,
    required this.title,
    required this.onTabChanged,
  });

  @override
  ConsumerState<CustomTabBarHomeScreenWidget> createState() => _CustomTabBarHomeScreenWidgetState();
}

class _CustomTabBarHomeScreenWidgetState extends ConsumerState<CustomTabBarHomeScreenWidget> {
  int _selectedOrderTabIndex = 1;

  @override
  Widget build(BuildContext context) {
    final orders = ref.watch(todayOrdersProvider);
    final items = orders.value?.getCombinedUniqueOrders;
    final inProgressOrders = items?.where((order) => order.orderCompleted != 1).toList().length;

    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: const Color(0xFFF5F3F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F3F0),
        automaticallyImplyLeading: false,
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
            padding: EdgeInsets.only(right: 57.w),
            child: InkWell(
              onTap: () {


                widget.tabControllerOrder.animateTo(1);
                setState(
                  () {
                    _selectedOrderTabIndex = 1;
                  },
                );
              },
              child: Container(
                width: 158.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF5CF97F),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 2,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Orders: ${inProgressOrders}",
                    style: TextStyle(
                      color: Color(0xFF414141),
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
      ),
      body: Column(
        children: [
          24.verticalSpace,
          28.verticalSpace,
          TabBar(
            onTap: (index) {
              setState(() {
                _selectedOrderTabIndex = index;
              });

              widget.onTabChanged(true, index);
            },
            controller: widget.tabControllerOrder,
            tabAlignment: TabAlignment.fill,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: const Color(0xFF461C10),
            unselectedLabelColor: const Color(0xFFC0987C),
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            labelStyle: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
            unselectedLabelStyle: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
            tabs: [
              _buildTab(
                iconPath: 'assets/images/ic_bar_chart.png',
                label: 'Stats',
                iconWidth: 30,
                iconHeight: 31,
                spacing: 40,
                isSelected: _selectedOrderTabIndex == 0,
              ),
              _buildTab(
                iconPath: 'assets/images/ic_book.png',
                label: 'Today Orders',
                iconWidth: 19.w,
                iconHeight: 19.h,
                spacing: 25,
                isSelected: _selectedOrderTabIndex == 1,
              ),
              _buildTab(
                iconPath: 'assets/images/ic_left_arrow.png',
                label: 'Order history',
                iconWidth: 24.w,
                iconHeight: 24.h,
                spacing: 30,
                isSelected: _selectedOrderTabIndex == 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildTab({
  required String iconPath,
  required String label,
  required double iconWidth,
  required double iconHeight,
  required double spacing,
  required bool isSelected,
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
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
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
              color: isSelected ? const Color(0xFF461C10) : Colors.white,
              width: iconWidth,
              height: iconHeight,
            ),
          ),
          SizedBox(width: spacing),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xFF461C10) : Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ),
  );
}
