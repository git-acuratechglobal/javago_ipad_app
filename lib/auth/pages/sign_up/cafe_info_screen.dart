import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/auth/notifier/cafe_data_notifier/cafe_data_notifier.dart';
import 'package:java_go/auth/pages/sign_up/reviewscreen.dart';
import 'package:java_go/auth/params/cafe_info_params.dart';

import 'package:java_go/config/common/widgets.dart';
import 'package:java_go/config/validator.dart';
import 'package:java_go/config/widgets/app_text_field.dart';

import '../../../config/async_widget.dart';
import '../../../config/common/button.dart';
import '../../../config/common/custom_dropdown.dart';
import '../../../config/common/custom_text_feild.dart';
import '../../../config/common/image_form_widget.dart';
import '../../../config/widgets/country_dropdown.dart';
import '../../model/cafe_time_and_category.dart';
import '../../model/cafetime_model.dart';
import '../../notifier/auth_notifier.dart';

class CafeInfoScreen extends ConsumerStatefulWidget {
  final bool isEditmode;
  const CafeInfoScreen({
    super.key,
    required this.isEditmode,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CafeInfoScreenState();
}

class _CafeInfoScreenState extends ConsumerState<CafeInfoScreen> {
  final TextEditingController coffeeOriginController = TextEditingController();
  final TextEditingController coffeeRoastController = TextEditingController();
  TextEditingController SpecialtyController = TextEditingController();
  final _fkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cafeInfoNotifier = ref.read(cafeInfoParamsNotifierProvider.notifier);
    final filters = ref.watch(getCafeTimeAndCategoryProvider);
    final validator = ref.watch(validatorsProvider);
    final cafeInfo = ref.watch(getCafeInfoProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F3F0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: widget.isEditmode
            ? InkWell(
                onTap: () {
                  context.pop();
                },
                child: Image.asset(
                  'assets/images/ic_left_arrow.png',
                  color: Color(0xFF461C10),
                  height: 55.h,
                  width: 55.w,
                ))
            : null,
        backgroundColor: Color(0xFFF5F3F0),
        title: Text(
          'Sign up',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Color(0xFF461C10),
              ),
        ),
        centerTitle: true,
      ),
      body: AsyncWidget(
          value: cafeInfo,
          data: (cafeData) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _fkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    24.verticalSpace,
                    Row(
                      children: [
                        AppTextField(
                          validator: (val) => validator.validateName(val!),
                          initialValue: cafeData.cafeName,
                          label: 'Cafe Name',
                          hint: "Enter cafe name",
                          onChanged: (val) {
                            cafeInfoNotifier.updateName(val);
                          },
                        ),
                        Spacer(),
                        if (widget.isEditmode)
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Undo',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        23.horizontalSpace,
                        if (widget.isEditmode)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 42),
                            child: InkWell(
                                onTap: () {},
                                child: EditContainer(title: 'Save Changes')),
                          )
                      ],
                    ),
                    18.verticalSpace,
                    Row(
                      children: [
                        ImagePickerForm(
                          image: cafeData.bannerImage,
                          validator: (value) =>
                              validator.validateImage(value?.path),
                          autovalidate: true,
                          context: context,
                          onSaved: (val) {
                            cafeInfoNotifier.updateImage(val!.path);
                          },
                        ),
                        40.horizontalSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppTextField(
                                    validator: (val) =>
                                        validator.validatePhone(val!),
                                    width: 200,
                                    initialValue: cafeData.phone,
                                    label: 'Phone Number',
                                    hint: "Enter cafe number",
                                    onChanged: (val) {
                                      cafeInfoNotifier.updatePhone(val);
                                    },
                                  ),
                                  AppTextField(
                                    validator: (val) =>
                                        validator.validateAddress(val!),
                                    width: 270,
                                    initialValue: cafeData.address,
                                    maxLines: 1,
                                    label: 'Address',
                                    hint: "Enter your address",
                                    onChanged: (val) {
                                      cafeInfoNotifier.updateAddress(val);
                                    },
                                  ),
                                  AppTextField(
                                    validator: (val) =>
                                        validator.validateZipCode(val!),
                                    inputType: TextInputType.number,
                                    width: 150,
                                    initialValue: cafeData.postcode,
                                    label: 'ZipCode',
                                    hint: "Enter your zipcode",
                                    onChanged: (val) {
                                      cafeInfoNotifier.updatePostcode(val);
                                    },
                                  ),
                                ],
                              ),
                              57.verticalSpace,
                              Text(
                                'Categories',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                        color: Color(0xFF694233),
                                        fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 150,
                                width: 300,
                                child: AsyncWidget(
                                    value: filters,
                                    data: (data) {
                                      // List<CafeFilter> selectedItems = [];
                                      // final List<int> selectedIds = (cafeData
                                      //             .cafeFilter ??
                                      //         '')
                                      //     .split(',')
                                      //     .map((e) => int.tryParse(e.trim()))
                                      //     .whereType<int>()
                                      //     .toList();
                                      // if (selectedIds.isEmpty) {
                                      //   selectedItems = data.cafeFilters!
                                      //       .where((filter) =>
                                      //           selectedIds.contains(filter.id))
                                      //       .toList();
                                      // }
                                      return Wrap(children: [
                                        CheckboxFormField(
                                          validator: (value) =>
                                              validator.validateCheckBox(value),
                                          items: data.cafeFilters ?? [],
                                          onSelectionChanged: (val) {
                                            cafeInfoNotifier
                                                .updateCategories(val);
                                          },
                                          initialValue: [],
                                        )
                                      ]);
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    40.verticalSpace,
                    AppTextField(
                      validator: (val) => validator.validateBio(val!),
                      initialValue: cafeData.bio,
                      width: 975,
                      label: "Bio",
                      hint: "Cafe bio",
                      onChanged: (val) {
                        cafeInfoNotifier.updateBio(val);
                      },
                    ),
                    70.verticalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cafe Hours',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: Color(0xFF694233),
                                  fontWeight: FontWeight.w600),
                        ),
                        //   9.verticalSpace,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 2,
                                child: AsyncWidget(
                                    value: filters,
                                    data: (data) {
                                      return SizedBox(
                                        height: 380.h,
                                        child: CafeHoursScreen(
                                          initialCafeTime:cafeData.timing?? data.cafeTimings,
                                          onTimeChanged:
                                              (List<CafeDayTime> cafeTime) {},
                                        ),
                                      );
                                    })),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Coffee Origin',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                          color: Color(0xFF694233),
                                          fontWeight: FontWeight.w600),
                                ),
                                9.verticalSpace,
                                CustomDropdownButton(
                                    validator: (val) =>
                                        validator.validateCoffeeOrigin(val),
                                    customBtn: IgnorePointer(
                                      child: CustomTextField(
                                        controller: coffeeOriginController,
                                        readOnly: true,
                                        hintText: cafeData
                                                .cafeManagement?.coffeeOrigin ??
                                            "Coffee Origin",
                                        suffixIcon:
                                            const Icon(Icons.arrow_drop_down),
                                      ),
                                    ),
                                    hint: "Coffee Origin",
                                    value: coffeeOriginController.text.isEmpty
                                        ? null
                                        : coffeeOriginController.text,
                                    dropdownItems: coffeeOriginTypes,
                                    onChanged: (value) {
                                      if (value != null) {
                                        coffeeOriginController.text = value;
                                        cafeInfoNotifier
                                            .updateCoffeeOrigin(value);
                                      }
                                    }),
                                68.verticalSpace,
                                Text(
                                  'Country Of Origin',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                          color: Color(0xFF694233),
                                          fontWeight: FontWeight.w600),
                                ),
                                9.verticalSpace,
                                SizedBox(
                                    width: 252,
                                    child: AsyncWidget(
                                        value: ref.watch(countriesListProvider),
                                        data: (data) {
                                          return CountrySearchDropdown(
                                            validator: (value) => validator
                                                .validateCountryOrigin(value!),
                                            initialSelectedCountry: cafeData
                                                .cafeManagement
                                                ?.coffeeOriginCountry,
                                            countries: data,
                                            onCountrySelected:
                                                (String selectedCountry) {
                                              cafeInfoNotifier
                                                  .updateCoffeeOriginCountry(
                                                      selectedCountry);
                                            },
                                          );
                                        })),
                              ],
                            ),
                            80.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Coffee Roast',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                          color: Color(0xFF694233),
                                          fontWeight: FontWeight.w600),
                                ),
                                9.verticalSpace,
                                CustomDropdownButton(
                                    validator: (value) =>
                                        validator.validateCoffeeRoast(value),
                                    customBtn: IgnorePointer(
                                      child: CustomTextField(
                                        controller: coffeeRoastController,
                                        readOnly: true,
                                        hintText: "Coffee Roast",
                                        suffixIcon:
                                            const Icon(Icons.arrow_drop_down),
                                      ),
                                    ),
                                    hint:
                                        cafeData.cafeManagement?.coffeeRoast ??
                                            "Coffee Roast",
                                    value: coffeeRoastController.text.isEmpty
                                        ? null
                                        : coffeeRoastController.text,
                                    dropdownItems: coffeeRoastTypes,
                                    onChanged: (value) {
                                      if (value != null) {
                                        coffeeRoastController.text = value;
                                        cafeInfoNotifier
                                            .updateCoffeeRoast(value);
                                      }
                                    }),
                                66.verticalSpace,
                                Text(
                                  'Specialty Coffee',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                          color: Color(0xFF694233),
                                          fontWeight: FontWeight.w600),
                                ),
                                9.verticalSpace,
                                CustomDropdownButton(
                                  key: UniqueKey(),
                                  validator: (value) =>
                                      validator.validateSpecialityCoffee(value),
                                  customBtn: IgnorePointer(
                                    child: CustomTextField(
                                      controller: SpecialtyController,
                                      readOnly: true,
                                      hintText:
                                      cafeData.cafeManagement
                                                  ?.speciallityCoffee !=
                                              null
                                          ? (cafeData.cafeManagement!
                                                      .speciallityCoffee ==
                                                  1
                                              ? "Yes"
                                              : "No")
                                          :
                                      "Select speciality",
                                      suffixIcon:
                                          const Icon(Icons.arrow_drop_down),
                                    ),
                                  ),
                                  hint: "Select speciality",
                                  value: SpecialtyController.text.isEmpty
                                      ? null
                                      : SpecialtyController.text,
                                  dropdownItems: items,
                                  onChanged: (value) {
                                    if (value != null) {
                                      setState(() {
                                        SpecialtyController.text = value;
                                        if (value == "Yes") {
                                          cafeInfoNotifier
                                              .updateSpecialityCoffee(1);
                                        } else {
                                          cafeInfoNotifier
                                              .updateSpecialityCoffee(0);
                                        }
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                            150.horizontalSpace,
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 70, right: 40),
        child: SizedBox(
          width: 55,
          height: 53,
          child: PrimaryButton(
            isLoading: ref.watch(authNotifierProvider).isLoading,
            backgroundColor: const Color(0xFFC0987C),
            onClick: () {
              if (_fkey.currentState!.validate()) {
                _fkey.currentState!.save();
                ref.read(authNotifierProvider.notifier).addCafeInformation();
              }
            },
            isIconButton: true,
          ),
        ),
      ),
    );
  }

  List<String> items = ['Yes', 'No'];
  List<String> coffeeOriginTypes = [
    'Single Origin',
    'Blend',
    'Microlot',
    'Estate',
    'Regional',
    'Cooperative',
    'Varietal Specific',
    'Experimental Lot',
  ];
  List<String> coffeeRoastTypes = [
    'Light Roast',
    'City Roast',
    'Medium Roast',
    'Full City Roast',
    'Medium-Dark Roast',
    'Dark Roast',
    'French Roast',
    'Italian Roast',
  ];
}

