import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/auth/model/cafe_time_and_category.dart';
import 'package:java_go/auth/pages/steps/stepper_widget.dart';
import 'package:java_go/config/async_widget.dart';
import 'package:java_go/config/common/button.dart';
import 'package:java_go/config/common/extensions.dart';
import 'package:java_go/home/menu_info_state.dart';
import 'package:java_go/home/notifier/pagination_notifier.dart';
import 'package:java_go/home/notifiers/menu_item_showing.dart';

import '../../auth/model/cafe_model.dart';
import '../../auth/model/cafetime_model.dart';
import '../../auth/pages/sign_up/menu.dart';

final selectedItemIdProvider = StateProvider<int?>((ref) => null);
final selectedIdsProvider = StateProvider<List<String>>((ref) => []);

class CafeHoursScreen extends StatefulWidget {
  const CafeHoursScreen(
      {super.key, required this.onTimeChanged, this.initialCafeTime});
  final void Function(List<CafeDayTime>) onTimeChanged;
  final List<CafeTiming>? initialCafeTime;
  @override
  State<CafeHoursScreen> createState() => _CafeHoursScreenState();
}

class _CafeHoursScreenState extends State<CafeHoursScreen> {
  final List<String> days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  final Map<String, TimeOfDay> openingTimes = {};
  final Map<String, TimeOfDay> closingTimes = {};

  String? _selectedTimeField;

