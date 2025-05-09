import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PrimaryButton extends StatelessWidget {
  final String? title;
  final bool isLoading;
  final VoidCallback? onClick;
  final Size? fixedSize;
  final bool safeArea;
  final bool isIconButton;

  const PrimaryButton({
    super.key,
    this.title,
    this.isLoading = false,
    required this.onClick,
    this.fixedSize,
    this.safeArea = true,
    this.isIconButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: fixedSize ?? (isIconButton ? const Size(48, 48) : null),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isIconButton ? 12 : 8),
        ),
        backgroundColor: const Color(0xFFC0987C),
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
                rightDotColor: const Color(0xFF005FF2),
                leftDotColor: const Color(0xFFD7ED5D),
              )
            : isIconButton
                ? const Icon(Icons.arrow_forward, color: Colors.white, size: 20)
                : Text(
                    title ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
      ),
    );

    return isIconButton
        ? SizedBox(width: 48, height: 48, child: button) // <-- fix width/height
        : button;
  }
}
