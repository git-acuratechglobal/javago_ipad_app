import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/auth/params/click_and_collect_params.dart';
import 'package:java_go/config/async_widget.dart';
import 'package:java_go/config/common/button.dart';
import 'package:java_go/config/common/extensions.dart';

import 'package:java_go/config/common/widgets.dart';

import '../../../home/notifier/cafe_info_notifier/cafe_info_notifier.dart';
import '../../model/cafe_model.dart';
import '../../model/cafe_time_and_category.dart';
import '../../model/cafetime_model.dart';
import '../../notifier/auth_notifier.dart';
import '../../notifier/cafe_data_notifier/cafe_data_notifier.dart';
import '../../notifier/click_and_collect_notifier/click_and_collect_notifier.dart';

class ClickAndCollect extends ConsumerStatefulWidget {
  const ClickAndCollect({super.key, this.isFromSignup = false});
  final bool? isFromSignup;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ClickAndCollectState();
}

class _ClickAndCollectState extends ConsumerState<ClickAndCollect> {
  bool showCafeHours = false;
  @override
  void initState() {
    super.initState();
    ref.listenManual(clickAndCollectNotifierProvider, (_, next) {
      switch (next) {
        case AsyncData<String?> data when data.value != null:
          context.showSnackBar(data.value!);
        case AsyncError error:
          context.showSnackBar(error.error.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3F0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF5F3F0),
        title: Text(
          'CLICK AND COLLECT ',
          style: (widget.isFromSignup == true)
              ? Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Color(0xFF461C10), fontWeight: FontWeight.w600)
              : TextStyle(
                  color: const Color(0xFF461C10),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
        ),
        centerTitle: true,
      ),
      body: AsyncWidget(
          onRetry: () => ref.refresh(getCafeInfoProvider),
          value: ref.watch(getCafeInfoProvider),
          data: (data) {
            return SingleChildScrollView(
                child: ClickandCollectWidget(
              isEditMode: false,
              cafeModel: data,
            ));
          }),
      floatingActionButton: (widget.isFromSignup == true)
          ? Padding(
              padding: const EdgeInsets.only(top: 70, right: 40),
              child: SizedBox(
                width: 55,
                height: 53,
                child: PrimaryButton(
                  isLoading: ref.watch(cafeInfoNotifierProvider).isLoading,
                  backgroundColor: const Color(0xFFC0987C),
                  onClick: () {
                    ref
                        .read(cafeInfoNotifierProvider.notifier)
                        .updateClickAndCollect();
                  },
                  isIconButton: true,
                ),
              ),
            )
          : null,
    );
  }
}

class ClickCollect extends StatefulWidget {
  final String title;
  final String yesLabel;
  final String noLabel;
  final String initialValue;
  final void Function(String selectedValue) onChanged;

  const ClickCollect({
    super.key,
    required this.title,
    required this.yesLabel,
    required this.noLabel,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<ClickCollect> createState() => _ClickCollectState();
}

class _ClickCollectState extends State<ClickCollect> {
  late String _selected;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selected = widget.initialValue;
    });
  }

