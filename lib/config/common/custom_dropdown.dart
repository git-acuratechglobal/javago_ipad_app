import 'package:flutter/material.dart';

import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:java_go/config/common/cache_network_image.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.hint,
    this.value, // Made optional since we'll use initialValue
    this.initialValue, // Added initialValue parameter
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
  final String? initialValue; // Added this parameter
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
                    .toSet() // Remove duplicates by converting to Set
                    .toList() // Convert back to List
                    .map(
                      (String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Container(
                          alignment: valueAlignment,
                          child: Text(
                            item,
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.white),
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
                  padding: buttonPadding ??
                      const EdgeInsets.symmetric(horizontal: 14),
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
                  padding:
                      itemPadding ?? const EdgeInsets.symmetric(horizontal: 14),
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

class SimpleCustomDropdown extends StatefulWidget {
  const SimpleCustomDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.initialValue,
    this.hint = 'Select an option',
    this.validator,
    this.height = 60,
    this.width = 240,
    this.borderRadius = 10,
    this.borderColor = Colors.black45,
    this.backgroundColor = Colors.transparent,
    this.textStyle,
    this.hintStyle,
    this.dropdownColor = const Color(0xFF4C2F27),
    this.icon = const Icon(Icons.arrow_drop_down),
    this.isExpanded = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 14),
    this.errorStyle,
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

  /// List of dropdown items
  final List<String> items;

  /// Callback function when value changes - returns selected value
  final ValueChanged<String?> onChanged;

  /// Initial value to display
  final String? initialValue;

  /// Hint text when no value is selected
  final String hint;

  /// Validation function
  final FormFieldValidator<String>? validator;

  /// Dropdown button height
  final double? height;

  /// Dropdown button width
  final double? width;

  /// Border radius
  final double borderRadius;

  /// Border color
  final Color borderColor;

  /// Background color
  final Color backgroundColor;

  /// Text style for selected value
  final TextStyle? textStyle;

  /// Hint text style
  final TextStyle? hintStyle;

  /// Dropdown menu background color
  final Color dropdownColor;

  /// Dropdown icon
  final Widget icon;

  /// Whether dropdown should expand to fill width
  final bool isExpanded;

  /// Internal padding
  final EdgeInsetsGeometry padding;

  /// Error text style
  final TextStyle? errorStyle;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset offset;

  @override
  State<SimpleCustomDropdown> createState() => _SimpleCustomDropdownState();
}

class _SimpleCustomDropdownState extends State<SimpleCustomDropdown> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    // Set initial value if provided and exists in items
    if (widget.initialValue != null &&
        widget.items.contains(widget.initialValue)) {
      selectedValue = widget.initialValue;
    }
  }

  @override
  void didUpdateWidget(SimpleCustomDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update selected value if initialValue changes
    if (widget.initialValue != oldWidget.initialValue) {
      if (widget.initialValue != null &&
          widget.items.contains(widget.initialValue)) {
        setState(() {
          selectedValue = widget.initialValue;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Remove duplicates from items
    final uniqueItems = widget.items.toSet().toList();

    return FormField<String>(
      initialValue: selectedValue,
      validator: widget.validator,
      builder: (FormFieldState<String> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                value: selectedValue,
                hint: Padding(
                  padding: widget.padding,
                  child: Text(
                    widget.hint,
                    style: widget.hintStyle ??
                        TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                  ),
                ),

                // dropdownColor: widget.dropdownColor,
                items: uniqueItems.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Padding(
                      padding: widget.padding,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue;
                  });

                  // Update FormField state
                  field.didChange(newValue);

                  // Call the callback function
                  widget.onChanged(newValue);
                },
                selectedItemBuilder: (BuildContext context) {
                  return uniqueItems.map((String item) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      padding: widget.padding,
                      child: Text(
                        item,
                        style: widget.textStyle ??
                            const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                      ),
                    );
                  }).toList();
                },
                buttonStyleData: ButtonStyleData(
                  height: widget.height,
                   width:widget.width,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: widget.backgroundColor,
                    border: Border.all(
                      color: Color(0xFF4C2F27),
                    ),
                  ),
                ),
                iconStyleData: IconStyleData(
                  icon: SvgPicture.asset("assets/images/drop_down.svg",height: 30,),
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: widget.dropdownHeight ?? 200,
                  width: widget.dropdownWidth ?? 240.w,
                  padding: widget.dropdownPadding,
                  decoration: widget.dropdownDecoration ??
                      BoxDecoration(
                        color: const Color(0xFF4C2F27),
                        borderRadius: BorderRadius.circular(1),
                      ),
                  elevation: widget.dropdownElevation ?? 8,
                  offset: widget.offset,
                  scrollbarTheme: ScrollbarThemeData(
                    radius: widget.scrollbarRadius ?? const Radius.circular(40),
                    thickness: widget.scrollbarThickness != null
                        ? WidgetStateProperty.all<double>(
                            widget.scrollbarThickness!)
                        : null,
                    thumbVisibility: widget.scrollbarAlwaysShow != null
                        ? WidgetStateProperty.all<bool>(
                            widget.scrollbarAlwaysShow!)
                        : null,
                  ),
                ),
              ),
            ),

            // Error message
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 6, left: 12),
                child: Text(
                  field.errorText!,
                  style: widget.errorStyle ??
                      const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                ),
              ),
          ],
        );
      },
    );
  }
}


