import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final InputBorder? border;
  final InputBorder? enableBorder;
  final InputBorder? focusBorder;
  final String? labelText;
  final String? prefixIcon;
  final Widget? prefixWidget;
  final Color? labelBckColor;
  final int? maxLength;
  final Function(String)? onChanged;
  final bool? isObscure;
  final Icon? suffixIcon;
  final bool? readOnly;
  final VoidCallback? onTapOnSuffixIcon;
  final VoidCallback? onTapOnPrefixIcon;
  final VoidCallback? onTap;
  final int? maxLines;
  final int? minLines;
  final double? radius;
  final String? hintText;
final TextInputType? textInputType;
  const CustomTextField({
    Key? key,
     this.controller,
    this.hintText,
    this.border,
    this.enableBorder,
    this.focusBorder,
    this.labelText,
    this.prefixIcon,
    this.prefixWidget,
    this.labelBckColor,
    this.maxLength,
    this.onChanged,
    this.isObscure,
    this.suffixIcon,
    this.readOnly,
    this.onTapOnSuffixIcon,
    this.onTapOnPrefixIcon,
    this.onTap,
    this.maxLines,
    this.minLines,
    this.radius,
    this.textInputType
  }) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    const Color brown = Color(0xFF5B3B2F); // Brown border color
    final double effectiveRadius = radius ?? 6.0;

    return SizedBox(
      width: 240.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null)
            Text(
              labelText!,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          const SizedBox(height: 6),
          Theme(
            data: Theme.of(context).copyWith(
              textSelectionTheme: const TextSelectionThemeData(
                cursorColor: Colors.black,
              ),
            ),
            child: TextFormField(
              keyboardType: textInputType,
              minLines: minLines,
              controller: controller,
              obscureText: isObscure ?? false,
              readOnly: readOnly ?? false,
              maxLength: maxLength,
              onChanged: onChanged,
              onTap: onTap,
              maxLines: maxLines ?? 1,
              decoration: InputDecoration(
                hintText: hintText,
                fillColor: Color(0xFFF5F3F0),
                counterText: '',
                border: border ??
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(effectiveRadius),
                      borderSide: const BorderSide(color: brown),
                    ),
                enabledBorder: enableBorder ??
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(effectiveRadius),
                      borderSide: const BorderSide(color: brown),
                    ),
                focusedBorder: focusBorder ??
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(effectiveRadius),
                      borderSide: const BorderSide(color: brown, width: 1),
                    ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                prefixIcon: prefixIcon != null
                    ? GestureDetector(
                        onTap: onTapOnPrefixIcon,
                        child: Icon(Icons.adaptive.arrow_forward),
                      )
                    : prefixWidget,
                suffixIcon: suffixIcon != null
                    ? GestureDetector(
                        onTap: onTapOnSuffixIcon,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset("assets/images/drop_down.svg"),
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