  @override
  void initState() {
    super.initState();
    _initializeTimes();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _notifyParent();
    });
  }

  void _initializeTimes() {
    for (var i = 0; i < days.length; i++) {
      final day = days[i];
      openingTimes[day] = const TimeOfDay(hour: 9, minute: 0);
      closingTimes[day] = const TimeOfDay(hour: 22, minute: 0);
    }

    if (widget.initialCafeTime != null) {
      for (final timing in widget.initialCafeTime!) {
        final dayIndex = timing.day;
        if (dayIndex! >= 0 && dayIndex < days.length) {
          final dayName = days[dayIndex];
          openingTimes[dayName] = _parseTime(timing.openTime!);
          closingTimes[dayName] = _parseTime(timing.closeTime!);
        }
      }
    }
  }

  void _notifyParent() {
    final result = days.map((day) {
      return CafeDayTime(
        day: day,
        openingTime: openingTimes[day]!,
        closingTime: closingTimes[day]!,
      );
    }).toList();

    widget.onTimeChanged(result);
  }

  Future<void> _pickTime(
      BuildContext context, String day, bool isOpening) async {
    setState(() {
      _selectedTimeField = "$day-${isOpening ? 'open' : 'close'}";
    });

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isOpening ? openingTimes[day]! : closingTimes[day]!,
    );

    if (picked != null) {
      setState(() {
        if (isOpening) {
          openingTimes[day] = picked;
        } else {
          closingTimes[day] = picked;
        }
        _notifyParent(); // Callback after update
      });
    }

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _selectedTimeField = null;
      });
    });
  }

  TimeOfDay _parseTime(String time) {
    try {
      final parts = time.split(":");
      if (parts.length >= 2) {
        return TimeOfDay(
          hour: int.parse(parts[0]),
          minute: int.parse(parts[1]),
        );
      }
    } catch (e) {
      // Handle parsing errors
    }
    // Return default time if parsing fails
    return const TimeOfDay(hour: 9, minute: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: days.length,
        itemBuilder: (context, index) {
          final day = days[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    day,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1B0701)),
                  ),
                ),
                const SizedBox(width: 37),
                const Text(":"),
                const SizedBox(width: 10),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => _pickTime(context, day, true),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 10),
                        decoration: BoxDecoration(
                          color: _selectedTimeField == "$day-open"
                              ? Colors.white
                              : Colors.transparent,
                          border: Border.all(color: const Color(0xFF4C2F27)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          openingTimes[day]!.format(context),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: _selectedTimeField == "$day-open"
                                ? Colors.black
                                : const Color(0xFF1B0701),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text("-"),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => _pickTime(context, day, false),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 10),
                        decoration: BoxDecoration(
                          color: _selectedTimeField == "$day-close"
                              ? Colors.white
                              : Colors.transparent,
                          border: Border.all(color: const Color(0xFF4C2F27)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          closingTimes[day]!.format(context),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: _selectedTimeField == "$day-close"
                                ? Colors.black
                                : const Color(0xFF1B0701),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CafeHoursScreen1 extends StatefulWidget {
  const CafeHoursScreen1(
      {super.key,
      required this.onTimeChanged,
      this.initialCafeTime,
      required this.restrictCafeTime});
  final void Function(List<CafeDayTime>) onTimeChanged;
  final List<CafeClickCollectTiming>? initialCafeTime;
  final List<CafeTiming> restrictCafeTime;
  @override
  State<CafeHoursScreen1> createState() => _CafeHoursScreen1State();
}

class _CafeHoursScreen1State extends State<CafeHoursScreen1> {
  final List<String> days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  final Map<String, TimeOfDay> openingTimes = {};
  final Map<String, TimeOfDay> closingTimes = {};

  String? _selectedTimeField;

  @override
  void initState() {
    super.initState();
    _initializeTimes();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _notifyParent();
    });
  }

  void _initializeTimes() {
    // Initialize with default times first
    for (var day in days) {
      openingTimes[day] = const TimeOfDay(hour: 9, minute: 0);
      closingTimes[day] = const TimeOfDay(hour: 22, minute: 0);
    }

    // Override with initial data if available
    if (widget.initialCafeTime != null && widget.initialCafeTime!.isNotEmpty) {
      for (var timing in widget.initialCafeTime!) {
        final int dayIndex = int.tryParse(timing.day ?? "") ?? 0;
        if (dayIndex >= 0 && dayIndex < days.length) {
          final String dayName = days[dayIndex];

          if (timing.startTime != null && timing.startTime!.isNotEmpty) {
            openingTimes[dayName] = _parseTime(timing.startTime!);
          }

          if (timing.endTime != null && timing.endTime!.isNotEmpty) {
            closingTimes[dayName] = _parseTime(timing.endTime!);
          }
        }
      }
    }
  }

  void _notifyParent() {
    final result = days.map((day) {
      return CafeDayTime(
        day: day,
        openingTime: openingTimes[day]!,
        closingTime: closingTimes[day]!,
      );
    }).toList();

    widget.onTimeChanged(result);
  }

  Future<void> _pickTime(
      BuildContext context, String day, bool isOpening) async {
    setState(() {
      _selectedTimeField = "$day-${isOpening ? 'open' : 'close'}";
    });

    final TimeOfDay initial =
        isOpening ? openingTimes[day]! : closingTimes[day]!;

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initial,
    );

    if (picked != null) {
      final int dayIndex = days.indexOf(day);
      final restrict = widget.restrictCafeTime.firstWhere(
        (e) => e.day == dayIndex,
        orElse: () => CafeTiming(
          day: dayIndex,
          openTime: "00:00",
          closeTime: "23:59",
        ),
      );

      final TimeOfDay min = _parseTime(restrict.openTime ?? "");
      final TimeOfDay max = _parseTime(restrict.closeTime ?? "");

      final bool isValid = _isTimeWithinRange(picked, min, max);

      if (!isValid) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Please select a time between ${min.format(context)} and ${max.format(context)}'),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        setState(() {
          if (isOpening) {
            openingTimes[day] = picked;
          } else {
            closingTimes[day] = picked;
          }
          _notifyParent();
        });
      }
    }

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _selectedTimeField = null;
      });
    });
  }

  bool _isTimeWithinRange(TimeOfDay selected, TimeOfDay min, TimeOfDay max) {
    final selectedMinutes = selected.hour * 60 + selected.minute;
    final minMinutes = min.hour * 60 + min.minute;
    final maxMinutes = max.hour * 60 + max.minute;
    return selectedMinutes >= minMinutes && selectedMinutes <= maxMinutes;
  }

  TimeOfDay _parseTime(String time) {
    try {
      final parts = time.split(":");
      if (parts.length >= 2) {
        return TimeOfDay(
          hour: int.parse(parts[0]),
          minute: int.parse(parts[1]),
        );
      }
    } catch (e) {
      // Handle parsing errors
    }
    // Return default time if parsing fails
    return const TimeOfDay(hour: 9, minute: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: days.length,
        itemBuilder: (context, index) {
          final day = days[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    day,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1B0701)),
                  ),
                ),
                const SizedBox(width: 37),
                const Text(":"),
                const SizedBox(width: 10),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => _pickTime(context, day, true),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 10),
                        decoration: BoxDecoration(
                          color: _selectedTimeField == "$day-open"
                              ? Colors.white
                              : Colors.transparent,
                          border: Border.all(color: const Color(0xFF4C2F27)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          openingTimes[day]!.format(context),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: _selectedTimeField == "$day-open"
                                ? Colors.black
                                : const Color(0xFF1B0701),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text("-"),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => _pickTime(context, day, false),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 10),
                        decoration: BoxDecoration(
                          color: _selectedTimeField == "$day-close"
                              ? Colors.white
                              : Colors.transparent,
                          border: Border.all(color: const Color(0xFF4C2F27)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          closingTimes[day]!.format(context),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: _selectedTimeField == "$day-close"
                                ? Colors.black
                                : const Color(0xFF1B0701),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

final dropdownProvider = StateProvider<String?>((ref) => null);

class Dropdown extends ConsumerStatefulWidget {
  final String title;
  final Color color;
  const Dropdown(this.title, this.color, {super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DropdownState();
}

class _DropdownState extends ConsumerState<Dropdown> {
  @override
  Widget build(BuildContext context) {
    List<String> dropdownOptions = [
      '1',
      '2',
    ];

    final selectedProperty = ref.watch(dropdownProvider);

    return DropdownButtonFormField<String>(
      isExpanded: true,
      value: selectedProperty,
      hint: Text(
        widget.title,
        style: TextStyle(
            color: widget.color, fontSize: 16.sp, fontWeight: FontWeight.w500),
      ),
      icon: Icon(Icons.keyboard_arrow_down_outlined),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF4C2F27),
          ),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Color(0xFF4C2F27),
            )),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF4C2F27),
          ),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
      items: dropdownOptions
          .map((option) => DropdownMenuItem(
                value: option,
                child: Text(option, style: TextStyle(color: widget.color)),
              ))
          .toList(),
      onChanged: (value) {
        ref.read(dropdownProvider.notifier).state = value;
      },
    );
  }
}