class CheckboxFormField extends FormField<List<CafeFilter>> {
  CheckboxFormField({
    Key? key,
    required List<CafeFilter> items,
    required Function(String) onSelectionChanged,
    FormFieldValidator<List<CafeFilter>>? validator,
    List<CafeFilter>? initialValue,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
  }) : super(
          key: key,
          initialValue: initialValue ?? [],
          validator: validator,
          autovalidateMode: autovalidateMode,
          builder: (FormFieldState<List<CafeFilter>> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.builder(
                  itemCount: items.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 5,
                    childAspectRatio: 4.5,
                  ),
                  itemBuilder: (context, index) {
                    final category = items[index];
                    final isChecked = state.value!.contains(category);

                    return Row(
                      children: [
                        Checkbox(
                          key: UniqueKey(),
                          activeColor: const Color(0xFF694233),
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (value) {
                            final selected =
                                List<CafeFilter>.from(state.value!);
                            final isAll = category.name?.toLowerCase() == 'all';
                            final allExceptAll = items
                                .where((e) => e.name?.toLowerCase() != 'all')
                                .toList();
                            final allItem = items.firstWhere(
                                (e) => e.name?.toLowerCase() == 'all');

                            if (isAll) {
                              if (value == true) {
                                selected
                                  ..clear()
                                  ..addAll(items);
                              } else {
                                selected.clear();
                              }
                            } else {
                              if (value == true) {
                                selected
                                  ..removeWhere(
                                      (e) => e.name?.toLowerCase() == 'all')
                                  ..add(category);
                                final selectedExceptAll = selected
                                    .where(
                                        (e) => e.name?.toLowerCase() != 'all')
                                    .toList();
                                if (selectedExceptAll.length ==
                                    allExceptAll.length) {
                                  selected.add(allItem);
                                }
                              } else {
                                selected.remove(category);
                                selected.removeWhere(
                                    (e) => e.name?.toLowerCase() == 'all');
                              }
                            }

                            state.didChange(selected);
                            onSelectionChanged(
                              selected.map((e) => e.id.toString()).join(","),
                            );
                          },
                        ),
                        Text(
                          category.name ?? "",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    );
                  },
                ),
                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, left: 8),
                    child: Text(
                      state.errorText!,
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
              ],
            );
          },
        );
}

class CustomContainer extends StatelessWidget {
  final String label;
  final double containerWidth;
  final double containerHeight;
  final Color borderColor;

  const CustomContainer({
    Key? key,
    required this.label,
    required this.containerWidth,
    required this.containerHeight,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: borderColor),
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
