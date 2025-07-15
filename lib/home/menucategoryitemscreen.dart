import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/config/async_widget.dart';
import 'package:java_go/home/notifier/menu_category/menu_category_notifier.dart';
import 'package:java_go/home/notifiers/menu_items.dart';

class MenuCategoryItemScreen extends ConsumerStatefulWidget {
  const MenuCategoryItemScreen({super.key});

  @override
  ConsumerState<MenuCategoryItemScreen> createState() =>
      _MenuCategoryItemScreenState();
}

class _MenuCategoryItemScreenState
    extends ConsumerState<MenuCategoryItemScreen> {
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
        body: AsyncWidget(
            value: ref.watch(menuItemsProvider),
            data: (menuItems) {
              return AsyncWidget(
                  value: ref.watch(getMenuCategoryProvider),
                  data: (data) {
                    final dynamicList = data.isEmpty
                        ? menuItems.data?.itemCategory?.values.toList()
                        : data.map((e) => e.menuName ?? "").toList();
                    return Column(
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
                        10.verticalSpace,
                        Center(
                          child: Text(
                            'Drag and drop to order you menu categories',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        20.verticalSpace,
                        Expanded(
                          child: Scrollbar(
                            thickness: 5,
                            thumbVisibility: true,
                            trackVisibility: true,
                            child: ReorderableListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 40.w),
                              itemCount: dynamicList!.length,
                              buildDefaultDragHandles: false,
                              itemBuilder: (context, index) {
                                return ReorderableDragStartListener(
                                  key: ValueKey(dynamicList[index]),
                                  index: index,
                                  child: ItemContainerWidget(
                                      title: dynamicList[index]),
                                );
                              },
                              onReorder: (oldIndex, newIndex) {
                                if (newIndex > oldIndex) newIndex -= 1;
                                final item = dynamicList.removeAt(oldIndex);
                                dynamicList.insert(newIndex, item);

                                ref
                                    .read(updateMenuCategoryNotifierProvider
                                        .notifier)
                                    .setCategoryMenu(dynamicList);
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            }));
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
              child: Column(
                children: [
                  Image.asset('assets/images/ic_poly.png',
                      height: 20.h, width: 20.w),
                  Image.asset('assets/images/ic_poly2.png',
                      height: 20.h, width: 20.w),
                ],
              )),
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