class DropdownItem {
  final String id;
  final String name;

  DropdownItem({required this.id, required this.name});
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DropdownItem &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

class MultiSelectCustomDropdown extends StatefulWidget {
  const MultiSelectCustomDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.initialSelectedIds,
    this.hint = 'Select options',
    this.validator,
    this.height = 60,
    this.width = 240,
    this.borderRadius = 10,
    this.borderColor = Colors.black45,
    this.backgroundColor = Colors.transparent,
    this.textStyle,
    this.hintStyle,
    this.dropdownColor = const Color(0xFF4C2F27),
    this.icon = const Icon(Icons.arrow_drop_down),
    this.isExpanded = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 14),
    this.errorStyle,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset = Offset.zero,
    this.maxSelectedDisplay = 2,
    this.checkboxActiveColor = Colors.blue,
    this.checkboxCheckColor = Colors.white,
  });

  /// List of dropdown items with id and name
  final List<DropdownItem> items;

  /// Callback function when selection changes - returns list of selected IDs
  final ValueChanged<List<String>> onChanged;

  /// Initial selected item IDs
  final List<String>? initialSelectedIds;

  /// Hint text when no items are selected
  final String hint;

  /// Validation function
  final FormFieldValidator<List<String>>? validator;

  /// Dropdown button height
  final double? height;

  /// Dropdown button width
  final double? width;

  /// Border radius
  final double borderRadius;

  /// Border color
  final Color borderColor;

  /// Background color
  final Color backgroundColor;

  /// Text style for selected value
  final TextStyle? textStyle;

  /// Hint text style
  final TextStyle? hintStyle;

  /// Dropdown menu background color
  final Color dropdownColor;

  /// Dropdown icon
  final Widget icon;

  /// Whether dropdown should expand to fill width
  final bool isExpanded;

  /// Internal padding
  final EdgeInsetsGeometry padding;

  /// Error text style
  final TextStyle? errorStyle;

  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset offset;

  /// Maximum number of selected items to display before showing "X items selected"
  final int maxSelectedDisplay;

  /// Checkbox colors
  final Color checkboxActiveColor;
  final Color checkboxCheckColor;

  @override
  State<MultiSelectCustomDropdown> createState() => _MultiSelectCustomDropdownState();
}

class _MultiSelectCustomDropdownState extends State<MultiSelectCustomDropdown> {
  List<String> selectedIds = [];

  @override
  void initState() {
    super.initState();
    // Set initial selected IDs if provided
    if (widget.initialSelectedIds != null) {
      selectedIds = List<String>.from(widget.initialSelectedIds!);
    }
  }

  @override
  void didUpdateWidget(MultiSelectCustomDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update selected IDs if initialSelectedIds changes
    if (widget.initialSelectedIds != oldWidget.initialSelectedIds) {
      setState(() {
        selectedIds = widget.initialSelectedIds != null
            ? List<String>.from(widget.initialSelectedIds!)
            : [];
      });
    }
  }