  void _updateSelection(String value) {
    if (_selected != value) {
      setState(() {
        _selected = value;
      });
      widget.onChanged(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Yes Button
            SizedBox(
              height: 58.h,
              width: 230.w,
              child: _selected == widget.yesLabel
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC0987C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        widget.yesLabel,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () => _updateSelection(widget.yesLabel),
                      child: Container(
                        height: 58.h,
                        width: 230.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text(
                          widget.yesLabel,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
            ),
            8.horizontalSpace,
            // No Button
            SizedBox(
              height: 58.h,
              width: 230.w,
              child: _selected == widget.noLabel
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFC0987C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        widget.noLabel,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () => _updateSelection(widget.noLabel),
                      child: Container(
                        height: 58.h,
                        width: 230.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text(
                          widget.noLabel,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ],
    );
  }
}

class ClickandCollectWidget extends ConsumerStatefulWidget {
  const ClickandCollectWidget(
      {super.key, this.isEditMode = false, this.cafeModel});
  final bool? isEditMode;
  final CafeModel? cafeModel;
  @override
  ConsumerState<ClickandCollectWidget> createState() =>
      _ClickandCollectWidgetState();
}

class _ClickandCollectWidgetState extends ConsumerState<ClickandCollectWidget> {
  bool showCafeHours = false;
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     if (widget.cafeModel!.cafeClickCollectTiming != null &&
  //         widget.cafeModel!.cafeClickCollectTiming!.isNotEmpty) {
  //       ref
  //           .read(clickAndCollectParamProvider.notifier)
  //           .updateClickAndCollectParam(cafeModel: widget.cafeModel!);
  //     } else {
  //       ref
  //           .read(clickAndCollectParamProvider.notifier)
  //           .updateClickAndCollectParamForInitial(cafeModel: widget.cafeModel!);
  //     }
  //   });
  // }





  @override
  Widget build(BuildContext context) {
    final clickAndCollect = ref.watch(clickAndCollectParamProvider);
    final clickAndCollectNotifier =
        ref.read(clickAndCollectParamProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              88.verticalSpace,
              ClickCollect(
                key: UniqueKey(),
                title: 'Opt in to ‘click and collect’?',
                yesLabel: 'Yes',
                noLabel: 'No',
                initialValue:
                    clickAndCollect.click_and_collect == 1 ? "Yes" : "No",
                onChanged: (value) {
                  if (value == "Yes") {
                    clickAndCollectNotifier.updateClickAndCollect(1);
                  } else {
                    clickAndCollectNotifier.updateClickAndCollect(0);
                  }
                },
              ),
              44.verticalSpace,
              if (clickAndCollect.click_and_collect == 1) ...[
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Maximum capacity of orders?',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 90),
                      child: Container(
                        width: 200.w,
                        height: 49.h,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<int>(
                            isExpanded: true,
                            value: clickAndCollect.max_orders_click_collect,
                            hint: Text("Select Capacity"),
                            items: List.generate(11, (index) {
                              final value = index + 2;
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text(value.toString()),
                              );
                            }),
                            onChanged: (value) {
                              clickAndCollectNotifier
                                  .updateMaxOrder(value ?? 2);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                44.verticalSpace,
                ClickCollect(
                  key: ValueKey('Collection hours'),
                  title: 'Collection hours',
                  yesLabel: 'During opening hours',
                  noLabel: 'Edit',
                  initialValue:
                      // clickAndCollect.clickAndCollectTime.isEmpty
                      //     ? "During opening hours"
                      //     :
                      "During opening hours",
                  onChanged: (value) {
                    setState(() {
                      showCafeHours = !showCafeHours;
                    });
                  },
                ),
                if (showCafeHours) ...[
                  20.verticalSpace,
                  Row(
                    children: [
                      Spacer(),
                      SizedBox(
                        height: 400.h,
                        width: 500.w,
                        child: CafeHoursScreen1(
                          key: ValueKey("CafeHoursScreen1"),
                          restrictCafeTime: widget.cafeModel?.timing ?? [],
                          initialCafeTime: clickAndCollect.initialCafeTime,
                          onTimeChanged: (List<CafeDayTime> cafeTime) {
                            clickAndCollectNotifier.updateTiming(cafeTime);
                          },
                        ),
                      ),
                      50.horizontalSpace,
                    ],
                  ),
                ],
              ]
            ],
          ),
        ),
        80.verticalSpace,
        if (widget.isEditMode == true)
          Padding(
              padding: const EdgeInsets.only(left: 40),
              child: PrimaryButton(
                fixedSize: Size(178.w, 50.h),
                isLoading: ref.watch(cafeInfoNotifierProvider).isLoading,
                onClick: () {
                  ref
                      .read(cafeInfoNotifierProvider.notifier)
                      .updateClickAndCollect();
                },
                title: "Save Changes",
              )),
        44.verticalSpace,
      ],
    );
  }
}
