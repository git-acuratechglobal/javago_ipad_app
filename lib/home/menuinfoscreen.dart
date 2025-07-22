import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/config/async_widget.dart';
import 'package:java_go/config/common/extensions.dart';
import 'package:java_go/config/common/widgets.dart';
import 'package:java_go/config/widgets/page_loading_widget.dart';
import 'package:java_go/home/cafeinfotabscreen.dart';
import 'package:java_go/home/menucategoryitemscreen.dart';
import 'package:java_go/home/notifier/cafe_info_notifier/cafe_info_notifier.dart';
import 'package:java_go/home/notifier/update_menu_item_status/update_menu_item_status_notifier.dart';
import 'package:java_go/home/notifiers/add_option_items.dart';
import 'package:java_go/home/menu_info_state.dart';

import '../auth/pages/sign_up/menu.dart';
import 'notifiers/add_menu_items_notifier.dart';

final consolidatedOptionsProvider =
    Provider.family<AsyncValue<List<dynamic>>, List<int>>((ref, ids) {
  final allOptions = <dynamic>[];
  final isLoading = <bool>[];
  final errors = <Object?>[];
  final uniqueNameMap = <String, dynamic>{};

  for (final id in ids) {
    final optionItemAsyncValue = ref.watch(optionalItemProvider(id));

    optionItemAsyncValue.whenData((menuItem) {
      final items = menuItem.data?.optionSizeCafeItems ?? [];

      for (final item in items) {
        final name = item.addonSizeName ?? "-";
        if (!uniqueNameMap.containsKey(name)) {
          uniqueNameMap[name] = item;
          allOptions.add(item);
        }
      }
    });

    if (optionItemAsyncValue.isLoading) {
      isLoading.add(true);
    }

    if (optionItemAsyncValue.hasError) {
      errors.add(optionItemAsyncValue.error);
    }
  }

  if (isLoading.isNotEmpty) {
    return const AsyncValue.loading();
  }

  if (errors.isNotEmpty) {
    return AsyncValue.error(errors.first!, StackTrace.current);
  }

  return AsyncValue.data(allOptions);
});

class MenuInfoScreen extends ConsumerStatefulWidget {
  final int? id;
  final int defaultTabIndex;
  const MenuInfoScreen({
    super.key,
    this.id,
    this.defaultTabIndex = 0,
  });

  @override
  ConsumerState<MenuInfoScreen> createState() => _MenuInfoScreenState();
}

