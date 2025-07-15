import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/config/async_widget.dart';
import 'package:java_go/config/common/custom_text_feild.dart';
import 'package:java_go/home/model/get_menu_items.dart';

import 'package:java_go/home/notifier/add_options.dart';
import 'package:java_go/home/notifiers/menu_items.dart';
import 'package:collection/collection.dart';

import '../../home/param/item_param/item_param.dart';
import 'custom_dropdown.dart';

// class Addoptions extends ConsumerWidget {
//   const Addoptions({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//
//     return SingleChildScrollView(
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
//       child:
//     );
//   }
// }

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Only allow digits and a single decimal point
    final regExp = RegExp(r'^\d*\.?\d{0,2}$');
    if (!regExp.hasMatch(newValue.text)) {
      return oldValue;
    }

    return newValue;
  }
}

class PriceTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final Function(double) onPriceChanged;
  final double? initialValue;
  final int? maxLines;
  final double? radius;
  final bool? readOnly;
  const PriceTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.onPriceChanged,
    this.initialValue,
    this.maxLines,
    this.radius,
    this.readOnly,
  }) : super(key: key);

  @override
  State<PriceTextField> createState() => _PriceTextFieldState();
}

class _PriceTextFieldState extends State<PriceTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
        text:
            widget.initialValue != null ? widget.initialValue.toString() : '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color brown = Color(0xFF5B3B2F); // Brown border color
    final double effectiveRadius = widget.radius ?? 6.0;

    return SizedBox(
      width: 240.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          8.verticalSpace,
          Theme(
            data: Theme.of(context).copyWith(
              textSelectionTheme: const TextSelectionThemeData(
                cursorColor: Colors.black,
              ),
            ),
            child: TextFormField(
              enabled: widget.readOnly ?? false,
              controller: _controller,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              maxLines: widget.maxLines ?? 1,
              inputFormatters: [
                CurrencyInputFormatter(),
              ],
              decoration: InputDecoration(
                hintText: widget.hintText,
                fillColor: const Color(0xFFF5F3F0),
                counterText: '',
                prefixText: '£ ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(effectiveRadius),
                  borderSide: const BorderSide(color: brown),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(effectiveRadius),
                  borderSide: const BorderSide(color: brown),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(effectiveRadius),
                  borderSide: const BorderSide(color: brown, width: 1),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
              ),
              onChanged: (String? value) {
                try {
                  final price = value != null && value.isNotEmpty
                      ? double.parse(value)
                      : 0.0;
                  widget.onPriceChanged(price);
                } catch (e) {
                  // Handle parsing error - value remains unchanged in the state
                  debugPrint('Invalid price input: $value');
                }
              },
              onTapOutside: (val) {
                FocusScope.of(context).unfocus();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class GroupedDropdown extends StatelessWidget {
  final Map<String, List<OptionSize>> groupedOptions;
  final String? selectedValue;
  final ValueChanged<OptionSize?> onChanged;
  final Set<int> disabledAddonSizeIds;

  const GroupedDropdown({
    super.key,
    required this.groupedOptions,
    required this.onChanged,
    required this.selectedValue,
    this.disabledAddonSizeIds = const {},
  });

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<String>> items = [];

    groupedOptions.forEach((optionName, sizes) {
      items.add(
        DropdownMenuItem<String>(
          enabled: false,
          child: Text(
            optionName,
            style:Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Color(0xFF1C0E07)),
          ),
        ),
      );
      items.addAll(
        sizes
            .where((size) => !disabledAddonSizeIds.contains(size.id))
            .map((size) {
          return DropdownMenuItem<String>(
            value: size.id.toString(),
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(size.addonSizeName ?? ''),
            ),
          );
        }),
      );
    });

    return DropdownButtonFormField<String>(
      isExpanded: true,
      value: selectedValue,
      items: items,
      onChanged: (value) {
        final selected = groupedOptions.values
            .expand((e) => e)
            .firstWhereOrNull((e) => e.id.toString() == value);
        onChanged(selected);
      },
      decoration: InputDecoration(
        fillColor: const Color(0xFFF5F3F0),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        hintText: 'Select Option',
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Color(0xFF1C0E07)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF6A442E)),
        ),
      ),
    );
  }
}
