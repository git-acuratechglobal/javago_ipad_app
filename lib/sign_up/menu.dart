import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/config/common/addoptions.dart';
import 'package:java_go/config/common/cache_network_image.dart';
import 'package:java_go/config/common/custom_dropdown.dart';
import 'package:java_go/config/common/custom_text_feild.dart';
import 'package:java_go/home/model/get_menu_items.dart';
import 'package:java_go/home/notifier/menu_notifier.dart';
import 'package:java_go/home/notifiers/menu_items.dart';

class MenuScreen extends ConsumerStatefulWidget {
  const MenuScreen({super.key, required this.isEditmode, this.fromAdd = false});
  final bool isEditmode;
  final bool? fromAdd;

  @override
  ConsumerState<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends ConsumerState<MenuScreen> {
  final List<String> itemSizes = ['Small', 'Medium', 'Large'];

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
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Addoptions(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  PreDefinedItem? selectedItem;
  Set<String> selectedAddonItemsSet = {};

  String? selectedSize;
  String? selectedPrice;
  String? selectedAddonItem;
  String? selectedAddonItems;
  String? selectedAddonItemss;
  @override
  Widget build(BuildContext context) {
    final menuItemState = ref.watch(menuItemsProvider);
    final TextEditingController itemCategoryController = TextEditingController();
    final TextEditingController itemSizeController = TextEditingController();
    final TextEditingController addonsItemNameController = TextEditingController();
    final TextEditingController itemTypeController = TextEditingController();
    final TextEditingController itemDescriptionController = TextEditingController();

    final items = menuItemState.value?.data;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3F0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF5F3F0),
        // leading: widget.isEditmode
        //     ? InkWell(
        //         onTap: () => context.pop(),
        //         child: Image.asset(
        //           'assets/images/ic_left_arrow.png',
        //           color: const Color(0xFF461C10),
        //           height: 55.h,
        //           width: 55.w,
        //         ),
        //       )
        //     : null,
        // title: widget.isEditmode
        //     ? Text(
        //         widget.fromAdd! ? "Add Item" : 'Menu',
        //         style: const TextStyle(
        //           color: Color(0xFF461C10),
        //           fontSize: 32,
        //           fontFamily: 'Poppins',
        //           fontWeight: FontWeight.w600,
        //         ),
        //       )
        //     : null,
        // centerTitle: true,
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
                      customBtn: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select Item Icon*',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          3.verticalSpace,
                          Container(
                            width: 240.w,
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF4C2F27)),
                              borderRadius: BorderRadius.circular(6.r),
                              color: Colors.transparent,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 28,
                                      height: 28,
                                      child: (selectedItem?.itemImage == null ||
                                              selectedItem!.itemImage!.isEmpty)
                                          ? null
                                          : NetworkImageWidget(
                                              imageUrl: selectedItem!.itemImage!,
                                              fit: BoxFit.cover,
                                              loadingWidgetSize: 15,
                                            ),
                                    ),
                                    15.horizontalSpace,
                                    Text(
                                      selectedItem?.itemName ?? "Select Category",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF4C2F27),
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Color(0xFF4C2F27),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      hint: "Select Name",
                      dropdownItems: items?.preDefinedItem ?? [],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            selectedItem = value;
                            print(value);
                          });
                        }
                      },
                      getLabel: (item) => item.itemName ?? "",
                      getImageUrl: (item) => item.itemImage ?? "",
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
                        value: itemTypeController.text.isEmpty ? null : itemTypeController.text,
                        dropdownItems: items?.itemType?.values.toList() ?? [],
                        onChanged: (value) {
                          if (value != null) {
                            itemTypeController.text = value;
                          }
                        }),
                    24.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 40),
                      child: InkWell(
                        onTap: () => _showDialog(context),
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
                    )
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
                              controller: TextEditingController(),
                              labelText: 'Item Name *',
                            ),
                            140.horizontalSpace,
                            CustomDropdownButton(
                                customBtn: IgnorePointer(
                                  child: CustomTextField(
                                    labelText: 'Select Category*',
                                    controller: itemCategoryController,
                                    readOnly: true,
                                    hintText: "Select Category",
                                    suffixIcon: const Icon(Icons.arrow_drop_down),
                                  ),
                                ),
                                hint: "Select Category",
                                value: itemCategoryController.text.isEmpty
                                    ? null
                                    : itemCategoryController.text,
                                dropdownItems: items?.itemCategory?.values.toList() ?? [],
                                onChanged: (value) {
                                  if (value != null) {
                                    itemCategoryController.text = value;
                                  }
                                }),
                          ],
                        ),
                        40.verticalSpace,
                        Consumer(
                          builder: (context, ref, _) {
                            final list = ref.watch(sizePriceProvider);
                            final notifier = ref.read(sizePriceProvider.notifier);

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
                                  final allSizes = items?.itemSize?.values.toList() ?? [];
                                  final availableSizes = allSizes.where((size) {
                                    return !selectedSizes.contains(size) || size == item.size;
                                  }).toList();
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 10, bottom: 10, right: 10),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: CustomDropdownButton(
                                            customBtn: IgnorePointer(
                                              child: CustomTextField(
                                                labelText: 'Size *',
                                                controller: TextEditingController(text: item.size),
                                                readOnly: true,
                                                hintText: "Select Size",
                                                suffixIcon: const Icon(Icons.arrow_drop_down),
                                              ),
                                            ),
                                            hint: "Select size",
                                            value: item.size.isEmpty ? null : item.size,
                                            dropdownItems: availableSizes,
                                            onChanged: (value) {
                                              if (value != null) {
                                                notifier.updateSize(index, value);
                                              }
                                            },
                                          ),
                                        ),
                                        140.horizontalSpace,
                                        Flexible(
                                          child: CustomTextField(
                                            labelText: 'Price *',
                                            controller: TextEditingController(text: item.price)
                                              ..selection = TextSelection.collapsed(
                                                  offset: item.price.length),
                                            onChanged: (value) =>
                                                notifier.updatePrice(index, value),
                                          ),
                                        ),
                                        12.horizontalSpace,
                                        if (list.length > 1 && index != 0)
                                          GestureDetector(
                                            onTap: () => notifier.remove(index),
                                            child: Column(
                                              children: [
                                                22.verticalSpace,
                                                Image.asset("assets/images/view.png",
                                                    height: 33.h, width: 33.w),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  );
                                }),
                                Padding(
                                  padding: const EdgeInsets.only(top: 44.0, left: 0, right: 755),
                                  child: Consumer(
                                    builder: (context, ref, _) {
                                      final list = ref.watch(sizePriceProvider);
                                      final notifier = ref.read(sizePriceProvider.notifier);

                                      if (list.length >= 3) return const SizedBox.shrink();

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

            41.verticalSpace,
            // Addons Title
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
                  Row(spacing: 100, children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDropdownButton(
                          customBtn: IgnorePointer(
                            child: Container(
                                width: 240.w,
                                height: 50.h,
                                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFF4C2F27)),
                                  borderRadius: BorderRadius.circular(6.r),
                                  color: Colors.transparent,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(selectedAddonItem ?? ""),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: Color(0xFF4C2F27),
                                    ),
                                  ],
                                )),
                          ),
                          hint: "Select Name",
                          value: selectedAddonItem,
                          dropdownItems: items?.items?.values.toList() ?? [],
                          onChanged: (value) {
                            if (value != null) {
                              addonsItemNameController.text = value;
                              print(selectedAddonItem);
                              setState(() {
                                selectedAddonItem = value;
                              });
                            }
                          },
                        ),
                        15.verticalSpace,
                        Text(
                          'Size & Price (£)',
                          style: TextStyle(
                              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        15.verticalSpace,
                        Text(
                          "${selectedSize ?? 'Select a size'} : ${selectedPrice ?? '0.00'}",
                          style: TextStyle(
                              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDropdownButton(
                            customBtn: IgnorePointer(
                              child: Container(
                                  width: 240.w,
                                  height: 50.h,
                                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xFF4C2F27)),
                                    borderRadius: BorderRadius.circular(6.r),
                                    color: Colors.transparent,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(selectedAddonItems ?? ""),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: Color(0xFF4C2F27),
                                      ),
                                    ],
                                  )),
                            ),
                            hint: "Select Name",
                            value: selectedAddonItems,
                            dropdownItems: items?.items?.values.toList() ?? [],
                            onChanged: (value) {
                              if (value != null) {
                                addonsItemNameController.text = value;
                                print(selectedAddonItems);
                                final selectedKey = items?.items?.entries
                                    .firstWhere(
                                      (entry) => entry.value == value,
                                    )
                                    .key;

                                if (selectedKey != null && selectedKey.isNotEmpty) {
                                  final selectedItem = items?.addons?.firstWhere(
                                    (addon) => addon.itemId == selectedKey,
                                  );

                                  if (selectedItem != null) {
                                    setState(() {
                                      selectedAddonItem = value;
                                      selectedSize = selectedItem.sizeName;
                                      selectedPrice = selectedItem.itemSizePrice;
                                    });
                                  }
                                }
                              }
                            }),
                        15.verticalSpace,
                        Text(
                          'Size & Price (£)',
                          style: TextStyle(
                              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        15.verticalSpace,
                        Text(
                          "${selectedSize ?? 'Select a size'} : ${selectedPrice ?? '0.00'}",
                          style: TextStyle(
                              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDropdownButton(
                          customBtn: IgnorePointer(
                            child: Container(
                                width: 240.w,
                                height: 50.h,
                                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFF4C2F27)),
                                  borderRadius: BorderRadius.circular(6.r),
                                  color: Colors.transparent,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(selectedAddonItemss ?? ""),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: Color(0xFF4C2F27),
                                    ),
                                  ],
                                )),
                          ),
                          hint: "Select Name",
                          value: selectedAddonItemss,
                          dropdownItems: items?.items?.values.toList() ?? [],
                          onChanged: (value) {
                            if (value != null) {
                              addonsItemNameController.text = value;
                              print(selectedAddonItemss);
                              setState(() {
                                selectedAddonItemss = value;
                              });
                            }
                          },
                        ),
                        15.verticalSpace,
                        Text(
                          'Size & Price (£)',
                          style: TextStyle(
                              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        15.verticalSpace,
                        Text(
                          "${selectedSize ?? 'Select a size'} : ${selectedPrice ?? '0.00'}",
                          style: TextStyle(
                              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ]),
                ],
              ),
            ),

            35.verticalSpace,
            // Buttons
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
                SizedBox(
                  width: 145.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF461C10),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    onPressed: () {},
                    child: const Text('NEXT'),
                  ),
                ),
              ],
            ),
            133.verticalSpace,
          ],
        ),
      ),
    );
  }
}

