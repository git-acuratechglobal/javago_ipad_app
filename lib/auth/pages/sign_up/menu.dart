import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/config/common/addoptions.dart';
import 'package:java_go/config/common/button.dart';
import 'package:java_go/config/common/cache_network_image.dart';
import 'package:java_go/config/common/custom_dropdown.dart';
import 'package:java_go/config/common/custom_text_feild.dart';
import 'package:java_go/config/widgets/page_loading_widget.dart';
import 'package:java_go/home/model/get_menu_items.dart';
import 'package:java_go/home/notifier/get_menu_item_details/get_menu_item_details_notifier.dart';
import 'package:java_go/home/notifier/menu_notifier.dart';
import 'package:java_go/home/notifiers/menu_items.dart';
import 'package:java_go/home/param/item_param/item_param.dart';
import '../../../config/async_widget.dart';
import '../../../config/common/widgets.dart';
import '../../../config/widgets/app_text_field.dart';
import '../../../home/model/menu_items_data.dart';
import '../../../home/notifier/add_options.dart';
import '../../../home/notifier/cafe_info_notifier/cafe_info_notifier.dart';
import '../../../home/notifiers/add_menu_items_notifier.dart';
import '../../../home/state/cafe_info_state/cafe_info_state.dart';

class MenuScreen2 extends ConsumerStatefulWidget {
  const MenuScreen2(
      {super.key,
      required this.isEditmode,
      this.fromAdd = false,
      this.itemId,
      this.menuItem});
  final int? itemId;
  final bool isEditmode;
  final bool? fromAdd;
  final Datum? menuItem;
  @override
  ConsumerState<MenuScreen2> createState() => _MenuScreen2State();
}

class _MenuScreen2State extends ConsumerState<MenuScreen2> {
  final List<String> itemSizes = ['Small', 'Medium', 'Large'];

  PreDefinedItem? selectedItem;

