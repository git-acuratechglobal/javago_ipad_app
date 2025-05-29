import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/config/common/addoptions.dart';
import 'package:java_go/config/common/button.dart';
import 'package:java_go/config/common/cache_network_image.dart';
import 'package:java_go/config/common/custom_dropdown.dart';
import 'package:java_go/config/common/custom_text_feild.dart';
import 'package:java_go/config/common/extensions.dart';
import 'package:java_go/home/model/get_menu_items.dart';
import 'package:java_go/home/notifier/menu_notifier.dart';
import 'package:java_go/home/notifiers/menu_items.dart';
import 'package:java_go/home/param/item_param/item_param.dart';
import 'package:rename_app/utils.dart';

import '../../../config/async_widget.dart';
import '../../../home/notifier/add_options.dart';
import '../../../home/notifiers/add_menu_items_notifier.dart';
import '../../../home/notifiers/menu_item_showing.dart';

class MenuScreen extends ConsumerStatefulWidget {
  const MenuScreen({super.key, required this.isEditmode, this.fromAdd = false});
  final bool isEditmode;
  final bool? fromAdd;

  @override
  ConsumerState<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends ConsumerState<MenuScreen> {
  final List<String> itemSizes = ['Small', 'Medium', 'Large'];

  // void _showDialog(BuildContext context) {
  //   showGeneralDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     barrierLabel: "Dismiss",
  //     transitionDuration: const Duration(milliseconds: 300),
  //     pageBuilder: (context, animation, secondaryAnimation) {
  //       return BackdropFilter(
  //         filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 24),
  //           child: Align(
  //             alignment: Alignment.center,
  //             child: Material(
  //               color: Colors.transparent,
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.circular(4),
  //                 ),
  //                 child: Addoptions(),
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  PreDefinedItem? selectedItem;
  Set<String> selectedAddonItemsSet = {};
  final TextEditingController itemCategoryController = TextEditingController();
  final TextEditingController itemSizeController = TextEditingController();
  final TextEditingController addonsItemNameController =
      TextEditingController();
  final TextEditingController itemTypeController = TextEditingController();
  final TextEditingController itemDescriptionController =
      TextEditingController();
  String? selectedSize;
  String? selectedPrice;
  String? selectedAddonItem;
  String? selectedAddonItems;
  String? selectedAddonItemss;
  List<AddonItemModel?> selectedItems = [];

  @override
  void initState() {
    super.initState();
    ref.listenManual(addMenuItemsNotifierProvider, (_, next) {
      switch (next) {
        case AsyncValue<String?> data when data.value != null:
          if (data.value != null) {
            context.showSnackBar(data.value!);
            context.pop();
            ref.invalidate(optionFieldProvider);
            ref.invalidate(showMenuItemssProvider);
          }
        case AsyncError error:
          context.showSnackBar(error.error.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final menuItemState = ref.watch(menuItemsProvider);

    final items = menuItemState.value?.data;
    final menuItemParam = ref.read(itemParamNotifierProvider.notifier);
    final groupedOptions = menuItemState.value?.data?.groupedOptions ?? {};
    final totalSelectableCount = groupedOptions.values.expand((e) => e).length;
    final fields = ref.watch(optionFieldProvider);
    final notifier = ref.read(optionFieldProvider.notifier);
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3F0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF5F3F0),
        leading: widget.isEditmode
            ? InkWell(
                onTap: () => context.pop(),
                child: Image.asset(
                  'assets/images/ic_left_arrow.png',
                  color: const Color(0xFF461C10),
                  height: 55.h,
                  width: 55.w,
                ),
              )
            : null,
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
            : null,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomDropdownWithImage<PreDefinedItem>(
                      value: selectedItem,
                      hint: "Select Name",
                      dropdownItems: items?.preDefinedItem ?? [],
                      onChanged: (value) {
                        if (value != null) {
                          menuItemParam.updateImageId(value.id);
                          setState(() {
                            selectedItem = value;
                          });
                        }
                      },
                      getLabel: (item) => item.itemName ?? "",
                      getImageUrl: (item) => item.itemImage ?? "",
                      customBtn: Column(
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
                          3.verticalSpace,
                          Container(
                            width: 240.w,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFF4C2F27)),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Row(
                              children: [
                                if (selectedItem?.itemImage?.isNotEmpty ??
                                    false)
                                  SizedBox(
                                    width: 28,
                                    height: 28,
                                    child: NetworkImageWidget(
                                      imageUrl: selectedItem!.itemImage!,
                                      fit: BoxFit.cover,
                                      loadingWidgetSize: 15,
                                    ),
                                  ),
                                if (selectedItem?.itemImage?.isNotEmpty ??
                                    false)
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
                      ),
                    ),
                    36.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45),
                      child: CustomTextField(
                        labelText: 'Item Description*',
                        maxLines: 7,
                        controller: itemDescriptionController,
                        border: InputBorder.none,
                        hintText: 'Enter item description',
                        onChanged: (val) {
                          menuItemParam.updateDescription(val);
                        },
                      ),
                    ),
                    11.verticalSpace,
                    CustomDropdownButton(
                        customBtn: IgnorePointer(
                          child: CustomTextField(
                            labelText: 'Select Type*',
                            controller: itemTypeController,
                            readOnly: true,
                            hintText: "Select Type",
                            suffixIcon: const Icon(Icons.arrow_drop_down),
                          ),
                        ),
                        hint: "",
                        value: itemTypeController.text.isEmpty
                            ? null
                            : itemTypeController.text,
                        dropdownItems: items?.itemType?.values.toList() ?? [],
                        onChanged: (value) {
                          if (value != null) {
                            itemTypeController.text = value;
                            String? selectedKey;
                            items?.itemType?.forEach((key, val) {
                              if (val == value) {
                                selectedKey = key;
                              }
                            });
                            if (selectedKey != null) {
                              menuItemParam
                                  .updateTypeId(int.parse(selectedKey!));
                            }
                          }
                        }),
                    24.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 40),
                      child: InkWell(
                        onTap: (){
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

                  ],
                ),
                40.horizontalSpace,
                // Middle Column (Name, Size+Price)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            10.horizontalSpace,
                            CustomTextField(
                              labelText: 'Item Name *',
                              hintText: "Enter item name",
                              onChanged: (val) {
                                menuItemParam.updateName(val);
                              },
                            ),
                            140.horizontalSpace,
                            CustomDropdownButton(
                                customBtn: IgnorePointer(
                                  child: CustomTextField(
                                    labelText: 'Select Category*',
                                    controller: itemCategoryController,
                                    readOnly: true,
                                    hintText: "Select Category",
                                    suffixIcon:
                                        const Icon(Icons.arrow_drop_down),
                                  ),
                                ),
                                hint: "Select Category",
                                value: itemCategoryController.text.isEmpty
                                    ? null
                                    : itemCategoryController.text,
                                dropdownItems:
                                    items?.itemCategory?.values.toList() ?? [],
                                onChanged: (value) {
                                  if (value != null) {
                                    itemCategoryController.text = value;
                                    final categoryMap =
                                        items?.itemCategory ?? {};
                                    final categoryId = categoryMap.entries
                                        .firstWhere(
                                            (entry) => entry.value == value,
                                            orElse: () =>
                                                const MapEntry('0', ''))
                                        .key;
                                    menuItemParam.updateCategoryId(
                                        int.parse(categoryId));
                                  }
                                }),
                          ],
                        ),
                        40.verticalSpace,
                        Consumer(
                          builder: (context, ref, _) {
                            final list = ref.watch(sizePriceProvider);
                            final notifier =
                                ref.read(sizePriceProvider.notifier);
                            final itemSizeMap = items?.itemSize ?? {};
                            final sizeToIdMap = itemSizeMap.map((key, value) =>
                                MapEntry(value, int.parse(key)));
                            final validList = list
                                .where((e) =>
                                    e.size.isNotEmpty &&
                                    e.price != null &&
                                    e.price != 0.0)
                                .map((e) => ItemSize(
                                      itemSizeId: sizeToIdMap[e.size]!,
                                      itemPrice: e.price!,
                                    ))
                                .toList();

                            print(validList);

                            return Column(
                              children: [
                                ...List.generate(list.length, (index) {
                                  final item = list[index];
                                  final selectedSizes = list
                                      .asMap()
                                      .entries
                                      .where((entry) => entry.key != index)
                                      .map((entry) => entry.value.size)
                                      .where((size) => size.isNotEmpty)
                                      .toSet();
                                  final allSizes =
                                      items?.itemSize?.values.toList() ?? [];
                                  final availableSizes = allSizes.where((size) {
                                    return !selectedSizes.contains(size) ||
                                        size == item.size;
                                  }).toList();
                                  print(item.price);
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                        bottom: 10,
                                        right: 10),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: CustomDropdownButton(
                                            customBtn: IgnorePointer(
                                              child: CustomTextField(
                                                labelText: 'Size *',
                                                controller:
                                                    TextEditingController(
                                                        text: item.size),
                                                readOnly: true,
                                                hintText: "Select Size",
                                                suffixIcon: const Icon(
                                                    Icons.arrow_drop_down),
                                              ),
                                            ),
                                            hint: "Select size",
                                            value: item.size.isEmpty
                                                ? null
                                                : item.size,
                                            dropdownItems: availableSizes,
                                            onChanged: (value) {
                                              if (value != null) {
                                                notifier.updateSize(
                                                    index, value);
                                              }
                                            },
                                          ),
                                        ),
                                        140.horizontalSpace,
                                        Flexible(
                                          child: PriceTextField(
                                            readOnly: item.size.isNotEmpty,
                                            labelText: 'Price',
                                            hintText: 'Enter price',
                                            initialValue: item.price,
                                            onPriceChanged: (price) {
                                              notifier.updatePrice(
                                                  index, price);
                                              setState(() {
                                                menuItemParam
                                                    .addItemSize(validList);
                                              });
                                            },
                                          ),
                                        ),
                                        50.horizontalSpace,
                                        if (list.length > 1 && index != 0)
                                          GestureDetector(
                                            onTap: () {
                                              notifier.remove(index);
                                            },
                                            child: Column(
                                              children: [
                                                28.verticalSpace,
                                                Image.asset(
                                                    "assets/images/view.png",
                                                    height: 33.h,
                                                    width: 33.w),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  );
                                }),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 44.0, left: 0, right: 755),
                                  child: Consumer(
                                    builder: (context, ref, _) {
                                      final list = ref.watch(sizePriceProvider);
                                      final notifier =
                                          ref.read(sizePriceProvider.notifier);

                                      if (list.length >= 3)
                                        return const SizedBox.shrink();

                                      return GestureDetector(
                                        onTap: () => notifier.add(),
                                        child: Image.asset(
                                          "assets/images/view2.png",
                                          height: 44.h,
                                          width: 44.w,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                40.horizontalSpace,
                // Right Column
                Padding(
                  padding: const EdgeInsets.only(bottom: 90),
                  child: Column(
                    children: [
                      40.verticalSpace,
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: AsyncWidget(
                  value: menuItemState,
                  data: (data) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Align(
                            //   alignment: Alignment.topRight,
                            //   child: IconButton(
                            //     onPressed: () {
                            //       context.pop();
                            //     },
                            //     icon: const Icon(Icons.cancel_outlined),
                            //     color: const Color(0xFF6A442E),
                            //   ),
                            // ),
                            // Center(
                            //   child: Text(
                            //     'Add Options',
                            //     style: Theme.of(context)
                            //         .textTheme
                            //         .headlineLarge
                            //         ?.copyWith(
                            //       fontWeight: FontWeight.bold,
                            //       color: const Color(0xFF461C10),
                            //     ),
                            //   ),
                            // ),
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            5.horizontalSpace,
                                            Text("Item Options",
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                )),
                                          ],
                                        ),
                                        5.verticalSpace,
                                        SizedBox(
                                          width: 250.w,
                                          child: GroupedDropdown(
                                            groupedOptions: groupedOptions,
                                            selectedValue:
                                            field.addonSizeId?.toString(),
                                            disabledAddonSizeIds: selectedIds,
                                            onChanged: (selected) {
                                              notifier.updateField(field.key,
                                                  addonSizeId: selected?.id,
                                                  addonId: selected?.addonId);
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
                                        controller: TextEditingController()),
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
                                            onPressed: () =>
                                                notifier.removeField(field.key),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              );
                            }),
                            30.verticalSpace,
                            // Align(
                            //   alignment: Alignment.centerLeft,
                            //   child: Container(
                            //     width: 200,
                            //     height: 50,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(4),
                            //       color: const Color(0xFF2C851F),
                            //     ),
                            //     child: InkWell(
                            //       onTap: notifier.addField,
                            //       child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.center,
                            //         children: [
                            //           const Icon(Icons.add, color: Colors.white),
                            //           8.horizontalSpace,
                            //           Text(
                            //             'Add Another',
                            //             style: TextStyle(
                            //               fontSize: 16.sp,
                            //               fontWeight: FontWeight.w500,
                            //               color: Colors.white,
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        // 216.verticalSpace,
                        // SizedBox(
                        //   width: 167.29,
                        //   height: 50,
                        //   child: ElevatedButton(
                        //     onPressed: () {
                        //
                        //       context.pop();
                        //     },
                        //     child: const Text('ADD'),
                        //   ),
                        // ),
                      ],
                    );
                  }),
            ),
            41.verticalSpace,
            // Addons Title
            if(items?.addons!=null&&items!.addons!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
              child: Text(
                'Addons Item Name*',
                style: TextStyle(
                  color: const Color(0xFF4C2F27),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Column(
                children: [
                  Wrap(
                    spacing: 20,
                    children: List.generate(
                        items?.items?.values.toList().length ?? 0, (index) {
                      final dropdownValues = items!.items!.entries
                          .map((entry) =>
                              AddonItemModel(id: entry.key, name: entry.value))
                          .toList();

                      if (selectedItems.length != dropdownValues.length) {
                        selectedItems =
                            List.filled(dropdownValues.length, null);
                      }
                      final selectedValue = selectedItems[index];
                      final isValidValue =
                          dropdownValues.contains(selectedValue);
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: AddonDropdownField<AddonItemModel>(
                          addonItems: items.addons ?? [],
                          key: UniqueKey(),
                          items: dropdownValues,
                          selectedItem: isValidValue ? selectedValue : null,
                          onChanged: (value) {
                            setState(() {
                              selectedItems[index] = value!;
                            });
                            final filteredItems = selectedItems
                                .whereType<AddonItemModel>()
                                .toList();
                            final addonItems = filteredItems
                                .map((model) =>
                                    AddonItem(addonItemId: int.parse(model.id)))
                                .toList();
                            menuItemParam.addAddonItem(addonItems);
                          },
                          itemToString: (item) => item.name,
                          getItemId: (item) => int.parse(item.id),
                        ),
                      );
                    }),
                  )
                ],
              ),
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
                          // ref.read(showMenuEditScreenProvider.notifier).state = false;
                        },
                        child: const Text('CANCEL')),
                  ),
                ),
                18.horizontalSpace,
                // SizedBox(
                //   width: 145.w,
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.white,
                //       foregroundColor: const Color(0xFF461C10),
                //       padding: const EdgeInsets.symmetric(
                //           horizontal: 20, vertical: 12),
                //     ),
                //     onPressed: () {
                //       ref.read(addMenuItemsNotifierProvider.notifier).addMenuItems();
                //
                //     },
                //     child: const Text('NEXT'),
                //   ),
                // ),
                SizedBox(
                  height: 47,
                  width: 145.w,
                  child: PrimaryButton(
                    isLoading:
                        ref.watch(addMenuItemsNotifierProvider).isLoading,
                    title: 'NEXT',
                    textColor: const Color(0xFF461C10),
                    backgroundColor: Colors.white,
                    onClick: () {
                      final selectedOptions = fields
                                .where(
                                    (f) => f.addonSizeId != null && f.price != null)
                                .map((f) => SelectedOption(
                              optionId: f.addonSizeId.toString(),
                              price: f.price!,
                            ))
                                .toList();
                      if(selectedOptions.isNotEmpty){
                        ref
                            .read(itemParamNotifierProvider.notifier)
                            .addSelectedOption(selectedOptions);
                      }

                      ref
                          .read(addMenuItemsNotifierProvider.notifier)
                          .addMenuItems();
                    },
                  ),
                )
              ],
            ),
            133.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class SelectManually extends StatefulWidget {
  const SelectManually({super.key});

  @override
  State<SelectManually> createState() => _SelectManuallyState();
}

class _SelectManuallyState extends State<SelectManually> {
  bool _showMenuScreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3F0),
      appBar: AppBar(
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
      body: _showMenuScreen
          ? MenuScreen(isEditmode: false)
          : Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 154, vertical: 50),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 800.sp,
                        height: 200.sp,
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
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          child: Text('Enter items manually'),
                        ),
                      ),
                      54.verticalSpace,
                      SizedBox(
                        width: 800.sp,
                        height: 200.sp,
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
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          child: Text('Enter items as spreadsheet'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
