import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/config/common/cache_network_image.dart';

// class CustomDropdownWithImage<T> extends StatelessWidget {
//   const CustomDropdownWithImage({
//     super.key,
//     required this.hint,
//     required this.value,
//     required this.dropdownItems,
//     required this.onChanged,
//     required this.getLabel,
//     required this.getImageUrl,
//     this.selectedItemBuilder,
//     this.hintAlignment,
//     this.valueAlignment,
//     this.buttonHeight,
//     this.buttonWidth,
//     this.buttonPadding,
//     this.buttonDecoration,
//     this.buttonElevation,
//     this.icon,
//     this.iconSize,
//     this.customBtn,
//     this.iconEnabledColor,
//     this.iconDisabledColor,
//     this.itemHeight,
//     this.itemPadding,
//     this.dropdownHeight,
//     this.dropdownWidth,
//     this.dropdownPadding,
//     this.dropdownDecoration,
//     this.dropdownElevation,
//     this.scrollbarRadius,
//     this.scrollbarThickness,
//     this.scrollbarAlwaysShow,
//     this.offset = Offset.zero,
//   });
//
//   final String hint;
//   final T? value;
//   final List<T> dropdownItems;
//   final ValueChanged<T?>? onChanged;
//
//   final String Function(T) getLabel;
//   final String Function(T) getImageUrl;
//
//   final DropdownButtonBuilder? selectedItemBuilder;
//   final Alignment? hintAlignment;
//   final Alignment? valueAlignment;
//   final double? buttonHeight, buttonWidth;
//   final EdgeInsetsGeometry? buttonPadding;
//   final BoxDecoration? buttonDecoration;
//   final int? buttonElevation;
//   final Widget? icon;
//   final Widget? customBtn;
//   final double? iconSize;
//   final Color? iconEnabledColor;
//   final Color? iconDisabledColor;
//   final double? itemHeight;
//   final EdgeInsetsGeometry? itemPadding;
//   final double? dropdownHeight, dropdownWidth;
//   final EdgeInsetsGeometry? dropdownPadding;
//   final BoxDecoration? dropdownDecoration;
//   final int? dropdownElevation;
//   final Radius? scrollbarRadius;
//   final double? scrollbarThickness;
//   final bool? scrollbarAlwaysShow;
//   final Offset offset;
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//       child: DropdownButton2<T>(
//         isExpanded: true,
//         hint: Row(
//           children: [
//             Container(
//               alignment: hintAlignment,
//               child: Text(
//                 hint,
//                 style: TextStyle(fontSize: 14.sp),
//               ),
//             ),
//           ],
//         ),
//         value: value,
//         items: dropdownItems
//             .map((item) => DropdownMenuItem<T>(
//                   value: item,
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         width: 30.w,
//                         height: 30.h,
//                         child: ClipOval(
//                           child: NetworkImageWidget(
//                             loadingWidgetSize: 15,
//                             imageUrl: getImageUrl(item),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       Text(
//                         getLabel(item),
//                         style: TextStyle(
//                           fontSize: 14.sp,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ))
//             .toList(),
//         onChanged: onChanged,
//         selectedItemBuilder: selectedItemBuilder,
//         buttonStyleData: ButtonStyleData(
//           height: buttonHeight ?? 60,
//           width: buttonWidth ?? 240.w,
//           padding: buttonPadding ?? const EdgeInsets.symmetric(horizontal: 14),
//           decoration: buttonDecoration ??
//               BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: Colors.black45),
//               ),
//           elevation: buttonElevation,
//         ),
//         iconStyleData: IconStyleData(
//           icon: icon ?? const Icon(Icons.keyboard_arrow_down_outlined),
//           iconSize: iconSize ?? 12,
//           iconEnabledColor: iconEnabledColor,
//           iconDisabledColor: iconDisabledColor,
//         ),
//         customButton: customBtn,
//         dropdownStyleData: DropdownStyleData(
//           maxHeight: dropdownHeight ?? 200,
//           width: dropdownWidth ?? 225.w,
//           padding: dropdownPadding,
//           decoration: dropdownDecoration ??
//               BoxDecoration(
//                 color: const Color(0xFF4C2F27),
//                 borderRadius: BorderRadius.circular(1),
//               ),
//           elevation: dropdownElevation ?? 8,
//           offset: offset,
//           scrollbarTheme: ScrollbarThemeData(
//             radius: scrollbarRadius ?? const Radius.circular(40),
//             thickness: scrollbarThickness != null
//                 ? WidgetStateProperty.all<double>(scrollbarThickness!)
//                 : null,
//             thumbVisibility: scrollbarAlwaysShow != null
//                 ? WidgetStateProperty.all<bool>(scrollbarAlwaysShow!)
//                 : null,
//           ),
//         ),
//         menuItemStyleData: MenuItemStyleData(
//           height: itemHeight ?? 40,
//           padding: itemPadding ?? const EdgeInsets.symmetric(horizontal: 14),
//         ),
//         // style: TextStyle(
//         //   fontSize: 16.sp,
//         //   fontWeight: FontWeight.w500,
//         //   color: const Color(0xFF4C2F27),
//         // ),
//       ),
//     );
//   }
// }


class CustomDropdownWithColor<T> extends StatelessWidget {
  const CustomDropdownWithColor({
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
                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
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
          icon: icon ?? const Icon(Icons.arrow_drop_down),
          iconSize: iconSize ?? 22,
          iconEnabledColor: iconEnabledColor,
          iconDisabledColor: iconDisabledColor,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: dropdownHeight ?? 200,
          width: dropdownWidth ?? 240.w,
          padding: dropdownPadding,
          decoration: dropdownDecoration ??
              BoxDecoration(
                color: Colors.white,
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

class CustomDropdownsButton extends StatelessWidget {
  const CustomDropdownsButton({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
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
    this.searchable = false, // ✅ NEW PARAMETER
    super.key,
  });

  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
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
  final bool searchable; // ✅

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Container(
          alignment: hintAlignment,
          child: Text(
            hint,
            style: TextStyle(fontSize: 14.sp),
          ),
        ),
        value: value,
        items: dropdownItems
            .map((String item) => DropdownMenuItem<String>(
          value: item,
          child: Container(
            alignment: valueAlignment,
            child: Text(
              item,
              style: TextStyle(fontSize: 14.sp, color: Colors.black),
            ),
          ),
        ))
            .toList(),
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
          icon: icon ?? const Icon(Icons.arrow_drop_down),
          iconSize: iconSize ?? 22,
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
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
        dropdownSearchData: searchable
            ? DropdownSearchData(
          searchController: TextEditingController(),
          searchInnerWidgetHeight: 50,
          searchInnerWidget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: TextField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                hintText: 'Search...',
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          searchMatchFn: (item, searchValue) {
            return item.value!.toLowerCase().contains(searchValue.toLowerCase());
          },
        )
            : null,
      ),
    );
  }
}