class Reviewtiming extends StatefulWidget {
  const Reviewtiming({super.key, required this.timings});
  final List<CafeTiming> timings;

  @override
  State<Reviewtiming> createState() => _ReviewtimingState();
}

class _ReviewtimingState extends State<Reviewtiming> {
  final Map<int, String> dayNames = {
    0: 'Sunday',
    1: 'Monday',
    2: 'Tuesday',
    3: 'Wednesday',
    4: 'Thursday',
    5: 'Friday',
    6: 'Saturday',
  };

  final Map<String, TimeOfDay> openingTimes = {};
  final Map<String, TimeOfDay> closingTimes = {};

  @override
  void initState() {
    super.initState();

    for (int i = 0; i <= 6; i++) {
      final dayName = dayNames[i]!;

      final timing = widget.timings.firstWhere(
        (e) => e.day == i,
        orElse: () => CafeTiming(openTime: "09:00", closeTime: "22:00"),
      );

      openingTimes[dayName] = _parseTime(timing.openTime ?? "09:00");
      closingTimes[dayName] = _parseTime(timing.closeTime ?? "22:00");
    }
  }

  TimeOfDay _parseTime(String time) {
    final parts = time.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: dayNames.length,
        itemBuilder: (context, index) {
          final day = dayNames.values.toList()[index];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    day,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1B0701),
                    ),
                  ),
                ),
                const Text(":"),
                const SizedBox(width: 10),
                Text(
                  openingTimes[day]!.format(context),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1B0701),
                  ),
                ),
                const SizedBox(width: 10),
                const Text("-"),
                const SizedBox(width: 10),
                Text(
                  closingTimes[day]!.format(context),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1B0701),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ReviewItems extends ConsumerWidget {
  const ReviewItems({super.key, this.isFromSignUp = false});
  final bool isFromSignUp;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuItemAsync = ref.watch(showMenuItemssProvider);
    final controller=ref.watch(cafePageControllerProvider);
    return AsyncWidget(
      value: menuItemAsync,
      data: (menuItem) {
        final data = menuItem.data;
        final items = data?.data != null ? data?.data!.sortByLatest() : [];
        final lastPage = int.tryParse(data?.lastPage.toString() ?? '1') ?? 1;

        // final selectedIdsNotifier =    ref.read(selectedItemIdProvider.notifier);
        final selectedIds = ref.watch(selectedIdsProvider);
        final allIds = items!.map((e) => e.id.toString()).toList();
        if (selectedIds.isEmpty && allIds.isNotEmpty) {
          Future.microtask(() {
            ref.read(selectedIdsProvider.notifier).state = allIds;
          });
        }
        return  Stack(
          children: [
            SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Header Row
                    11.verticalSpace,
                    if (isFromSignUp)
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          child: InkWell(
                            onTap: () {
                              context.navigateTo(
                                const MenuScreen(
                                  isEditmode: true,
                                  fromAdd: true,
                                ),
                              );
                            },
                            child: Container(
                              width: 140,
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFF9B6842),
                                border:
                                Border.all(color: Color(0xFF9B6842), width: 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.add, color: Colors.white),
                                    8.horizontalSpace,
                                    Text(
                                      'Add Items',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      width: 1189.w,
                      height: 59.h,
                      decoration: const BoxDecoration(color: Color(0xFF9B6842)),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 74.w,
                              child: Text('Images',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp))),
                          15.horizontalSpace,
                          SizedBox(
                              width: 121.w,
                              child: Text('Item Name',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp))),
                          15.horizontalSpace,
                          SizedBox(
                              width: 102.w,
                              child: Text('Category',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp))),
                          35.horizontalSpace,
                          SizedBox(
                              width: 110.w,
                              child: Text('Price',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp))),
                          15.horizontalSpace,
                          SizedBox(
                              width: 198.w,
                              child: Text('Description',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp))),
                          10.horizontalSpace,
                          SizedBox(
                              width: 100.w,
                              child: Text('Type',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp))),
                          15.horizontalSpace,
                          SizedBox(
                              width: 120.w,
                              child: Text('Status',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp))),
                          15.horizontalSpace,
                          SizedBox(
                              width: 120.w,
                              child: Text('Availability',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp))),
                        ],
                      ),
                    ),

                    // Items List
                    if (items.isEmpty) ...[
                      100.verticalSpace,
                      Text("No items Added yet!")
                    ] else
                      ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: items.length,
                        separatorBuilder: (_, __) => 10.verticalSpace,
                        itemBuilder: (context, index) {
                          final item = items[index];

                          // final selectedIds = ref.watch(selectedIdsProvider);
                          // final selectedIdsNotifier = ref.read(selectedIdsProvider.notifier);
                          // final idsToPass = selectedIds.isEmpty ? items.map((e) => e.id).toList() : [item.id];
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.w),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Row(
                              spacing: 10,
                              children: [
                                SizedBox(
                                  height: 40.h,
                                  width: 40.w,
                                  child: item.itemImage != null
                                      ? Image.network(item.itemImage!,
                                      fit: BoxFit.cover)
                                      : const Icon(Icons.image_not_supported),
                                ),
                                25.horizontalSpace,
                                SizedBox(
                                    width: 100.w,
                                    child: Text(item.itemName ?? "-",
                                        overflow: TextOverflow.ellipsis)),
                                25.horizontalSpace,
                                SizedBox(
                                    width: 90.w,
                                    child: Text(item.itemCategory ?? "-",
                                        overflow: TextOverflow.ellipsis)),
                                15.horizontalSpace,
                                SizedBox(
                                    width: 90.w,
                                    child: Text(item.itemPrice ?? "-",
                                        overflow: TextOverflow.ellipsis)),
                                15.horizontalSpace,
                                SizedBox(
                                    width: 160.w,
                                    child: Text(item.itemDescription ?? "-",
                                        overflow: TextOverflow.ellipsis)),
                                35.horizontalSpace,
                                SizedBox(
                                  width: 50.w,
                                  child: Text(
                                        () {
                                      switch (item.itemType) {
                                        case 1:
                                          return "Veg";
                                        case 2:
                                          return "Non-Veg";
                                        case 3:
                                          return "Vegan";
                                        default:
                                          return "Unknown";
                                      }
                                    }(),
                                  ),
                                ),
                                15.horizontalSpace,
                                StatusContainer(
                                  status: item.status,
                                  id: item.id,
                                  editOption: isFromSignUp,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    // Spacer(),
                    11.verticalSpace,
                    CustomPaginationBar(
                      currentPage: ref.watch(paginationProvider),
                      totalItems: data!.total ?? 0,
                      totalPages: (data.perPage == 0 || data.total == null)
                          ? 1
                          : ((data.total! / data.perPage).ceil()),
                      itemsPerPage: data.perPage,
                      onPageChanged: (page) {
                        ref.read(paginationProvider.notifier).state = page;
                      },
                      onItemsPerPageChanged: (value) {
                        data.perPage = value;
                        ref.read(paginationProvider.notifier).state =
                        1; // Reset to page 1
                      },
                    ),

                    164.verticalSpace
                  ],
                ),
              ),

            if(isFromSignUp)
            Positioned(
              right: 50,
              bottom: 10,
              child: SizedBox(
                width: 55,
                height: 53,
                child: PrimaryButton(
                  backgroundColor: const Color(0xFFC0987C),
                  onClick: () {
                    if(items.isNotEmpty){
                      if (controller.hasClients) {
                        controller.nextPage(
                          duration: Duration(milliseconds: 250),
                          curve: Curves.bounceIn,
                        );
                        return;
                      }
                    }
                    context.showSnackBar("Please add 1 or more cafe menu item");
                  },
                  isIconButton: true,
                ),
              ),
            )
          ],
        );



      },
    );
  }
}
// Page Index
// PageIndex(currentPage: currentPage, totalPages: lastPage),
// const SizedBox(height: 8),
// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     ElevatedButton(
//       onPressed: currentPage > 1
//           ? () => ref.read(paginationProvider.notifier).previousPage()
//           : null,
//       child: const Text('Previous'),
//     ),
//     const SizedBox(width: 20),
//     ElevatedButton(
//       onPressed: currentPage < lastPage
//           ? () => ref.read(paginationProvider.notifier).nextPage(lastPage)
//           : null,
//       child: const Text('Next'),
//     ),
//   ],
// ),
// class ReviewItems extends ConsumerWidget {
//   const ReviewItems({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final currentPage = ref.watch(paginationProvider);
//     final menuItemAsync = ref.watch(showMenuItemssProvider);

