import 'package:flutter/material.dart';

import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/config/common/cache_network_image.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.validator,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.customBtn,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset = Offset.zero,
  });

  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final FormFieldValidator<String>? validator;

  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final Widget? customBtn;

  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: validator,
      initialValue: value,
      builder: (FormFieldState<String> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Row(
                  children: [
                    Container(
                      alignment: hintAlignment,
                      child: Text(
                        hint,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
                value: field.value,
                items: dropdownItems
                    .map(
                      (String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Container(
                      alignment: valueAlignment,
                      child: Text(
                        item,
                        style: TextStyle(fontSize: 14.sp, color: Colors.white),
                      ),
                    ),
                  ),
                )
                    .toList(),
                onChanged: (val) {
                  field.didChange(val); // Notify the FormField
                  onChanged?.call(val); // External callback
                },
                selectedItemBuilder: selectedItemBuilder,
                buttonStyleData: ButtonStyleData(
                  height: buttonHeight ?? 60,
                  width: buttonWidth ?? 240.w,
                  padding: buttonPadding ?? const EdgeInsets.symmetric(horizontal: 14),
                  decoration: buttonDecoration ??
                      BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black45,
                        ),
                      ),
                  elevation: buttonElevation,
                ),
                iconStyleData: IconStyleData(
                  icon: icon ?? const Icon(Icons.arrow_forward_ios_outlined),
                  iconSize: iconSize ?? 12,
                  iconEnabledColor: iconEnabledColor,
                  iconDisabledColor: iconDisabledColor,
                ),
                customButton: customBtn,
                dropdownStyleData: DropdownStyleData(
                  maxHeight: dropdownHeight ?? 200,
                  width: dropdownWidth ?? 240.w,
                  padding: dropdownPadding,
                  decoration: dropdownDecoration ??
                      BoxDecoration(
                        color: const Color(0xFF4C2F27),
                        borderRadius: BorderRadius.circular(1),
                      ),
                  elevation: dropdownElevation ?? 8,
                  offset: offset,
                  scrollbarTheme: ScrollbarThemeData(
                    radius: scrollbarRadius ?? const Radius.circular(40),
                    thickness: scrollbarThickness != null
                        ? WidgetStateProperty.all<double>(scrollbarThickness!)
                        : null,
                    thumbVisibility: scrollbarAlwaysShow != null
                        ? WidgetStateProperty.all<bool>(scrollbarAlwaysShow!)
                        : null,
                  ),
                ),
                menuItemStyleData: MenuItemStyleData(
                  height: itemHeight ?? 40,
                  padding: itemPadding ?? const EdgeInsets.symmetric(horizontal: 14),
                ),
              ),
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 8),
                child: Text(
                  field.errorText!,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}


class CustomDropdownWithImage<T> extends StatelessWidget {
  const CustomDropdownWithImage({
    super.key,
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    required this.getLabel,
    required this.getImageUrl,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.customBtn,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset = Offset.zero,
  });

  final String hint;
  final T? value;
  final List<T> dropdownItems;
  final ValueChanged<T?>? onChanged;

  final String Function(T) getLabel;
  final String Function(T) getImageUrl;

  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final Widget? customBtn;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        isExpanded: true,
        customButton: customBtn,
        hint: Align(
          alignment: hintAlignment ?? Alignment.centerLeft,
          child: Text(
            hint,
            style: TextStyle(fontSize: 14.sp),
          ),
        ),
        value: value,
        items: dropdownItems.map((item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Row(
              children: [
                ClipOval(
                  child: SizedBox(
                    width: 30.w,
                    height: 30.h,
                    child: NetworkImageWidget(
                      imageUrl: getImageUrl(item),
                      loadingWidgetSize: 15,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    getLabel(item),
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        onChanged: onChanged,
        selectedItemBuilder: selectedItemBuilder,
        buttonStyleData: ButtonStyleData(
          height: buttonHeight ?? 60,
          width: buttonWidth ?? 240.w,
          padding: buttonPadding ?? const EdgeInsets.symmetric(horizontal: 14),
          decoration: buttonDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black45),
              ),
          elevation: buttonElevation,
        ),
        iconStyleData: IconStyleData(
          icon: icon ?? const Icon(Icons.arrow_forward_ios_outlined),
          iconSize: iconSize ?? 12,
          iconEnabledColor: iconEnabledColor,
          iconDisabledColor: iconDisabledColor,
        ),
        dropdownStyleData: DropdownStyleData(
          
          maxHeight: dropdownHeight ?? 200,
          width: dropdownWidth ?? 240.w,
          padding: dropdownPadding,
          decoration: dropdownDecoration ??
              BoxDecoration(
                color: const Color(0xFF4C2F27),
                borderRadius: BorderRadius.circular(1),
              ),
          elevation: dropdownElevation ?? 8,
          offset: offset,
          scrollbarTheme: ScrollbarThemeData(
            radius: scrollbarRadius ?? const Radius.circular(40),
            thickness:
                scrollbarThickness != null ? WidgetStateProperty.all(scrollbarThickness!) : null,
            thumbVisibility:
                scrollbarAlwaysShow != null ? WidgetStateProperty.all(scrollbarAlwaysShow!) : null,
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: itemHeight ?? 40,
          padding: itemPadding ?? const EdgeInsets.symmetric(horizontal: 14),
        ),
      ),
    );
  }
}

class CustomDropdownButton2<T> extends StatelessWidget {
  const CustomDropdownButton2({
    super.key,
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    required this.itemToString,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.customBtn,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset = Offset.zero,
  });

  final String hint;
  final T? value;
  final List<T> dropdownItems;
  final ValueChanged<T?>? onChanged;
  final String Function(T) itemToString;

  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final Widget? customBtn;

  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      
      child: DropdownButton2<T>(
        
        isExpanded: true,
        hint: Row(
          children: [
            Container(
              alignment: hintAlignment,
              child: Text(
                hint,
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
          ],
        ),
        value: value,
        items: dropdownItems.map((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Container(
              alignment: valueAlignment,
              child: Text(
                itemToString(item),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        selectedItemBuilder: selectedItemBuilder,
        buttonStyleData: ButtonStyleData(
          height: buttonHeight ?? 60,
          width: buttonWidth ?? 240.w,
          padding: buttonPadding ?? const EdgeInsets.symmetric(horizontal: 14),
          decoration: buttonDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black45),
              ),
          elevation: buttonElevation,
        ),
        iconStyleData: IconStyleData(
          icon: icon ?? const Icon(Icons.arrow_forward_ios_outlined),
          iconSize: iconSize ?? 12,
          iconEnabledColor: iconEnabledColor,
          iconDisabledColor: iconDisabledColor,
        ),
        customButton: customBtn,
        dropdownStyleData: DropdownStyleData(
          maxHeight: dropdownHeight ?? 100,
          width:  240.w,
          padding: dropdownPadding,
          decoration: dropdownDecoration ??
              BoxDecoration(
                color: const Color(0xFF4C2F27),
                borderRadius: BorderRadius.circular(1),
              ),
          elevation: dropdownElevation ?? 8,
          offset: offset,
          scrollbarTheme: ScrollbarThemeData(
            radius: scrollbarRadius ?? const Radius.circular(40),
            thickness: scrollbarThickness != null
                ? WidgetStateProperty.all<double>(scrollbarThickness!)
                : null,
            thumbVisibility: scrollbarAlwaysShow != null
                ? WidgetStateProperty.all<bool>(scrollbarAlwaysShow!)
                : null,
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: itemHeight ?? 40,
          padding: itemPadding ?? const EdgeInsets.symmetric(horizontal: 14),
        ),
      ),
    );
  }
}