////

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
                padding: const EdgeInsets.symmetric(horizontal: 154, vertical: 50),
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
//  Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CustomDropdownButton(
//                           customBtn: IgnorePointer(
//                             child: Container(
//                                 width: 240.w,
//                                 height: 50.h,
//                                 padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
//                                 decoration: BoxDecoration(
//                                   border: Border.all(color: Color(0xFF4C2F27)),
//                                   borderRadius: BorderRadius.circular(6.r),
//                                   color: Colors.transparent,
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(selectedAddonItem ?? ""),
//                                     Icon(
//                                       Icons.arrow_drop_down,
//                                       color: Color(0xFF4C2F27),
//                                     ),
//                                   ],
//                                 )),

//                             // CustomTextField(
//                             //   controller:   addonsItemNameController,
//                             //   readOnly: true,
//                             //   hintText: "Item Names",
//                             //   suffixIcon: const Icon(Icons.arrow_drop_down),
//                             // ),
//                           ),
//                           hint: "Select Name",
//                           value: selectedAddonItem,
//                           dropdownItems: items?.items?.values.toList() ?? [],
//                           onChanged: (value) {
//                             if (value != null) {
//                               addonsItemNameController.text = value;
//                               print(selectedAddonItem);
//                               // var selectedItem = items!.addons!.firstWhere(
//                               //     (addon) => addon.itemId == value,
//                               //    );

