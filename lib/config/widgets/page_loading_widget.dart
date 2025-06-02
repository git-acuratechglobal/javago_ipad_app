

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PageLoadingWidget extends StatelessWidget {
  const PageLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: Container(
        color: Colors.black38,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: LoadingAnimationWidget.twistingDots(
                  size: 38,
                  rightDotColor: Color(0xFF694233),
                  leftDotColor: Color(0xFF694233)),
            )),
      ),
    );
  }
}