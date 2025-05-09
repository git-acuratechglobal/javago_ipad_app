import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:java_go/config/common/widgets.dart';

class ClickAndCollect extends ConsumerStatefulWidget {
  const ClickAndCollect({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ClickAndCollectState();
}

class _ClickAndCollectState extends ConsumerState<ClickAndCollect> {
  bool showCafeHours = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3F0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF5F3F0),
        title: Text(
          'CLICK AND COLLECT ',
          style: TextStyle(
            color: const Color(0xFF461C10),
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: ClickandCollectWidget()),
    );
  }
}

class ClickCollect extends StatefulWidget {
  final String title;
  final String title2;
  final String title3;

  const ClickCollect(
      {super.key,
      required this.title,
      required this.title2,
      required this.title3});

  @override
  State<ClickCollect> createState() => _ClickCollectState();
}

class _ClickCollectState extends State<ClickCollect> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        157.horizontalSpace,
        Text(
          widget.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        269.horizontalSpace,
        SizedBox(
            height: 58.h,
            width: 200.w,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC0987C),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                ),
                onPressed: () {},
                child: Text(
                  widget.title2,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ))),
        69.horizontalSpace,
        Text(
          widget.title3,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}

class ClickandCollectWidget extends StatefulWidget {
  const ClickandCollectWidget({
    super.key,
  });

  @override
  State<ClickandCollectWidget> createState() => _ClickandCollectWidgetState();
}

class _ClickandCollectWidgetState extends State<ClickandCollectWidget> {
  bool showCafeHours = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        88.verticalSpace,
        ClickCollect(
          title: 'Opt in to ‘click and collect’?',
          title2: 'Yes',
          title3: 'No',
        ),
        44.verticalSpace,
        Row(
          children: [
            157.horizontalSpace,
            Text(
              'Maximum capacity of orders?',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            240.horizontalSpace,
            Container(
              width: 200.w,
              height: 49.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.black),
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            )
          ],
        ),
        44.verticalSpace,
        Row(
          children: [
            157.horizontalSpace,
            Text(
              'Collection hours',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            400.horizontalSpace,
            Container(
              height: 58.h,
              width: 200.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Color(0xFFC0987C),
              ),
              child: Center(
                child: Text(
                  'During opening hours',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            69.horizontalSpace,
            InkWell(
              onTap: () {
                setState(() {
                  showCafeHours = !showCafeHours;
                });
              },
              child: Text(
                'Edit',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        if (showCafeHours) ...[
          20.verticalSpace,
          Row(
            children: [
              Spacer(),
              SizedBox(
                height: 500.h,
                width: 500.w,
                child: CafeHoursScreen(),
              ),
              50.horizontalSpace,
            ],
          ),
        ],
        44.verticalSpace,
      ],
    );
  }
}