  String _getDisplayText() {
    if (selectedIds.isEmpty) {
      return widget.hint;
    }

    final selectedItems = widget.items
        .where((item) => selectedIds.contains(item.id))
        .map((item) => item.name)
        .toList();

    if (selectedItems.length <= widget.maxSelectedDisplay) {
      return selectedItems.join(', ');
    } else {
      return '${selectedItems.length} items selected';
    }
  }

  void _toggleSelection(String id) {
    setState(() {
      if (selectedIds.contains(id)) {
        selectedIds.remove(id);
      } else {
        selectedIds.add(id);
      }
    });
    widget.onChanged(selectedIds);
  }

  @override
  Widget build(BuildContext context) {
    // Remove duplicates from items
    final uniqueItems = widget.items.toSet().toList();

    return FormField<List<String>>(
      initialValue: selectedIds,
      validator: widget.validator,
      builder: (FormFieldState<List<String>> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                value: null, // Always null for multi-select
                hint: Padding(
                  padding: widget.padding,
                  child: Text(
                    _getDisplayText(),
                    style: selectedIds.isEmpty
                        ? (widget.hintStyle ??
                        TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ))
                        : (widget.textStyle ??
                        const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        )),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                items: uniqueItems.map((DropdownItem item) {
                  final isSelected = selectedIds.contains(item.id);
                  return DropdownMenuItem<String>(
                    value: item.id,
                    enabled: false, // Disable default selection behavior
                    child: StatefulBuilder(
                      builder: (context, menuSetState) {
                        return InkWell(
                          onTap: () {
                            _toggleSelection(item.id);
                            menuSetState(() {}); // Update checkbox state in dropdown
                            field.didChange(selectedIds); // Update FormField state
                          },
                          child: Container(
                            height: double.infinity,
                            padding: widget.padding,
                            child: Row(
                              children: [
                                Checkbox(
                                  value: selectedIds.contains(item.id),
                                  onChanged: (bool? value) {
                                    _toggleSelection(item.id);
                                    menuSetState(() {}); // Update checkbox state
                                    field.didChange(selectedIds); // Update FormField state
                                  },
                                  activeColor: widget.checkboxActiveColor,
                                  checkColor: widget.checkboxCheckColor,
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    item.name,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  // This won't be called due to enabled: false, but required by DropdownButton2
                },
                buttonStyleData: ButtonStyleData(
                  height: widget.height,
                  width: widget.width,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    color: widget.backgroundColor,
                    border: Border.all(
                      color: const Color(0xFF4C2F27),
                    ),
                  ),
                ),
                iconStyleData: IconStyleData(
                  icon: SvgPicture.asset(
                    "assets/images/drop_down.svg",
                    height: 30,
                  ),
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: widget.dropdownHeight ?? 200,
                  width: widget.dropdownWidth ?? 240.w,
                  padding: widget.dropdownPadding,
                  decoration: widget.dropdownDecoration ??
                      BoxDecoration(
                        color: const Color(0xFF4C2F27),
                        borderRadius: BorderRadius.circular(1),
                      ),
                  elevation: widget.dropdownElevation ?? 8,
                  offset: widget.offset,
                  scrollbarTheme: ScrollbarThemeData(
                    radius: widget.scrollbarRadius ?? const Radius.circular(40),
                    thickness: widget.scrollbarThickness != null
                        ? WidgetStateProperty.all<double>(
                        widget.scrollbarThickness!)
                        : null,
                    thumbVisibility: widget.scrollbarAlwaysShow != null
                        ? WidgetStateProperty.all<bool>(
                        widget.scrollbarAlwaysShow!)
                        : null,
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 50,
                  padding: EdgeInsets.zero,
                ),
              ),
            ),

            // Error message
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 6, left: 12),
                child: Text(
                  field.errorText!,
                  style: widget.errorStyle ??
                      const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
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
                    style: TextStyle(fontSize: 14.sp, color: Colors.black),
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
            thickness: scrollbarThickness != null
                ? WidgetStateProperty.all(scrollbarThickness!)
                : null,
            thumbVisibility: scrollbarAlwaysShow != null
                ? WidgetStateProperty.all(scrollbarAlwaysShow!)
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
          width: 240.w,
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
