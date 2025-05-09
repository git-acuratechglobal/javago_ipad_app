import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuCategoryItemScreen extends StatefulWidget {
  const MenuCategoryItemScreen({super.key});

  @override
  State<MenuCategoryItemScreen> createState() => _MenuCategoryItemScreenState();
}

class _MenuCategoryItemScreenState extends State<MenuCategoryItemScreen> {
  List<String> categories = [
    'Hot drinks',
    'Smoothie',
    'Sandwich',
    'Bagel',
    'Salad',
    'Soft drink',
    'Iced tea',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3F0),
      body: Column(
        children: [
          40.verticalSpace,
          Center(
            child: Text(
              'Menu Category Order',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          20.verticalSpace,
          Expanded(
            child: ReorderableListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              itemCount: categories.length,
              buildDefaultDragHandles: false, 
              itemBuilder: (context, index) {
                return ReorderableDragStartListener(
                  key: ValueKey(categories[index]),
                  index: index,
                  child: ItemContainerWidget(title: categories[index]),
                );
              },
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex) newIndex -= 1;
                  final item = categories.removeAt(oldIndex);
                  categories.insert(newIndex, item);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ItemContainerWidget extends StatelessWidget {
  final String title;
  const ItemContainerWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      width: double.infinity,
      height: 57.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(children: [
                 Image.asset('assets/images/ic_poly.png', height: 20.h, width: 20.w),
                Image.asset('assets/images/ic_poly2.png', height: 20.h, width: 20.w),
            ],)
          ),
          20.horizontalSpace,
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
