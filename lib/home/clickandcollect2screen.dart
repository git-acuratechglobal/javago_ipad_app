import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/config/common/extensions.dart';

import '../auth/notifier/cafe_data_notifier/cafe_data_notifier.dart';
import '../auth/notifier/click_and_collect_notifier/click_and_collect_notifier.dart';
import '../auth/pages/sign_up/click_and_collect.dart';
import '../config/async_widget.dart';

class ClickandCollect2Screen extends ConsumerStatefulWidget {
  const ClickandCollect2Screen({super.key});

  @override
  ConsumerState<ClickandCollect2Screen> createState() => _ClickandCollect2ScreenState();
}

class _ClickandCollect2ScreenState extends ConsumerState<ClickandCollect2Screen> {
  @override
  void initState() {
    super.initState();
    ref.listenManual(clickAndCollectNotifierProvider, (_,next){
      switch(next){
        case AsyncData<String?> data when data.value!=null:
          context.showSnackBar(data.value!);
        case AsyncError error:
          context.showSnackBar(error.error.toString());
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return AsyncWidget(
        value: ref.watch(getCafeInfoProvider),
        data: (data) {
          return SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClickandCollectWidget(
                isEditMode: true,
                cafeModel: data,
              ),
              100.verticalSpace,
            ],
          ));
        });
  }
}
