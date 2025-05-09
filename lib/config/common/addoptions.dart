import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:java_go/config/async_widget.dart';
import 'package:java_go/config/common/custom_text_feild.dart';
import 'package:java_go/home/model/get_menu_items.dart';

import 'package:java_go/home/notifier/add_options.dart';
import 'package:java_go/home/notifiers/menu_items.dart';

class Addoptions extends ConsumerWidget {
  const Addoptions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuItemState = ref.watch(menuItemsProvider);

    final fields = ref.watch(optionFieldProvider);
    final notifier = ref.read(optionFieldProvider.notifier);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: AsyncWidget(
          value: menuItemState,
          data: (data) {
            final items = menuItemState.value?.data;
            final groupedOptions = items?.groupedOptions ?? {};
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 955.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: const Icon(Icons.cancel_outlined),
                          color: const Color(0xFF6A442E),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Add Options',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF461C10),
                              ),
                        ),
                      ),
                      43.verticalSpace,
                      ...fields.asMap().entries.map((entry) {
                        final index = entry.key;
                        final key = entry.value;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      5.horizontalSpace,
                                      Text("Item Options",
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          )),
                                    ],
                                  ),
                                  5.verticalSpace,
                                  SizedBox(
                                    width: 250.w,
                                    child: GroupedDropdown(groupedOptions: groupedOptions),
                                  ),
                                ],
                              ),
                              56.horizontalSpace,
                              CustomTextField(
                                  labelText: 'Price',
                                  hintText: '£ 8',
                                  controller: TextEditingController()),
                              55.horizontalSpace,
                              CustomTextField(
                                  labelText: 'Additional note',
                                  controller: TextEditingController()),
                              16.horizontalSpace,
                              // Remove Button
                              if (fields.length > 1 && index != 0)
                                IconButton(
                                  icon: Image.asset(
                                    'assets/images/view.png',
                                    height: 38.h,
                                    width: 38.w,
                                  ),
                                  onPressed: () => notifier.removeField(key),
                                ),
                            ],
                          ),
                        );
                      }),
                      30.verticalSpace,
                      InkWell(
                        onTap: notifier.addField,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: const Color(0xFF2C851F),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.add, color: Colors.white),
                                8.horizontalSpace,
                                Text(
                                  'Add Another',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                216.verticalSpace,
                SizedBox(
                  width: 167.29,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Your submit logic here
                    },
                    child: const Text('ADD'),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class GroupedDropdown extends StatelessWidget {
  final Map<String, List<OptionSize>> groupedOptions;

  const GroupedDropdown({super.key, required this.groupedOptions});

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<String>> items = [];

    groupedOptions.forEach((optionName, sizes) {
      // Add a disabled header
      items.add(
        DropdownMenuItem<String>(
          enabled: false,
          child: Text(
            optionName,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
      );
      items.addAll(sizes.map((size) {
        return DropdownMenuItem<String>(
          value: size.addonSizeName,
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(size.addonSizeName ?? ''),
          ),
        );
      }));
    });
    return DropdownButtonFormField<String>(
      isExpanded: true,
      items: items,
      onChanged: (value) {},
      decoration: InputDecoration(
        fillColor: Color(0xFFF5F3F0),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        hintText: 'Select Option',
        hintStyle: const TextStyle(color: Color(0xFF6A442E)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFF6A442E),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFF6A442E),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFF6A442E),
            width: 1,
          ),
        ),
      ),
    );
  }
}
