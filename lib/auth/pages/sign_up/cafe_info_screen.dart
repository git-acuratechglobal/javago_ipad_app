import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/auth/notifier/cafe_data_notifier/cafe_data_notifier.dart';
import 'package:java_go/auth/params/cafe_info_params.dart';
import 'package:java_go/config/common/widgets.dart';
import 'package:java_go/config/validator.dart';
import 'package:java_go/config/widgets/app_text_field.dart';
import 'package:java_go/home/notifier/cafe_info_notifier/cafe_info_notifier.dart';
import '../../../config/async_widget.dart';
import '../../../config/common/button.dart';
import '../../../config/common/custom_dropdown.dart';
import '../../../config/common/image_form_widget.dart';
import '../../../config/widgets/country_dropdown.dart';
import '../../model/cafe_time_and_category.dart';
import '../../model/cafetime_model.dart';

class CafeInfoScreen extends ConsumerStatefulWidget {
  final bool isFromSignUp;
  const CafeInfoScreen({
    super.key,
    required this.isFromSignUp,
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
        leading: !widget.isFromSignUp
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
          widget.isFromSignUp ? 'Sign up' : 'Edit Profile',
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
                          initialValue: cafeData?.cafeName,
                          label: 'Cafe Name',
                          hint: "Enter cafe name",
                          onSaved: (val) {
                            if (val != null) {
                              cafeInfoNotifier.updateName(val);
                            }
                          },
                        ),
                        Spacer(),
                        23.horizontalSpace,
                        if (!widget.isFromSignUp)
                          SizedBox(
                            height: 50,
                            width: 200,
                            child: PrimaryButton(
                              title: "Save Changes",
                              isLoading:
                                  ref.watch(cafeInfoNotifierProvider).isLoading,
                              backgroundColor: const Color(0xFFC0987C),
                              onClick: () {
                                if (_fkey.currentState!.validate()) {
                                  _fkey.currentState!.save();
                                  ref
                                      .read(cafeInfoNotifierProvider.notifier)
                                      .updateCafeInformation();
                                }
                              },
                            ),
                          )
                      ],
                    ),
                    18.verticalSpace,
                    Row(
                      children: [
                        ImagePickerForm(
                          image: cafeData?.bannerImage,
                          validator: (value) => cafeData?.bannerImage == null
                              ? validator.validateImage(value?.path)
                              : null,
                          autovalidate: true,
                          context: context,
                          onSaved: (val) {
                            if (val != null) {
                              cafeInfoNotifier.updateImage(val.path);
                            }
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
                                    inputType: TextInputType.phone,
                                    validator: (val) =>
                                        validator.validatePhone(val!),
                                    width: 160,
                                    initialValue: cafeData?.phone,
                                    label: 'Phone Number',
                                    hint: "Enter cafe number",
                                    onSaved: (val) {
                                      if (val != null) {
                                        cafeInfoNotifier.updatePhone(val);
                                      }
                                    },
                                  ),
                                  AppTextField(
                                    validator: (val) =>
                                        validator.validateAddress(val!),
                                    width: 240,
                                    initialValue: cafeData?.address,
                                    maxLines: 1,
                                    label: 'Address Line 1',
                                    hint: "Enter your address line1",
                                    onSaved: (val) {
                                      if (val != null) {
                                        cafeInfoNotifier.updateAddress(val);
                                      }
                                    },
                                  ),
                                  AppTextField(
                                    validator: (val) =>
                                        validator.validateAddress(val!),
                                    width: 100,
                                    initialValue: cafeData?.city,
                                    maxLines: 1,
                                    label: 'City',
                                    hint: "Enter your city",
                                    onSaved: (val) {
                                      if (val != null) {
                                        cafeInfoNotifier.updateCity(val);
                                      }
                                    },
                                  ),
                                  AppTextField(
                                    validator: (val) =>
                                        validator.validateZipCode(val!),
                                    inputType: TextInputType.phone,
                                    width: 150,
                                    initialValue: cafeData?.postcode,
                                    label: 'Postcode',
                                    hint: "Enter your postcode",
                                    onSaved: (val) {
                                      if (val != null) {
                                        cafeInfoNotifier.updatePostcode(val);
                                      }
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
                                height: 200,
                                width: 300,
                                child: AsyncWidget(
                                    onRetry: () => ref.refresh(
                                        getCafeTimeAndCategoryProvider),
                                    value: filters,
                                    data: (data) {
                                      List<CafeFilter> selectedItems = [];
                                      final List<int> selectedIds = (cafeData
                                                  ?.cafeFilter ??
                                              '')
                                          .split(',')
                                          .map((e) => int.tryParse(e.trim()))
                                          .whereType<int>()
                                          .toList();
                                      if (selectedIds.isNotEmpty) {
                                        selectedItems = data.cafeFilters!
                                            .where((filter) =>
                                                selectedIds.contains(filter.id))
                                            .toList();
                                      }
                                      return Wrap(children: [
                                        CheckboxFormField(
                                          validator: (value) =>
                                              validator.validateCheckBox(value),
                                          items: data.cafeFilters
                                                  ?.where((e) =>
                                                      e.name != "All" &&
                                                      e.name != "Favorites" &&
                                                      e.name != "Vegetarian ")
                                                  .toList() ??
                                              [],
                                          onSelectionChanged: (val) {
                                            cafeInfoNotifier
                                                .updateCategories(val);
                                          },
                                          initialValue: selectedItems,
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
                      initialValue: cafeData?.bio,
                      width: 975,
                      label: "Bio",
                      hint: "Cafe bio",
                      onSaved: (val) {
                        if (val != null) {
                          cafeInfoNotifier.updateBio(val);
                        }
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
                                child: AsyncWidget(
                                    onRetry: () => ref.refresh(
                                        getCafeTimeAndCategoryProvider),
                                    value: filters,
                                    data: (data) {
                                      return CafeHoursScreen(
                                        initialCafeTime: cafeData?.timing ??
                                            data.cafeTimings,
                                        onTimeChanged:
                                            (List<CafeDayTime> cafeTime) {
                                          print(cafeTime);
                                          if (cafeTime.isNotEmpty) {
                                            cafeInfoNotifier
                                                .updateCafeHours(cafeTime);
                                          }
                                        },
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
                                SimpleCustomDropdown(
                                    height: 55,
                                    borderRadius: 8,
                                    hint: "Coffee Origin",
                                    validator: (val) =>
                                        validator.validateCoffeeOrigin(val),
                                    initialValue:
                                        cafeData?.cafeManagement?.coffeeOrigin,
                                    items: coffeeOriginTypes.toSet().toList(),
                                    onChanged: (val) {
                                      cafeInfoNotifier.updateCoffeeOrigin(val!);
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
                                    child: CountrySearchDropdown(
                                      validator: (value) => validator
                                          .validateCountryOrigin(value!),
                                      initialSelectedCountry: cafeData
                                          ?.cafeManagement?.coffeeOriginCountry,
                                      countries: originCountries,
                                      onCountrySelected:
                                          (String selectedCountry) {
                                        cafeInfoNotifier
                                            .updateCoffeeOriginCountry(
                                                selectedCountry);
                                      },
                                    )),
                              ],
                            ),
                            80.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                SizedBox(
                                  width: 252,
                                  child: CountrySearchDropdown(
                                    hintText: "Coffee Roast",
                                    validator: (value) =>
                                        validator.validateCoffeeRoast(value),
                                    onCountrySelected: (String value) {
                                      cafeInfoNotifier.updateCoffeeRoast(value);
                                    },
                                    initialSelectedCountry:
                                        cafeData?.cafeManagement?.coffeeRoast,
                                    countries:
                                        coffeeRoastTypes.toSet().toList(),
                                  ),
                                ),
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
                                SimpleCustomDropdown(
                                    height: 55,
                                    hint: "Select speciality",
                                    validator: (value) => validator
                                        .validateSpecialityCoffee(value),
                                    initialValue:
                                        cafeData?.cafeManagement != null
                                            ? (cafeData?.cafeManagement!
                                                        .speciallityCoffee ==
                                                    1
                                                ? "Yes"
                                                : "No")
                                            : null,
                                    items: items.toSet().toList(),
                                    onChanged: (val) {
                                      if (val == "Yes") {
                                        cafeInfoNotifier
                                            .updateSpecialityCoffee(1);
                                      } else {
                                        cafeInfoNotifier
                                            .updateSpecialityCoffee(0);
                                      }
                                    }),
                              ],
                            ),
                            // 150.horizontalSpace,
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: widget.isFromSignUp
          ? Padding(
              padding: const EdgeInsets.only(top: 70, right: 40),
              child: SizedBox(
                width: 55,
                height: 53,
                child: PrimaryButton(
                  isLoading: ref.watch(cafeInfoNotifierProvider).isLoading,
                  backgroundColor: const Color(0xFFC0987C),
                  onClick: () {
                    if (_fkey.currentState!.validate()) {
                      _fkey.currentState!.save();
                      ref
                          .read(cafeInfoNotifierProvider.notifier)
                          .addCafeInformation();
                    }
                  },
                  isIconButton: true,
                ),
              ),
            )
          : null,
    );
  }

  List<String> items = ['Yes', 'No', 'N/A'];
  List<String> coffeeOriginTypes = [
    'Single',
    'Blended',
    'We offer both',
    'N/A',
  ];
  List<String> coffeeRoastTypes = [
    'Light',
    'Medium',
    'Dark',
    'N/A',
  ];

  List<String> originCountries = [
    'Ethiopia',
    'Kenya',
    'Tanzania',
    'Rwanda',
    'Burundi',
    'Colombia',
    'Brazil',
    'Costa Rica',
    'Guatemala',
    'Panama',
    'Honduras',
    'El Salvador',
    'Indonesia',
    'Vietnam',
    'India',
    'Papua New Guinea',
    'Yemen',
    'Peru',
    'Mexico',
    'Bolivia',
    'Ecuador',
    'Dominican Republic',
    'Cuba',
    'Thailand',
    'Philippines',
    'Other',
    'N/A',
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
                                    allExceptAll.length) {}
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
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: const Color(0xFF4C2F27)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              color: const Color(0xFF4C2F27),
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}
