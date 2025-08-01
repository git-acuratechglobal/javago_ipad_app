import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  AppTextField(
      {super.key,
      this.label,
      this.controller,
      required this.hint,
      this.isPassword = false,
      this.obscureText = false,
      this.toggle,
      this.iconPath,
      this.onSaved,
      this.onTapOutside,
      this.validator,
      this.initialValue,
      this.maxLines = 1,
      this.width = 310,
        this.height,
      this.readOnly = false,
      this.onChanged,
      this.inputType,
      this.fillColor=Colors.white,
        this.maxLength
      }) {
    if (initialValue != null) {
      controller?.text = initialValue ?? "";
    }
  }
  final String? label;
  final TextEditingController? controller;
  final String hint;
  final bool? isPassword;
  final bool? obscureText;
  final VoidCallback? toggle;
  final String? iconPath;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final void Function(PointerDownEvent)? onTapOutside;
  final String? Function(String?)? validator;
  final String? initialValue;
  final int? maxLines;
  final double? width;
  final double? height;
  final bool? readOnly;
  final TextInputType? inputType;
  final Color fillColor;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text("${label}*",
              style: TextStyle(
                  color: Color(0xff461C10),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600)),
          8.verticalSpace,
        ],
        SizedBox(
          height: height,
          width: width,
          child: TextFormField(
            maxLength: maxLength,
            keyboardType: inputType,
            readOnly: readOnly!,
            maxLines: maxLines,
            initialValue: initialValue,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
            cursorColor: Color(0xFF6A442E),
            controller: controller,
            obscureText: obscureText!,
            decoration: InputDecoration(
              counterText: "",
              filled: true,
              fillColor: fillColor,
              errorMaxLines: 2,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF4C2F27)),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF4C2F27)),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              prefixIcon: iconPath != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(iconPath!,
                              color: Color(0xFF6A442E), height: 20, width: 20),
                          SizedBox(width: 10),
                          Container(
                            height: 20,
                            child: VerticalDivider(
                              width: 1.5,
                              thickness: 1.5,
                              color: Color(0xFF6A442E),
                            ),
                          ),
                        ],
                      ),
                    )
                  : null,
              suffixIcon: isPassword!
                  ? InkWell(
                      onTap: toggle,
                      child: Image.asset(obscureText!
                          ? 'assets/images/ic_hide_password.png'
                          : 'assets/images/ic_show_password.png'),
                    )
                  : null,
              hintText: hint,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Color(0xFF1C0E07)),
            ),
            onSaved: onSaved,
            onChanged: onChanged,
            onTapOutside: (val) {
              FocusScope.of(context).unfocus();
            },
          ),
        ),
      ],
    );
  }
}