  List<AddonItemModel?> selectedItems = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.listenManual(getMenuItemsDetailsProvider(itemId: widget.itemId),
          (_, next) {
        next.whenData((data) {
          ref.read(itemParamNotifierProvider.notifier).updateItemData(data);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final menuItemParam = ref.read(itemParamNotifierProvider.notifier);
    final itemsData = ref.watch(itemParamNotifierProvider);
    final fields = ref.watch(optionFieldProvider);
    final notifier = ref.read(optionFieldProvider.notifier);
    return Scaffold(
        backgroundColor: const Color(0xFFF5F3F0),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFFF5F3F0),
          leading:  InkWell(
                  onTap: () => context.pop(),
                  child: Image.asset(
                    'assets/images/ic_left_arrow.png',
                    color: const Color(0xFF461C10),
                    height: 55.h,
                    width: 55.w,
                  ),
                ),

          title: widget.isEditmode
              ? Text(
                  widget.fromAdd! ? "Add Item" : 'Menu',
                  style: const TextStyle(
                    color: Color(0xFF461C10),
                    fontSize: 32,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                )
              :  Text(
            "Add Item" ,
            style: const TextStyle(
              color: Color(0xFF461C10),
              fontSize: 32,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: AsyncWidget(
            value:
                ref.watch(getMenuItemsDetailsProvider(itemId: widget.itemId)),
            data: (itemDetails) {
              return AsyncWidget(
                  value: ref.watch(menuItemsProvider),
                  data: (data) {
                    final items = data.data;
                    final groupedOptions = items?.groupedOptions ?? {};
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          40.verticalSpace,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 45),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // CustomDropdownWithImage<PreDefinedItem>(
                                //   value: itemsData.itemImageId == 0
                                //       ? selectedItem
                                //       : items?.preDefinedItem?.firstWhere(
                                //           (e) =>
                                //               e.id == itemsData.itemImageId &&
                                //               e.id != 0,
                                //         ),
                                //   hint: "Select Name",
                                //   dropdownItems: items?.preDefinedItem ?? [],
                                //   onChanged: (value) {
                                //     if (value != null) {
                                //       menuItemParam.updateImageId(value.id);
                                //       setState(() {
                                //         selectedItem = value;
                                //       });
                                //     }
                                //   },
                                //   getLabel: (item) => item.itemName ?? "",
                                //   getImageUrl: (item) => item.itemImage ?? "",
                                //   customBtn: CustomButtonForIcon(
                                //     selectedItem: itemsData.itemImageId == 0
                                //         ? selectedItem
                                //         : items?.preDefinedItem?.firstWhere(
                                //             (e) =>
                                //                 e.id == itemsData.itemImageId &&
                                //                 e.id != 0,
                                //           ),
                                //   ),
                                // ),
                                // 70.horizontalSpace,
                                AppTextField(
                                  height: 45,
                                  width: 250,
                                  fillColor: Colors.transparent,
                                  initialValue: itemsData.itemName,
                                  label: 'Item Name',
                                  hint: "Enter item name",
                                  onChanged: (val) {
                                    menuItemParam.updateName(val!);
                                  },
                                ),
                                70.horizontalSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Select Category*',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                    6.verticalSpace,
                                    SimpleCustomDropdown(
                                      initialValue: items?.itemCategory?[
                                          itemsData.itemCategoryId.toString()],
                                      height: 45,
                                      items: items?.itemCategory?.values
                                              .toList() ??
                                          [],
                                      onChanged: (String? value) {
                                        if (value != null) {
                                          final categoryMap =
                                              items?.itemCategory ?? {};
                                          final categoryId = categoryMap.entries
                                              .firstWhere(
                                                  (entry) =>
                                                      entry.value == value,
                                                  orElse: () =>
                                                      const MapEntry('0', ''))
                                              .key;
                                          menuItemParam.updateCategoryId(
                                              int.parse(categoryId));
                                        }
                                      },
                                      hint: 'Select Category',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          41.verticalSpace,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 45, right: 70),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTextField(
                                      initialValue:
                                          itemDetails?.itemDescription,
                                      fillColor: Colors.transparent,
                                      width: 240.w,
                                      maxLines: 7,
                                      onChanged: (val) {
                                        menuItemParam.updateDescription(val!);
                                      },
                                      hint: 'Enter item description',
                                      label: 'Item Description',
                                    ),
                                    26.verticalSpace,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Select Type*',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                        6.verticalSpace,
                                        SimpleCustomDropdown(
                                          initialValue: items?.itemType?[
                                              itemDetails?.itemType.toString()],
                                          height: 45,
                                          hint: 'Select Type',
                                          items: items?.itemType?.values
                                                  .toList() ??
                                              [],
                                          onChanged: (String? value) {
                                            String? selectedKey;
                                            items?.itemType
                                                ?.forEach((key, val) {
                                              if (val == value) {
                                                selectedKey = key;
                                              }
                                            });
                                            if (selectedKey != null) {
                                              menuItemParam.updateTypeId(
                                                  int.parse(selectedKey!));
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Consumer(
                                  builder: (context, ref, _) {
                                    final list = ref.watch(sizePriceProvider);
                                    final notifier =
                                        ref.read(sizePriceProvider.notifier);
                                    final itemSizeMap = items?.itemSize ?? {};

                                    final sizeToIdMap = itemSizeMap.map(
                                        (key, value) =>
                                            MapEntry(value, int.parse(key)));

                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListView.separated(
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            final item = list[index];
                                            final selectedSizes = list
                                                .asMap()
                                                .entries
                                                .where((entry) =>
                                                    entry.key != index)
                                                .map(
                                                    (entry) => entry.value.size)
                                                .where(
                                                    (size) => size.isNotEmpty)
                                                .toSet();
                                            final allSizes = items
                                                    ?.itemSize?.values
                                                    .toList() ??
                                                [];
                                            final availableSizes =
                                                allSizes.where((size) {
                                              return !selectedSizes
                                                      .contains(size) ||
                                                  size == item.size;
                                            }).toList();
                                            return Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Flexible(
                                                    child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Size*',
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    6.verticalSpace,
                                                    SimpleCustomDropdown(
                                                      initialValue: item.size,
                                                      items: availableSizes,
                                                      onChanged:
                                                          (String? value) {
                                                        if (value != null) {
                                                          notifier.updateSize(
                                                              index, value);
                                                        }
                                                      },
                                                      height: 45,
                                                      hint: 'Select size',
                                                    ),
                                                  ],
                                                )),
                                                70.horizontalSpace,
                                                Flexible(
                                                  child: PriceTextField(
                                                    readOnly:
                                                        item.size.isNotEmpty,
                                                    labelText: 'Price*',
                                                    hintText: 'Enter price',
                                                    initialValue: item.price,
                                                    onPriceChanged: (price) {
                                                      print(price);
                                                      notifier.updatePrice(
                                                          index, price);
                                                      WidgetsBinding.instance
                                                          .addPostFrameCallback(
                                                              (_) {
                                                        final updatedList =
                                                            ref.read(
                                                                sizePriceProvider);
                                                        final validList =
                                                            updatedList
                                                                .where((e) =>
                                                                    e.size
                                                                        .isNotEmpty &&
                                                                    e.price !=
                                                                        null &&
                                                                    e.price !=
                                                                        0.0)
                                                                .map((e) =>
                                                                    ItemSize(
                                                                      itemSizeId:
                                                                          sizeToIdMap[
                                                                              e.size]!,
                                                                      itemPrice:
                                                                          e.price!,
                                                                    ))
                                                                .toList();
                                                        menuItemParam
                                                            .addItemSize(
                                                                validList);
                                                      });
                                                    },
                                                  ),
                                                ),
                                                50.horizontalSpace,
                                                if (list.length > 1 &&
                                                    index != 0)
                                                  GestureDetector(
                                                    onTap: () {
                                                      notifier.remove(index);
                                                      WidgetsBinding.instance
                                                          .addPostFrameCallback(
                                                              (_) {
                                                        final updatedList =
                                                            ref.read(
                                                                sizePriceProvider);
                                                        final validList =
                                                            updatedList
                                                                .where((e) =>
                                                                    e.size
                                                                        .isNotEmpty &&
                                                                    e.price !=
                                                                        null &&
                                                                    e.price !=
                                                                        0.0)
                                                                .map((e) =>
                                                                    ItemSize(
                                                                      itemSizeId:
                                                                          sizeToIdMap[
                                                                              e.size]!,
                                                                      itemPrice:
                                                                          e.price!,
                                                                    ))
                                                                .toList();
                                                        menuItemParam
                                                            .addItemSize(
                                                                validList);
                                                      });
                                                    },
                                                    child: Image.asset(
                                                        "assets/images/view.png",
                                                        height: 33.h,
                                                        width: 33.w),
                                                  ),
                                              ],
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return 50.verticalSpace;
                                          },
                                          itemCount: list.length,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                        ),
                                        if (list.length >= 3)
                                          SizedBox.shrink()
                                        else
                                          GestureDetector(
                                            onTap: () => notifier.add(),
                                            child: Image.asset(
                                              "assets/images/view2.png",
                                              height: 44.h,
                                              width: 44.w,
                                            ),
                                          )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          30.verticalSpace,
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 45,
                            ),
                            child: InkWell(
                              onTap: () {
                                notifier.addField();
                              },
                              child: Container(
                                width: 200,
                                height: 50,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: const Color(0xFF2C851F),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.add, color: Colors.white),
                                    Text(
                                      'Add Options',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 45),
                            child: Column(
                              children: [
                                43.verticalSpace,
                                ...fields.map((field) {
                                  final selectedIds = fields
                                      .where((f) => f.key != field.key)
                                      .map((f) => f.addonSizeId)
                                      .whereType<int>()
                                      .toSet();
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Item Options",
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                )),
                                            8.verticalSpace,
                                            SizedBox(
                                              width: 250.w,
                                              child: GroupedDropdown(
                                                groupedOptions: groupedOptions,
                                                selectedValue: field.addonSizeId
                                                    ?.toString(),
                                                disabledAddonSizeIds:
                                                    selectedIds,
                                                onChanged: (selected) {
                                                  notifier.updateField(
                                                      field.key,
                                                      addonSizeId: selected?.id,
                                                      addonId:
                                                          selected?.addonId);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        56.horizontalSpace,
                                        PriceTextField(
                                          readOnly: field.addonSizeId != null,
                                          labelText: 'Price',
                                          hintText: 'Enter price',
                                          initialValue: field.price,
                                          onPriceChanged: (price) {
                                            notifier.updateField(
                                              field.key,
                                              price: price,
                                            );
                                          },
                                        ),
                                        55.horizontalSpace,
                                        CustomTextField(
                                            labelText: 'Additional note',
                                            controller:
                                                TextEditingController()),
                                        36.horizontalSpace,
                                        // Remove Button
                                        Column(
                                          children: [
                                            28.verticalSpace,
                                            IconButton(
                                              icon: Image.asset(
                                                'assets/images/view.png',
                                                height: 38.h,
                                                width: 38.w,
                                              ),
                                              onPressed: () => notifier
                                                  .removeField(field.key),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                                30.verticalSpace,
                              ],
                            ),
                          ),
                          30.verticalSpace,
                          if (items?.addons != null &&
                              items!.addons!.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 45, vertical: 10),
                              child: Text(
                                'Addons Item Name*',
                                style: TextStyle(
                                  color: const Color(0xFF4C2F27),
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          OptimizedDropdownWidget(
                            items: items,
                            menuItemParam: menuItemParam,
                            addonItem: itemsData.addonItem,
                          ),
                          35.verticalSpace,
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 45),
                                child: SizedBox(
                                  width: 145.w,
                                  child: ElevatedButton(
                                      onPressed: () {
                                       context.pop();
                                      },
                                      child: const Text('CANCEL')),
                                ),
                              ),
                              18.horizontalSpace,
                              SizedBox(
                                height: 47,
                                width: 145.w,
                                child: PrimaryButton(
                                  isLoading: ref
                                      .watch(addMenuItemsNotifierProvider)
                                      .isLoading,
                                  title: 'NEXT',
                                  textColor: const Color(0xFF461C10),
                                  backgroundColor: Colors.white,
                                  onClick: () {
                                    final selectedOptions = fields
                                        .where((f) =>
                                            f.addonSizeId != null &&
                                            f.price != null)
                                        .map((f) => SelectedOption(
                                              optionId:
                                                  f.addonSizeId.toString(),
                                              price: f.price!,
                                            ))
                                        .toList();
                                    if (selectedOptions.isNotEmpty) {
                                      menuItemParam
                                          .addSelectedOption(selectedOptions);
                                    }
                                    if (widget.itemId != null) {
                                      ref
                                          .read(addMenuItemsNotifierProvider
                                              .notifier)
                                          .updateMenuItems(
                                              itemId: widget.itemId!);
                                    } else {
                                      ref
                                          .read(addMenuItemsNotifierProvider
                                              .notifier)
                                          .addMenuItems();
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          133.verticalSpace,
                        ],
                      ),
                    );
                  });
            }));
  }
}

class SelectManually extends ConsumerStatefulWidget {
  const SelectManually({super.key});

  @override
  ConsumerState<SelectManually> createState() => _SelectManuallyState();
}

class _SelectManuallyState extends ConsumerState<SelectManually> {
  bool _showMenuScreen = false;

  @override
  Widget build(BuildContext context) {
    final cafeInfo = ref.watch(cafeInfoNotifierProvider);
    final cafeEvent = cafeInfo.value?.cafeEvent;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0xFFF5F3F0),
          appBar: AppBar(
            toolbarHeight: 50,
            leading: _showMenuScreen
                ? IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: const Color(0xFF461C10),
                    onPressed: () {
                      setState(() {
                        _showMenuScreen = !_showMenuScreen;
                      });
                    },
                  )
                : null,
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xFFF5F3F0),
            title: Text(
              'Menu',
              style: TextStyle(
                color: const Color(0xFF461C10),
                fontSize: 32.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: cafeEvent == CafeEvent.fileUploaded || _showMenuScreen
              ? ReviewItems(isFromSignUp: true)
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 154, vertical: 50),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 500.sp,
                            height: 80.sp,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _showMenuScreen = true;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFC0987C),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                textStyle: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              child: Text('Enter items manually'),
                            ),
                          ),
                          54.verticalSpace,
                          SizedBox(
                            width: 500.sp,
                            height: 80.sp,
                            child: ElevatedButton(
                              onPressed: () {
                                ref
                                    .read(cafeInfoNotifierProvider.notifier)
                                    .downloadFile();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFC0987C),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                textStyle: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              child: Text('Download spreadsheet sample'),
                            ),
                          ),
                          54.verticalSpace,
                          SizedBox(
                            width: 500.sp,
                            height: 80.sp,
                            child: ElevatedButton(
                              onPressed: () {
                                ref
                                    .read(cafeInfoNotifierProvider.notifier)
                                    .uploadPickedFile()
                                    .then((val) {
                                  setState(() {
                                    _showMenuScreen = true;
                                  });
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFC0987C),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                textStyle: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              child: Text('Upload spreadsheet'),
                            ),
                          ),
                          40.verticalSpace,
                          Text(
                            "Note:The file should be .xlsx format",
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
        ),
        if (cafeInfo is AsyncLoading) PageLoadingWidget()
      ],
    );
  }
}

class AddonDropdownField<T> extends StatelessWidget {
  final List<T> items;
  final T? selectedItem;
  final ValueChanged<T?> onChanged;
  final String Function(T) itemToString;
  final List<Addon> addonItems;
  final int Function(T) getItemId;
  const AddonDropdownField(
      {super.key,
      required this.items,
      required this.selectedItem,
      required this.onChanged,
      required this.itemToString,
      required this.addonItems,
      required this.getItemId});

  @override
  Widget build(BuildContext context) {
    final itemId = selectedItem != null ? getItemId(selectedItem!) : null;
    final sizes = itemId != null
        ? addonItems.where((s) => s.itemId == itemId).toList()
        : [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropdownButton2(
          key: UniqueKey(),
          customBtn: IgnorePointer(
            child: Container(
              width: 240.w,
              height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF4C2F27)),
                borderRadius: BorderRadius.circular(6.r),
                color: Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedItem != null
                        ? itemToString(selectedItem!)
                        : "Select item",
                  ),
                  const Icon(Icons.arrow_drop_down, color: Color(0xFF4C2F27)),
                ],
              ),
            ),
          ),
          hint: "Select Name",
          value: selectedItem,
          dropdownItems: items,
          onChanged: onChanged,
          itemToString: itemToString,
        ),
        15.verticalSpace,
        const Text(
          'Size & Price (£)',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        15.verticalSpace,
        if (sizes.isNotEmpty)
          SizedBox(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...sizes.map((s) => Text(
                      "${s.sizeName} : ${s.itemSizePrice}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
          )
      ],
    );
  }
}

class CustomButtonForIcon extends StatelessWidget {
  const CustomButtonForIcon({super.key, this.selectedItem});
  final PreDefinedItem? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Item Icon*',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        8.verticalSpace,
        Container(
          width: 240.w,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF4C2F27)),
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Row(
            children: [
              if (selectedItem?.itemImage?.isNotEmpty ?? false)
                SizedBox(
                  width: 28,
                  height: 28,
                  child: NetworkImageWidget(
                    imageUrl: selectedItem!.itemImage!,
                    fit: BoxFit.cover,
                    loadingWidgetSize: 15,
                  ),
                ),
              if (selectedItem?.itemImage?.isNotEmpty ?? false)
                15.horizontalSpace,
              Expanded(
                child: Text(
                  selectedItem?.itemName ?? "Select Icon",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF4C2F27),
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_drop_down,
                color: Color(0xFF4C2F27),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OptimizedDropdownWidget extends StatefulWidget {
  final MenuItemData? items;
  final ItemParamNotifier menuItemParam;
  final List<AddonItem> addonItem;
  const OptimizedDropdownWidget(
      {Key? key,
      required this.items,
      required this.menuItemParam,
      required this.addonItem})
      : super(key: key);

  @override
  State<OptimizedDropdownWidget> createState() =>
      _OptimizedDropdownWidgetState();
}

class _OptimizedDropdownWidgetState extends State<OptimizedDropdownWidget> {
  List<AddonItemModel?> selectedItems = [];
  List<AddonItemModel> dropdownValues = [];

  @override
  void initState() {
    super.initState();
    _initializeDropdownValues();
  }

  @override
  void didUpdateWidget(OptimizedDropdownWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items) {
      _initializeDropdownValues();
    }
  }

  void _initializeDropdownValues() {
    if (widget.items?.items == null) {
      dropdownValues = [];
      selectedItems = [];
      return;
    }

    dropdownValues = widget.items!.items!.entries
        .map((entry) => AddonItemModel(id: entry.key, name: entry.value))
        .toList();

    // Only reinitialize if length changed

    selectedItems = List.filled(dropdownValues.length, null);
    // Set initial selections based on addonItem list
    _setInitialSelections();
  }

  void _setInitialSelections() {
    if (widget.addonItem.isEmpty) return;

    // Create a set of addon item IDs for quick lookup
    final addonItemIds =
        widget.addonItem.map((item) => item.addonItemId.toString()).toSet();

    // Create a list to track which addon items have been assigned
    final assignedAddonIds = <String>{};

    // Assign addon items to dropdown positions
    for (int i = 0;
        i < dropdownValues.length &&
            assignedAddonIds.length < addonItemIds.length;
        i++) {
      final dropdownItem = dropdownValues[i];

      // Check if this dropdown item matches any of the addon items
      if (addonItemIds.contains(dropdownItem.id) &&
          !assignedAddonIds.contains(dropdownItem.id)) {
        selectedItems[i] = dropdownItem;
        assignedAddonIds.add(dropdownItem.id);
      }
    }
  }

  Set<String> _getSelectedIdsExcluding(int excludeIndex) {
    return selectedItems
        .asMap()
        .entries
        .where((entry) => entry.key != excludeIndex && entry.value != null)
        .map((entry) => entry.value!.id)
        .toSet();
  }

  List<AddonItemModel> _getFilteredDropdownValues(int index) {
    final selectedValue = selectedItems[index];
    final excludedIds = _getSelectedIdsExcluding(index);

    return dropdownValues
        .where((item) =>
            !excludedIds.contains(item.id) || item.id == selectedValue?.id)
        .toList();
  }

  void _onDropdownChanged(int index, AddonItemModel? value) {
    if (value == null) return;

    setState(() {
      selectedItems[index] = value;
    });

    _updateMenuItemParam();
  }

  void _updateMenuItemParam() {
    final addonItems = selectedItems
        .whereType<AddonItemModel>()
        .map((model) => AddonItem(addonItemId: int.parse(model.id)))
        .toList();

    widget.menuItemParam.addAddonItem(addonItems);
  }

  Widget _buildDropdownItem(int index) {
    return AddonDropdownField<AddonItemModel>(
      addonItems: widget.items?.addons ?? [],
      key: ValueKey('dropdown_$index'),
      items: _getFilteredDropdownValues(index),
      selectedItem: selectedItems[index],
      onChanged: (value) => _onDropdownChanged(index, value),
      itemToString: (item) => item.name,
      getItemId: (item) => int.parse(item.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items?.items == null || dropdownValues.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Wrap(
        spacing: 20,
        children: List.generate(
          dropdownValues.length,
          _buildDropdownItem,
        ),
      ),
    );
  }
}
