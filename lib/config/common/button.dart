import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PrimaryButton extends StatelessWidget {
  final String? title;
  final bool isLoading;
  final VoidCallback? onClick;
  final Size? fixedSize;
  final bool safeArea;
  final bool isIconButton;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;
  const PrimaryButton({
    super.key,
    this.title,
    this.isLoading = false,
    required this.onClick,
    this.fixedSize,
    this.safeArea = true,
    this.isIconButton = false,
    this.backgroundColor,
    this.textColor,
    this.borderRadius=8
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: fixedSize ?? (isIconButton ? const Size(48, 48) : null),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isIconButton ? 12 : borderRadius),
        ),
        backgroundColor: backgroundColor ?? const Color(0xFFC0987C),
        disabledBackgroundColor: const Color(0xFFC0987C),
        elevation: 6,
        shadowColor: Colors.black26,
        padding: EdgeInsets.zero,
      ),
      onPressed: isLoading ? null : onClick,
      child: Center(
        child: isLoading
            ? LoadingAnimationWidget.twistingDots(
                size: 24,
                rightDotColor: Colors.white,
                leftDotColor: Colors.white,
              )
            : isIconButton
                ? const Icon(Icons.arrow_forward, color: Colors.white, size: 20)
                : Text(
                    title ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: textColor ?? Colors.white),
                  ),
      ),
    );

    return isIconButton ? SizedBox(width: 48, height: 48, child: button) : button;
  }
}