//                               setState(() {
//                                 selectedAddonItem = value;
//                                 // selectedSize = selectedItem.sizeName;
//                                 // selectedPrice = selectedItem.itemSizePrice;
//                               });
//                             }
//                           },
//                         ),
//                         15.verticalSpace,
//                         Text(
//                           'Size & Price (£)',
//                           style: TextStyle(
//                               color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                         15.verticalSpace,
//                         Text(
//                           "${selectedSize ?? 'Select a size'} : ${selectedPrice ?? '0.00'}",
//                           style: TextStyle(
//                               color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
  // Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       CustomDropdownButton(
  //                         customBtn: IgnorePointer(
  //                           child: Container(
  //                               width: 240.w,
  //                               height: 50.h,
  //                               padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
  //                               decoration: BoxDecoration(
  //                                 border: Border.all(color: Color(0xFF4C2F27)),
  //                                 borderRadius: BorderRadius.circular(6.r),
  //                                 color: Colors.transparent,
  //                               ),
  //                               child: Row(
  //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                                 children: [
  //                                   Text(selectedAddonItemss ?? ""),
  //                                   Icon(
  //                                     Icons.arrow_drop_down,
  //                                     color: Color(0xFF4C2F27),
  //                                   ),
  //                                 ],
  //                               )),
  //                         ),
  //                         hint: "Select Name",
  //                         value: selectedAddonItemss,
  //                         dropdownItems: items?.items?.values.toList() ?? [],
  //                         onChanged: (value) {
  //                           if (value != null) {
  //                             addonsItemNameController.text = value;
  //                             print(selectedAddonItemss);
  //                            final selectedKey = items?.items?.entries
  //                                   .firstWhere(
  //                                     (entry) => entry.value == value,
  //                                   )
  //                                   .key;

  //                               if (selectedKey != null && selectedKey.isNotEmpty) {
  //                                 final selectedItem = items?.addons?.firstWhere(
  //                                   (addon) => addon.itemId == selectedKey,
  //                                 );

  //                                 if (selectedItem != null) {
  //                                   setState(() {
  //                                     selectedAddonItem = value;
  //                                     selectedItems = selectedItem;
  //                                   });
  //                                 }
  //                               }
  //                             }
  //                           }),
  //                       15.verticalSpace,
  //                       Text(
  //                         'Size & Price (£)',
  //                         style: TextStyle(
  //                             color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
  //                       ),
  //                       15.verticalSpace,
  //                       Text(
  //                         "${selectedItems?.sizeName ?? 'Select a size'} : ${selectedItems?.itemSizePrice ?? '0.00'}",
  //                         style: TextStyle(
  //                             color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
  //                       ),
  //                     ],
  //                   ),
  //                 ]),
  //               ],
  //             ),