//     return AsyncWidget(
//       value: menuItemAsync,
//       data: (menuItem) {
//         final data = menuItem.data;
//         final items = data?.data ?? [];
//         final lastPage = data?.lastPage ?? 1;

//         // ✅ Auto-store all item IDs when data loads
//         final selectedIdsNotifier = ref.read(selectedIdsProvider.notifier);
//         final selectedIds = ref.watch(selectedIdsProvider);
//       final allIds = items.map((e) => e.id.toString()).toList();

//         if (selectedIds.isEmpty && allIds.isNotEmpty) {
//           Future.microtask(() {
//             selectedIdsNotifier.state = allIds;
//           });
//         }

//         return Column(
//           children: [
//             11.verticalSpace,
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               width: 1189.w,
//               height: 59.h,
//               decoration: const BoxDecoration(color: Color(0xFF9B6842)),
//               child: Row(
//                 children: [
//                   SizedBox(
//                       width: 74.w,
//                       child: Text('Images', style: TextStyle(color: Colors.white, fontSize: 16.sp))),
//                   15.horizontalSpace,
//                   SizedBox(
//                       width: 121.w,
//                       child: Text('Item Name', style: TextStyle(color: Colors.white, fontSize: 16.sp))),
//                   15.horizontalSpace,
//                   SizedBox(
//                       width: 102.w,
//                       child: Text('Category', style: TextStyle(color: Colors.white, fontSize: 16.sp))),
//                   35.horizontalSpace,
//                   SizedBox(
//                       width: 110.w,
//                       child: Text('Price', style: TextStyle(color: Colors.white, fontSize: 16.sp))),
//                   15.horizontalSpace,
//                   SizedBox(
//                       width: 198.w,
//                       child: Text('Description', style: TextStyle(color: Colors.white, fontSize: 16.sp))),
//                   10.horizontalSpace,
//                   SizedBox(
//                       width: 100.w,
//                       child: Text('Type', style: TextStyle(color: Colors.white, fontSize: 16.sp))),
//                   15.horizontalSpace,
//                   SizedBox(
//                       width: 120.w,
//                       child: Text('Status', style: TextStyle(color: Colors.white, fontSize: 16.sp))),
//                   15.horizontalSpace,
//                   SizedBox(
//                       width: 120.w,
//                       child: Text('Availability', style: TextStyle(color: Colors.white, fontSize: 16.sp))),
//                 ],
//               ),
//             ),

