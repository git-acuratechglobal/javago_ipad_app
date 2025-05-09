import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:java_go/sign_up/click_and_collect.dart';
import 'package:java_go/sign_up/reviewscreen.dart';

class ClickandCollect2Screen extends StatefulWidget {
  const ClickandCollect2Screen({super.key});

  @override
  State<ClickandCollect2Screen> createState() => _ClickandCollect2ScreenState();
}

class _ClickandCollect2ScreenState extends State<ClickandCollect2Screen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ClickandCollectWidget(), Padding(
        padding:  EdgeInsets.symmetric(horizontal: 37),
        child: EditContainer(title: 'Save Changes'),
      ),
      100.verticalSpace,
      ],
    ));
  }
}
