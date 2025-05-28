import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/config/async_widget.dart';
import 'package:java_go/config/common/button.dart';
import 'package:java_go/config/common/extensions.dart';

import 'package:java_go/config/common/widgets.dart';

import '../../model/cafe_model.dart';
import '../../model/cafetime_model.dart';
import '../../notifier/auth_notifier.dart';
import '../../notifier/cafe_data_notifier/cafe_data_notifier.dart';
import '../../notifier/click_and_collect_notifier/click_and_collect_notifier.dart';

class ClickAndCollect extends ConsumerStatefulWidget {
  const ClickAndCollect({super.key,this.isFromSignup = false});
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
              ? Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: Color(0xFF461C10), fontWeight: FontWeight.w600)
              : TextStyle(
            color: const Color(0xFF461C10),
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: AsyncWidget(
        onRetry: ()=>ref.refresh(getCafeInfoProvider),
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
            isLoading: ref.watch(authNotifierProvider).isLoading,
            backgroundColor: const Color(0xFFC0987C),
            onClick: () {
              // ref.read(clickAndCollectNotifierProvider.notifier).updateForm(
              //     key: 'clickAndCollect', value: ref.read(clickAndCollectValueProvider));
              // print("=====${ref.read(clickAndCollectValueProvider)}");
              // print("=====${ref.read(selectedCapacityValueProvider)}");
              // ref.read(clickAndCollectNotifierProvider.notifier).updateForm(
              //     key: 'maxOrders', value: ref.read(selectedCapacityValueProvider));
              // ref.read(clickAndCollectNotifierProvider.notifier).updateClickAndCollect();
              // final controller = ref.read(cafePageControllerProvider);
              // final isFromEditRewiew = ref.read(isFromSignupEditProvider);
              // if (controller.hasClients) {
              //   if (isFromEditRewiew == true) {
              //     print('DEBUG: Jumping to page 5');
              //     controller.jumpToPage(5);
              //   } else {
              //     print('DEBUG: Moving to next page');
              //     controller.nextPage(
              //       duration: const Duration(milliseconds: 250),
              //       curve: Curves.bounceIn,
              //     );
              //   }
              // }
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
    _selected = widget.initialValue;
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
        // Title on left
        Expanded(
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),

        // Yes button or text
        _selected == widget.yesLabel
            ? SizedBox(
                height: 58.h,
                width: 230.w,
                child: ElevatedButton(
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
                ),
              )
            : GestureDetector(
                onTap: () => _updateSelection(widget.yesLabel),
                child: Text(
                  widget.yesLabel,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),

        69.horizontalSpace,

        // No button or text
        _selected == widget.noLabel
            ? SizedBox(
                height: 58.h,
                width: 230.w,
                child: ElevatedButton(
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
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : GestureDetector(
                onTap: () => _updateSelection(widget.noLabel),
                child: Text(
                  widget.noLabel,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
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
  int? selectedCapacity;
  int? clickAndCollect;
  @override
  void initState() {
    super.initState();
    selectedCapacity = widget.cafeModel?.cafeManagement?.maxOrdersClickCollect;
    if (selectedCapacity == null || selectedCapacity == 0) {
      selectedCapacity = 2;
    }
    clickAndCollect = widget.cafeModel?.cafeManagement?.clickAndCollect ?? 0;
  }

  @override
  Widget build(BuildContext context) {
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
                title: 'Opt in to ‘click and collect’?',
                yesLabel: 'Yes',
                noLabel: 'No',
                initialValue:
                    widget.cafeModel?.cafeManagement?.clickAndCollect == 1
                        ? "Yes"
                        : "No",
                onChanged: (value) {
                  if (value == "Yes") {
                    clickAndCollect = 1;
                  } else {
                    clickAndCollect = 0;
                  }

                },
              ),
              44.verticalSpace,
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
                          borderRadius: BorderRadius.circular(
                              4), // Optional: add rounding
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10), // For inner spacing
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                          isExpanded: true,
                          value: selectedCapacity,
                          hint: Text("Select Capacity"),
                          items: List.generate(11, (index) {
                            final value = index + 2;
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text(value.toString()),
                            );
                          }),
                          onChanged: (value) {
                            setState(() {
                              selectedCapacity = value!;
                            });

                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              44.verticalSpace,
              ClickCollect(
                title: 'Collection hours',
                yesLabel: 'During opening hours',
                noLabel: 'Edit',
                initialValue: 'During opening hours',
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
                        initialCafeTime:
                            widget.cafeModel?.cafeClickCollectTiming ?? [],
                        onTimeChanged: (List<CafeDayTime> cafeTime) {
                          ref
                              .read(clickAndCollectNotifierProvider.notifier)
                              .updateForm(key: 'cafeTimes', value: cafeTime);
                        },
                      ),
                    ),
                    50.horizontalSpace,
                  ],
                ),
              ],
            ],
          ),
        ),
        80.verticalSpace,
        if (widget.isEditMode == true)
          Padding(
              padding: const EdgeInsets.only(left: 40),
              child: PrimaryButton(
                fixedSize: Size(178.w, 50.h),
                isLoading: ref.watch(clickAndCollectNotifierProvider).isLoading,
                onClick: () {
                  ref.read(clickAndCollectNotifierProvider.notifier).updateForm(
                      key: 'clickAndCollect', value: clickAndCollect);
                  ref
                      .read(clickAndCollectNotifierProvider.notifier)
                      .updateForm(
                      key: 'maxOrders', value: selectedCapacity);
                  ref
                      .read(clickAndCollectNotifierProvider.notifier)
                      .updateClickAndCollect();
                },
                title: "Save Changes",
              )),
        44.verticalSpace,
      ],
    );
  }
}
