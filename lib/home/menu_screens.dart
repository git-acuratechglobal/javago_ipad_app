import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/home/notifier/pagination_notifier.dart';

import 'package:java_go/sign_up/menu.dart';

class CafeHoursScreen extends StatefulWidget {
  const CafeHoursScreen({super.key});

  @override
  State<CafeHoursScreen> createState() => _CafeHoursScreenState();
}

class _CafeHoursScreenState extends State<CafeHoursScreen> {
  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  final Map<String, TimeOfDay> openingTimes = {};
  final Map<String, TimeOfDay> closingTimes = {};

  // Track selected field (e.g., "Monday-open", "Tuesday-close")
  String? _selectedTimeField;

  @override
  void initState() {
    super.initState();
    for (var day in days) {
      openingTimes[day] = const TimeOfDay(hour: 9, minute: 0);
      closingTimes[day] = const TimeOfDay(hour: 22, minute: 0);
    }
  }

  Future<void> _pickTime(BuildContext context, String day, bool isOpening) async {
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
      });
    }

    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _selectedTimeField = null;
      });
    });
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
                        fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF1B0701)),
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
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        decoration: BoxDecoration(
                          color:
                              _selectedTimeField == "$day-open" ? Colors.white : Colors.transparent,
                          border: Border.all(color: Color(0xFF4C2F27)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          openingTimes[day]!.format(context),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: _selectedTimeField == "$day-open"
                                ? Colors.black
                                : Color(0xFF1B0701),
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
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        decoration: BoxDecoration(
                          color: _selectedTimeField == "$day-close"
                              ? Colors.white
                              : Colors.transparent,
                          border: Border.all(color: Color(0xFF4C2F27)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          closingTimes[day]!.format(context),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: _selectedTimeField == "$day-close"
                                ? Colors.black
                                : Color(0xFF1B0701),
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
      value: selectedProperty,
      hint: Text(
        widget.title,
        style: TextStyle(color: widget.color, fontSize: 16.sp, fontWeight: FontWeight.w500),
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
  const Reviewtiming({super.key});

  @override
  State<Reviewtiming> createState() => _ReviewtimingState();
}

class _ReviewtimingState extends State<Reviewtiming> {
  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  final Map<String, TimeOfDay> openingTimes = {};
  final Map<String, TimeOfDay> closingTimes = {};

  @override
  void initState() {
    super.initState();
    for (var day in days) {
      openingTimes[day] = const TimeOfDay(hour: 9, minute: 0);
      closingTimes[day] = const TimeOfDay(hour: 22, minute: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
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
                      color: Color(0xFF1B0701),
                    ),
                  ),
                ),
                const Text(":"),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    openingTimes[day]!.format(context),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1B0701),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text("-"),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    closingTimes[day]!.format(context),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1B0701),
                    ),
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

class ReviewItems extends ConsumerStatefulWidget {
  const ReviewItems({super.key});

  @override
  ConsumerState<ReviewItems> createState() => _ReviewItemsState();
}

class _ReviewItemsState extends ConsumerState<ReviewItems> {
  final List<Map<String, dynamic>> allItems = List.generate(
    19,
    (index) => {
      'image': 'assets/images/icetea.png',
      'name': 'Ice Tea $index',
      'category': 'Drinks',
      'price': '£ 9.5',
      'desc': 'Lorem Ipsum is simply dummy text $index',
      'tag': 'Vegan',
      'tagIcon': 'assets/images/vegan_java_go.png',
    },
  );

  final int itemsPerPage = 5;

  @override
  Widget build(BuildContext context) {
    final currentPage = ref.watch(paginationProvider);
    final startIndex = currentPage * itemsPerPage;
    final endIndex = (startIndex + itemsPerPage).clamp(0, allItems.length);
    final pageItems = allItems.sublist(startIndex, endIndex);

    final totalPages = (allItems.length / itemsPerPage).ceil();

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          width: 1076.w,
          height: 59.h,
          decoration: BoxDecoration(color: Color(0xFF9B6842)),
          child: Row(
            //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 74.w,
                child: ReviewItembarname(
                  label: 'Images',
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                width: 121.w,
                child: ReviewItembarname(
                  label: 'Item Name',
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                width: 102.w,
                child: ReviewItembarname(
                  label: 'Category',
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                width: 70.w,
                child: ReviewItembarname(
                  label: 'Price',
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                width: 212.w,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ReviewItembarname(
                    label: 'Description',
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(
                width: 100.w,
                child: ReviewItembarname(
                  label: 'Type',
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                width: 120.w,
                child: ReviewItembarname(
                  label: 'Status',
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                width: 120.w,
                child: ReviewItembarname(
                  label: 'Availability',
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
        22.verticalSpace,
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: pageItems.length,
          itemBuilder: (context, index) {
            final item = pageItems[index];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  // Image
                  Image.asset(item['image'], height: 40.h, width: 40.w),

                  12.horizontalSpace,

                  // Item details
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['name'],
                            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)),
                        Text(item['category'], style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),

                  Expanded(child: Text(item['price'], style: TextStyle(fontSize: 15.sp))),

                  Flexible(
                      flex: 2,
                      child: Text(item['desc'],
                          style: TextStyle(fontSize: 14.sp), overflow: TextOverflow.ellipsis)),

                  Expanded(
                    child: Row(
                      children: [
                        Image.asset(item['tagIcon'], width: 16.w, height: 16.h),
                        6.horizontalSpace,
                        Text(item['tag'], style: TextStyle(fontSize: 14.sp)),
                      ],
                    ),
                  ),

                  // Status and actions
                  const StatusContainer(),
                ],
              ),
            );
          },
        ),
        24.verticalSpace,
        PageIndex(totalPages: totalPages),
      ],
    );
  }
}

class ReviewItembarname extends StatefulWidget {
  final String label;
  final Color color;
  final double fontSize;
  const ReviewItembarname(
      {super.key, required this.label, required this.color, required this.fontSize});
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

class StatusContainer extends StatefulWidget {
  const StatusContainer({super.key});

  @override
  State<StatusContainer> createState() => _StatusContainerState();
}

class _StatusContainerState extends State<StatusContainer> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 106.74,
            height: 41.30,
            decoration: ShapeDecoration(
              color: _isSwitched ? const Color(0xFF1C8113) : Color(0xFFFD5555),
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
        32.horizontalSpace,
        CupertinoSwitch(
          activeColor: const Color(0xFFC0987C),
          trackColor: const Color(0xFF757575),
          value: _isSwitched,
          onChanged: (bool value) {
            setState(() {
              _isSwitched = value;
            });
          },
        ),
        28.horizontalSpace,
        InkWell(
          onTap: () {
            context.navigateTo(MenuScreen(isEditmode: true));
          },
          child: Image.asset(
            'assets/images/edit_java_go.png',
            height: 43.h,
            width: 43.w,
          ),
        ),
        28.horizontalSpace,
        Image.asset(
          'assets/images/delete_java_go.png',
          height: 43.h,
          width: 43.w,
        )
      ],
    );
  }
}

class PageIndex extends ConsumerWidget {
  final int? totalPages;
  const PageIndex({super.key, this.totalPages = 10});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(paginationProvider);
    final notifier = ref.read(paginationProvider.notifier);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 57),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Showing text
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFF9B6842)),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            child: Text(
              'Showing ${currentPage + 1} to ${5} of 11 entries',
              // 'Showing ${currentPage * 5 + 1} to ${(currentPage + 1) * 5 > 11 ? 11 : (currentPage + 1) * 5} of 11 entries',
              style: TextStyle(
                color: Color(0xFF9B6842),
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Page number buttons
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: Color(0xFF887A72)),
                onPressed: () => notifier.previousPage(),
              ),
              for (int i = 0; i < totalPages!; i++) ...[
                8.horizontalSpace,
                InkWell(
                  onTap: () => notifier.goToPage(i),
                  child: Container(
                    width: 31.84,
                    height: 31.84,
                    decoration: BoxDecoration(
                      color: i == currentPage ? Color(0xFF461C10) : Color(0xFFEBEDEF),
                      borderRadius: BorderRadius.circular(46),
                    ),
                    child: Center(
                      child: Text(
                        '${i + 1}',
                        style: TextStyle(
                          color: i == currentPage ? Colors.white : Color(0xFF887A72),
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              8.horizontalSpace,
              IconButton(
                icon: Icon(Icons.arrow_forward, color: Color(0xFF887A72)),
                onPressed: () => notifier.nextPage(totalPages!),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