//             // Items List
//             ListView.separated(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: items.length,
//               separatorBuilder: (_, __) => 10.verticalSpace,
//               itemBuilder: (context, index) {
//                 final item = items[index];

//                 return Container(
//                   margin: EdgeInsets.symmetric(horizontal: 15.w),
//                   padding: EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey.shade300),
//                     borderRadius: BorderRadius.circular(8),
//                     color: Colors.white,
//                   ),
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         height: 40.h,
//                         width: 40.w,
//                         child: item.itemImage != null
//                             ? Image.network(item.itemImage!, fit: BoxFit.cover)
//                             : const Icon(Icons.image_not_supported),
//                       ),
//                       25.horizontalSpace,
//                       SizedBox(
//                           width: 100.w,
//                           child: Text(item.itemName ?? "-", overflow: TextOverflow.ellipsis)),
//                       25.horizontalSpace,
//                       SizedBox(
//                           width: 90.w,
//                           child: Text(item.itemCategory ?? "-", overflow: TextOverflow.ellipsis)),
//                       15.horizontalSpace,
//                       SizedBox(
//                           width: 80.w,
//                           child: Text(item.itemPrice ?? "-", overflow: TextOverflow.ellipsis)),
//                       15.horizontalSpace,
//                       SizedBox(
//                           width: 170.w,
//                           child: Text(item.itemDescription ?? "-", overflow: TextOverflow.ellipsis)),
//                       35.horizontalSpace,
//                       SizedBox(
//                         width: 60.w,
//                         child: Text(
//                           () {
//                             switch (item.itemType) {
//                               case 1:
//                                 return "Veg";
//                               case 2:
//                                 return "Non-Veg";
//                               case 3:
//                                 return "Vegan";
//                               default:
//                                 return "Unknown";
//                             }
//                           }(),
//                         ),
//                       ),
//                       15.horizontalSpace,
//                       StatusContainer(
//                         status: item.status,
//                         id: item.id ?? "",
//                       )
//                     ],
//                   ),
//                 );
//               },
//             ),

