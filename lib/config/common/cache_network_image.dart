import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

extension ImageExtension on num {
  int cacheSize(BuildContext context) {
    return (this * MediaQuery.of(context).devicePixelRatio).round();
  }
}

class NetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final bool cacheImages;
  final BoxFit? fit;
  final Widget? errorWidget;
  final Color? backgroundColor;
  final double loadingWidgetSize;
  const NetworkImageWidget(
      {super.key,
      required this.imageUrl,
      this.cacheImages = true,
      this.errorWidget,
      this.fit,
      this.backgroundColor,
      this.loadingWidgetSize = 38});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, snapshot) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit ?? BoxFit.cover,
        memCacheWidth: cacheImages ? snapshot.maxWidth.cacheSize(context) : null,
        memCacheHeight: cacheImages ? snapshot.maxHeight.cacheSize(context) : null,
        maxWidthDiskCache: snapshot.maxWidth.cacheSize(context),
        maxHeightDiskCache: snapshot.maxHeight.cacheSize(context),
        errorWidget: (context, url, error) {
          return errorWidget ??
              Container(
                color: Colors.white,
                child: Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              );
        },
        placeholder: (context, url) {
          return Container(
            color: backgroundColor ?? Colors.white,
            child: Center(
              child: LoadingAnimationWidget.twistingDots(
                  size: loadingWidgetSize, rightDotColor: Color(0xFF005FF2), leftDotColor: Color(0xFFD7ED5D)),
            ),
          );
        },
      );
    });
  }
}
