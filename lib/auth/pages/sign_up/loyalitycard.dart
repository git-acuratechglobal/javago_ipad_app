import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/auth/model/stamp_suggestion.dart';
import 'package:java_go/auth/notifier/stamp_notifier/add_stamp_notifier.dart';
import 'package:java_go/auth/params/add_stamp_params.dart';
import 'package:java_go/config/async_widget.dart';
import 'package:java_go/config/common/button.dart';
import 'package:java_go/config/common/extensions.dart';
import 'package:java_go/config/widgets/app_text_field.dart';
import '../../../config/common/custom_dropdown.dart';
import '../../model/getStamp.dart';
import '../../notifier/stamp_notifier/get_stamp_notifier.dart';
import '../../notifier/stamp_notifier/stamp_suggestion.dart';

class LoyalityCardScreen extends ConsumerStatefulWidget {
  const LoyalityCardScreen({super.key, this.loyaltyStamp});
  final LoyaltyStamp? loyaltyStamp;
  @override
  ConsumerState<LoyalityCardScreen> createState() => _LoyalityCardScreenState();
}

class _LoyalityCardScreenState extends ConsumerState<LoyalityCardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.loyaltyStamp != null) {
        ref
            .read(addStampParamsNotifierProvider.notifier)
            .updateAddStampParam(widget.loyaltyStamp!);
      }
    });

    ref.listenManual(addStampNotifierProvider, (_, next) {
      switch (next) {
        case AsyncData<String?> data when data.value != null:
          context.showSnackBar(data.value!);
          ref.invalidate(getStampProvider);
          context.pop();
        case AsyncError error:
          context.showSnackBar(error.error.toString());
      }
    });
  }

  bool isChecked = false;
  ColorItem? selectedColor;
  List<String> noOfStamp = ['6', '7', '8', '9', '10', '11', '12'];
  @override
  Widget build(BuildContext context) {
    final stamp = ref.watch(getStampSuggestionProvider);
    final stampParam = ref.watch(addStampParamsNotifierProvider.notifier);
    final updatedStampData = ref.watch(addStampParamsNotifierProvider);
    return Scaffold(
      backgroundColor: Color(0xFFF5F3F0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFF5F3F0),
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
          'LOYALTY CARD',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF461C10),
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: AsyncWidget(
          value: stamp,
          data: (data) {
            final colorEntries = data.colors?.toColorItems();
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 33),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: PrimaryButton(
                      fixedSize: Size(200, 50),
                      isLoading: ref.watch(addStampNotifierProvider).isLoading,
                      onClick: () {
                        if (widget.loyaltyStamp != null) {
                          ref
                              .read(addStampNotifierProvider.notifier)
                              .updateStamp(widget.loyaltyStamp?.id ?? 0);
                        } else {
                          ref
                              .read(addStampNotifierProvider.notifier)
                              .addStamp();
                        }
                      },
                      title: "Save Changes",
                    ),
                  ),
                  49.verticalSpace,
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LoyalityText(title: 'Stamp Card Color*'),
                          16.verticalSpace,
                          SizedBox(
                            height: 54.h,
                            width: 520.w,
                            child: CustomDropdownWithImage<ColorItem>(
                              buttonDecoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Color(0xFF4C2F27))),
                              icon: SvgPicture.asset(
                                "assets/images/drop_down.svg",
                                height: 30,
                              ),
                              dropdownWidth: 520.w,
                              iconSize: 30,
                              hint: "Select Color",
                              value: updatedStampData.stampColor.isEmpty? selectedColor
                                  :
                                  colorEntries?.firstWhere(
                                        (e) => e.hexCode == updatedStampData.stampColor,

                                  ),
                              dropdownItems: colorEntries ?? [],
                              getLabel: (item) => item.hexCode, // hex code
                              getImageUrl: (item) => item.imageUrl, // image url
                              onChanged: (item) {
                                setState(() {
                                  selectedColor = item;
                                });
                                stampParam.updateStampColor(
                                    selectedColor?.hexCode ?? "");
                              },
                            ),
                          ),
                        ],
                      ),
                      77.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LoyalityText(title: 'No Of Total Stamp'),
                          16.verticalSpace,
                          SimpleCustomDropdown(
                            initialValue: updatedStampData.stampNo.toString(),
                            backgroundColor: Colors.white,
                            width: 520.w,
                            height: 55,
                            // validator: (value) =>
                            //     validator.validateCoffeeRoast(value),
                            hint: "No of Total Stamp",
                            items: noOfStamp,
                            onChanged: (String? value) {
                              stampParam.updateStampNo(int.parse(value!));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  60.verticalSpace,
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LoyalityText(title: 'Discount in % Or £ '),
                          16.verticalSpace,
                          SimpleCustomDropdown(
                            initialValue: updatedStampData.discountType,
                            dropdownWidth: 520.w,
                            backgroundColor: Colors.white,
                            width: 520.w,
                            height: 55,
                            // validator: (value) =>
                            //     validator.validateCoffeeRoast(value),
                            hint: "Select discount",
                            items: data.discountTypes ?? [],
                            onChanged: (String? value) {
                              print(value);
                              stampParam.updateDiscountType(value!);
                            },
                          ),
                        ],
                      ),
                      77.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LoyalityText(title: '% Or £XX Off Of Next Order '),
                          16.verticalSpace,
                          AppTextField(
                            inputType: TextInputType.number,
                            initialValue: updatedStampData.discount.toString(),
                            width: 520.w,
                            hint: "% Or £XX Off Of Next Order",
                            onChanged: (val) {
                              stampParam.updateDiscount(int.parse(val!));
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  60.verticalSpace,
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LoyalityText(title: 'Exclude Item'),
                          16.verticalSpace,
                          MultiSelectCustomDropdown(
                            initialSelectedIds: updatedStampData.excludeItems,
                            height: 55,
                            backgroundColor: Colors.white,
                            width: 520.w,
                            dropdownWidth: 520.w,
                            items: data.excludeItems?.entries
                                    .map((entry) => DropdownItem(
                                        id: entry.key, name: entry.value))
                                    .toList() ??
                                [],
                            onChanged: (List<String> value) {
                              stampParam.updateExcludeItems(value);
                            },
                          )
                        ],
                      ),
                      77.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LoyalityText(title: 'Minimum Order Value '),
                          16.verticalSpace,
                          AppTextField(
                            inputType:  TextInputType.number,
                            initialValue:
                                updatedStampData.minOrderValue.toString(),
                            width: 520.w,
                            hint: "Minimum Order Value",
                            onChanged: (val) {
                              stampParam
                                  .updateMinOrderValue(double.parse(val!));
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  60.verticalSpace,
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LoyalityText(
                              title: 'Categories discount applies to '),
                          16.verticalSpace,
                          MultiSelectCustomDropdown(
                            initialSelectedIds:
                                updatedStampData.stampApplicableToCategories,
                            height: 55,
                            backgroundColor: Colors.white,
                            width: 520.w,
                            dropdownWidth: 520.w,
                            items: data.stampApplicableTo
                                    ?.map((entry) => DropdownItem(
                                        id: entry.cafeMenuId.toString(),
                                        name: entry.menuName ?? ""))
                                    .toList() ??
                                [],
                            onChanged: (List<String> value) {
                              print(value);
                              stampParam
                                  .updateStampApplicableToCategories(value);
                            },
                          ),
                        ],
                      ),
                      77.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LoyalityText(
                              title: 'Stamp Expiration (Days) "optional" '),
                          16.verticalSpace,
                          AppTextField(
                              inputType: TextInputType.number,
                              initialValue: updatedStampData.expireIn ?? "",
                              width: 520.w,
                              hint: "Stamp Expiration")
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class LoyalityText extends StatefulWidget {
  final String title;
  const LoyalityText({super.key, required this.title});

  @override
  State<LoyalityText> createState() => _LoyalityTextState();
}

class _LoyalityTextState extends State<LoyalityText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      style: TextStyle(
        color: const Color(0xFF4C2F27),
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