//             // Page Index
//             PageIndex(currentPage: currentPage, totalPages: lastPage),
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: currentPage > 0
//                       ? () => ref.read(paginationProvider.notifier).previousPage()
//                       : null,
//                   child: const Text('Previous'),
//                 ),
//                 const SizedBox(width: 20),
//                 ElevatedButton(
//                   onPressed: currentPage < lastPage - 1
//                       ? () => ref.read(paginationProvider.notifier).nextPage(lastPage)
//                       : null,
//                   child: const Text('Next'),
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

class ReviewItembarname extends StatefulWidget {
  final String label;
  final Color color;
  final double fontSize;
  const ReviewItembarname(
      {super.key,
      required this.label,
      required this.color,
      required this.fontSize});
  @override
  State<ReviewItembarname> createState() => _ReviewItembarnameState();
}

class _ReviewItembarnameState extends State<ReviewItembarname> {
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      softWrap: true,
      widget.label,
      maxLines: 3,
      style: TextStyle(
          color: widget.color,
          fontSize: widget.fontSize,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis),
    );
  }
}

class StatusContainer extends ConsumerStatefulWidget {
  final int status;
  final int id;
  final bool? editOption;
  StatusContainer(
      {super.key,
      required this.id,
      required this.status,
      this.editOption = true});

  @override
  ConsumerState<StatusContainer> createState() => _StatusContainerState();
}

class _StatusContainerState extends ConsumerState<StatusContainer> {
  bool _isSwitched = false;