class _MenuInfoScreenState extends ConsumerState<MenuInfoScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
                  child: const MenuCategoryItemScreen(),
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
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    final infotabdata = ref.read(menuInfoTabStateProvider);
    _tabController = TabController(
      initialIndex: infotabdata.tabIndex,
      length: 2,
      vsync: this,
    );

    ref.listenManual(menuInfoTabStateProvider, (previous, next) {
      if (_tabController.index != next.tabIndex) {
        _tabController.animateTo(next.tabIndex);
      }
    });

    ref.listenManual(updateMenuItemStatusNotifierProvider, (_, next) {
      switch (next) {
        case AsyncError error:
          context.showSnackBar(error.error.toString());
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedIds = ref.watch(selectedIdsProvider);
    final selectedItemId = ref.watch(selectedItemIdProvider);
    final infotabdata = ref.watch(menuInfoTabStateProvider);

    final itemId = selectedItemId ??
        (selectedIds.isNotEmpty
            ? int.tryParse(selectedIds.first)
            : infotabdata.id) ??
        0;
    final isLoading =
        ref.watch(updateMenuItemStatusNotifierProvider).isLoading ||
            ref.watch(addMenuItemsNotifierProvider).isLoading ||
            ref.watch(cafeInfoNotifierProvider).isLoading;
    return Stack(
      children: [
        DefaultTabController(
          initialIndex: infotabdata.tabIndex,
          length: 2,
          child: Column(
            children: [
              62.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 57),
                child: Row(
                  children: [
                    Container(
                      width: 370,
                      height: 50,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: TabBar(
                          controller: _tabController,
                          indicatorColor: Colors.transparent,
                          dividerColor: Colors.transparent,
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.black,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          tabs: const [
                            Tab(text: 'Menu Items'),
                            Tab(text: 'Additional Options'),
                          ],
                          onTap: (value) {
                            ref
                                .read(menuInfoTabStateProvider.notifier)
                                .updateMenuTab(value);
                            ref.read(selectedItemIdProvider.notifier).state =
                                null;
                          },
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 45, right: 11),
                      child: InkWell(
                        onTap: () {
                          //    TODO ("ADD ITEM");
                          showDialogMenu();
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent,
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.add, color: Colors.black),
                              8.horizontalSpace,
                              Text(
                                'Add',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
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
                            side: const BorderSide(width: 1),
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
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(5),
                          suffixIcon: const Icon(Icons.search,
                              color: Color(0xFF4C2F27)),
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: const Color(0xFF7B7B7B),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          fillColor: const Color(0xFFF5F3F0),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFF4C2F27)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onTapOutside: (val) {
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              5.verticalSpace,
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    const ReviewItems(),
                    _buildAdditionalOptionsTab(),
                  ],
                ),
              ),
              100.verticalSpace,
            ],
          ),
        ),
        if (isLoading) PageLoadingWidget()
      ],
    );
  }

  Widget _buildAdditionalOptionsTab() {
    final selectedIds = ref.watch(selectedIdsProvider);
    final selectedItemId = ref.watch(selectedItemIdProvider);
    final idsToShow = <int>[];

    if (selectedItemId != null) {
      idsToShow.add(selectedItemId);
    } else {
      for (final ids in selectedIds) {
        final parsedId = int.tryParse(ids);
        if (parsedId != null) {
          idsToShow.add(parsedId);
        }
      }
    }

    if (idsToShow.isEmpty) {
      return const Center(child: Text('No items selected'));
    }
    final consolidatedOptionsAsync =
        ref.watch(consolidatedOptionsProvider(idsToShow));

    Future<void> _onRefresh() async {
      for (final id in idsToShow) {
        ref.invalidate(optionalItemProvider(id));
      }
    }

    return Scaffold(
      body: RefreshIndicator(
        color: Color(0xFFC0987C),
        onRefresh: _onRefresh,
        child: AsyncWidget(
          onRetry: () {
            ref.invalidate(consolidatedOptionsProvider(idsToShow));
          },
          value: consolidatedOptionsAsync,
          data: (items) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: 1189.w,
                  height: 59.h,
                  decoration: const BoxDecoration(color: Color(0xFF9B6842)),
                  child: Row(
                    children: [
                      SizedBox(
                          width: 74.w,
                          child: Text('',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp))),
                      15.horizontalSpace,
                      SizedBox(
                          width: 121.w,
                          child: Text('Item Name',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp))),
                      15.horizontalSpace,
                      SizedBox(
                          width: 102.w,
                          child: Text('',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp))),
                      35.horizontalSpace,
                      SizedBox(
                          width: 110.w,
                          child: Text('',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp))),
                      15.horizontalSpace,
                      SizedBox(
                          width: 198.w,
                          child: Text('',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp))),
                      10.horizontalSpace,
                      SizedBox(
                          width: 170.w,
                          child: Text('',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp))),
                      15.horizontalSpace,
                      SizedBox(
                          width: 120.w,
                          child: Text('Status',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp))),
                      15.horizontalSpace,
                      SizedBox(
                          width: 120.w,
                          child: Text('Availability',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp))),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    itemCount: items.length,
                    separatorBuilder: (_, __) => 10.verticalSpace,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 15.w),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 40.h,
                              width: 40.w,
                            ),
                            38.horizontalSpace,
                            Expanded(
                              child: Text(
                                item.addonSizeName ?? "-",
                              ),
                            ),
                            25.horizontalSpace,
                            SizedBox(
                                width: 90.w,
                                child:
                                    Text('', overflow: TextOverflow.ellipsis)),
                            15.horizontalSpace,
                            SizedBox(
                                width: 80.w,
                                child:
                                    Text('', overflow: TextOverflow.ellipsis)),
                            15.horizontalSpace,
                            SizedBox(
                                width: 150.w,
                                child:
                                    Text('', overflow: TextOverflow.ellipsis)),
                            35.horizontalSpace,
                            SizedBox(
                              width: 60.w,
                              child: Text(
                                '',
                              ),
                            ),
                            15.horizontalSpace,
                            StatusContainer(
                              editOption: false,
                              isFromAddition: true,
                              status: item.status ?? 1,
                              id: item.addonSizeId ?? 0,
                              onChanged: (bool val) {
                                ref
                                    .read(updateMenuItemStatusNotifierProvider
                                        .notifier)
                                    .updateAddonItemStatus(
                                        id: item.addonSizeId,
                                        status: val ? 1 : 0);
                              },
                              onDelete: () {},
                              onEdit: () {},
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // 211.verticalSpace
              ],
            );
          },
        ),
      ),
    );
  }

  void showDialogMenu() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(height: 300, width: 500, child: _MenuUploadWidget()),
        );
      },
    );
  }
}

class _MenuUploadWidget extends ConsumerStatefulWidget {
  const _MenuUploadWidget({super.key});

  @override
  ConsumerState<_MenuUploadWidget> createState() => _MenuUploadWidgetState();
}

class _MenuUploadWidgetState extends ConsumerState<_MenuUploadWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                context.navigateTo(const MenuScreen2(
                  isEditmode: false,
                  fromAdd: true,
                ));
              },
              child: const Text("Add Manually"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFC0987C),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 60,
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ref.read(cafeInfoNotifierProvider.notifier).uploadPickedFile();
              },
              child: const Text("Upload Sheet"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFC0987C),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 60,
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ref.read(cafeInfoNotifierProvider.notifier).downloadFile();
              },
              child: const Text("Download Sheet"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFC0987C),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