  @override
  void initState() {
    super.initState();
    _isSwitched = widget.status == 1;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        spacing: 0,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              padding: EdgeInsets.all(0),
              width: 105.74,
              height: 41.30,
              decoration: ShapeDecoration(
                color:
                    _isSwitched ? const Color(0xFF1C8113) : Color(0xFFFD5555),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Center(
                child: _isSwitched
                    ? Text(
                        'Available',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : Text(
                        'Unavailable',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              )),
          10.horizontalSpace,
          CupertinoSwitch(
            activeColor: const Color(0xFFC0987C),
            trackColor: const Color(0xFF757575),
            value: _isSwitched,
            onChanged: (bool value) {
              if (widget.editOption ?? false) {
                // ref.read(updateAddonItemStatusProvider(widget.id,widget.status).notifier).updateAddonItemStatus(widget.id);
              }
              setState(() {
                _isSwitched = value;
              });
            },
          ),
          (widget.editOption ?? false) ? 3.horizontalSpace : 2.horizontalSpace,
          (widget.editOption ?? true)
              ? Row(
                  children: [
                    InkWell(
                      onTap: () {
                        ref.read(selectedItemIdProvider.notifier).state =
                            widget.id;
                        ref
                            .read(menuInfoTabStateProvider.notifier)
                            .updateMenuTab(1, widget.id);

                        //   MenuInfoScreen(
                        //     id: widget.id,
                        //     defaultTabIndex: 1, // opens 'Additional Options'

                        //   //  Items(id: widget.id ),
                        // );
                      },
                      child: Container(
                        padding: EdgeInsets.all(0),
                        width: 79.74,
                        height: 42.30,
                        decoration: ShapeDecoration(
                          color: _isSwitched
                              ? const Color(0xFF1C8113)
                              : Color(0xFFFD5555),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            '   View Addons',
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    2.horizontalSpace,
                    InkWell(
                      onTap: () {
                        // context.navigateTo(MenuScreen(isEditmode: true));
                      },
                      child: Image.asset(
                        'assets/images/edit_java_go.png',
                        height: 43.h,
                        width: 43.w,
                      ),
                    ),
                  ],
                )
              : SizedBox(
                  width: 65,
                ),
          if (widget.editOption ?? true) 8.horizontalSpace,
          InkWell(
            onTap: () async {
              // await ref.read(deleteItemProvider.notifier).deleteItem(widget.id);
            },
            child: Image.asset(
              'assets/images/delete_java_go.png',
              height: 43.h,
              width: 40.5,
            ),
          )
        ],
      ),
    );
  }
}

class CustomPaginationBar extends StatelessWidget {
  final int currentPage;
  final int totalItems;
  final int totalPages;
  final int itemsPerPage;
  final void Function(int) onPageChanged;
  final void Function(int) onItemsPerPageChanged;

  const CustomPaginationBar({
    super.key,
    required this.currentPage,
    required this.totalItems,
    required this.totalPages,
    required this.itemsPerPage,
    required this.onPageChanged,
    required this.onItemsPerPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final start = totalItems == 0 ? 0 : ((currentPage - 1) * itemsPerPage) + 1;
    final end =
        totalItems == 0 ? 0 : (start + itemsPerPage - 1).clamp(1, totalItems);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Showing range
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.brown),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              "Showing $start to $end of $totalItems entries",
              style: TextStyle(fontSize: 14.sp, color: Colors.brown),
            ),
          ),

          /// Items per page dropdown
          // Row(
          //   children: [
          //     Text(
          //       "RESULTS:",
          //       style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: Colors.blue),
          //     ),
          //     SizedBox(width: 4.w),
          //     Container(
          //       height: 36.h,
          //       padding: EdgeInsets.symmetric(horizontal: 8.w),
          //       decoration: BoxDecoration(
          //         border: Border.all(color: Colors.brown),
          //         borderRadius: BorderRadius.circular(6.r),
          //       ),
          //       child: DropdownButton<int>(
          //         value: itemsPerPage,
          //         underline: const SizedBox(),
          //         isDense: true,
          //         items: [5, 10, 15, 20]
          //             .map((value) => DropdownMenuItem<int>(
          //                   value: value,
          //                   child: Text('$value'),
          //                 ))
          //             .toList(),
          //         onChanged: (value) {
          //           if (value != null) {
          //             onItemsPerPageChanged(value);
          //           }
          //         },
          //       ),
          //     ),
          //   ],
          // ),

          /// Pagination buttons
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios_new_rounded, size: 16.sp),
                onPressed: currentPage > 1
                    ? () => onPageChanged(currentPage - 1)
                    : null,
              ),
              ...List.generate(
                totalPages,
                (index) {
                  final page = index + 1;
                  final isSelected = page == currentPage;
                  return GestureDetector(
                    onTap: () => onPageChanged(page),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected ? Colors.brown : Colors.grey[200],
                      ),
                      child: Text(
                        '$page',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios_rounded, size: 16.sp),
                onPressed: currentPage < totalPages
                    ? () => onPageChanged(currentPage + 1)
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class PageIndex extends StatelessWidget {
//   final int currentPage;
//   final int totalPages;

//   const PageIndex({
//     super.key,
//     required this.currentPage,
//     required this.totalPages,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       'Page $currentPage of $totalPages',
//       style: TextStyle(fontSize: 16.sp),
//     );
//   }
// }
