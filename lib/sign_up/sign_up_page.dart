import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:java_go/Theme/navigation.dart';

import 'package:java_go/config/common/widgets.dart';
import 'package:java_go/sign_up/reviewscreen.dart';

class SignUpPage extends ConsumerStatefulWidget {
  final bool isEditmode;
  const SignUpPage({
    super.key,
    required this.isEditmode,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
        });
      }
    } catch (e) {
      print("Image pick error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3F0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
            leading: widget.isEditmode 
      ?  InkWell(
          onTap: () {
            context.pop();
          },
            child: Image.asset(
          'assets/images/ic_left_arrow.png',
          color: Color(0xFF461C10),
          height: 55.h,
          width: 55.w,
        ))
      : null,
        backgroundColor: Color(0xFFF5F3F0),
        title: Text(
          'Sign up',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Color(0xFF461C10),
              ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.verticalSpace,
            Row(
              children: [
                Text(
                  'Cafe Name',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Color(0xFF461C10),
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Spacer(),
               if(widget.isEditmode) InkWell(
                onTap: (){},
                 child: Text(
                    'Undo',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
               ),
                23.horizontalSpace,
               if(widget.isEditmode) Padding(
                  padding: EdgeInsets.symmetric(horizontal: 42),
                  child: InkWell(
                    onTap: (){},
                    child: EditContainer(title: 'Save Changes')),
                )
              ],
            ),
            SizedBox(
                width: 366.w,
                child: TextField(
                  cursorColor: Color(0xFF4C2F27),
                  decoration: InputDecoration(
                      fillColor: Color(0xFFF5F3F0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF4C2F27),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF4C2F27),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      hintText: 'Enter cafename',
                      hintStyle:
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Color(0xFF7B7B7B),
                              )),
                )),
            18.verticalSpace,
            Row(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: 418.w,
                    height: 304.h,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x60000000),
                          blurRadius: 5,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Center(
                      child: _selectedImage == null
                          ? Center(
                              child: GestureDetector(
                                onTap: _pickImage,
                                child: Image.asset(
                                  'assets/images/plus-circle.png',
                                  height: 80.h,
                                  width: 80.w,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.file(
                                _selectedImage!,
                                width: 418.w,
                                height: 304.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 34),
                      child: Text(
                        'Phone Number',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: Color(0xFF694233),
                                fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 36),
                      child: SizedBox(
                          width: 227.w,
                          child: TextField(
                            cursorColor: Color(0xFF4C2F27),
                            decoration: InputDecoration(
                                fillColor: Color(0xFFF5F3F0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF4C2F27),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF4C2F27),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                hintText: '07 123456789',
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Color(0xFF1B0701),
                                    )),
                          )),
                    ),
                    57.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 48, ),
                      child: Text(
                        'Categories',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: Color(0xFF694233),
                                fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 35),
                      child: SizedBox(
                        height: 72,
                        width: 300,
                        child: Wrap(children: [CheckboxWidget()]),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 160),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: Color(0xFF694233),
                                fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                          width: 280.w,
                          child: TextField(
                            cursorColor: Color(0xFF4C2F27),
                            decoration: InputDecoration(
                              fillColor: Color(0xFFF5F3F0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF4C2F27),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF4C2F27),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              hintText:
                                  '21438 Ingomar, 34 Street, Barnet, EN5 2EH.',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Color(0xFF1B0701),
                                    overflow: TextOverflow.visible,
                                  ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.h, horizontal: 16.w),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            40.verticalSpace,
            Text(
              'Bio',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Color(0xFF694233), fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 975.w,
              child: TextField(
                  cursorColor: Color(0xFF4C2F27),
                  decoration: InputDecoration(
                    fillColor: Color(0xFFF5F3F0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF4C2F27),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF4C2F27),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    hintText:
                        "Cafe bio/ description Lorem Ipsum is simply dummy text of theprinting and typesetting industry.",
                    hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Color(0xFF1B0701),
                          overflow: TextOverflow.visible,
                        ),
                  )),
            ),
            70.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cafe Hours',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Color(0xFF694233), fontWeight: FontWeight.w600),
                ),
                //   9.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: 380.h,
                        child: CafeHoursScreen(),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Coffee Origin',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: Color(0xFF694233),
                                  fontWeight: FontWeight.w600),
                        ),
                        9.verticalSpace,
                        CustomContainer(
                          label: 'Single Origin',
                          containerWidth: 227.w,
                          containerHeight: 30.h,
                          borderColor: Colors.black,
                        ),
                        CustomContainer(
                          label: 'Blend',
                          containerWidth: 227.w,
                          containerHeight: 30.h,
                          borderColor: Colors.black,
                        ),
                        100.verticalSpace,
                        Text(
                          'Country Of Origin',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: Color(0xFF694233),
                                  fontWeight: FontWeight.w600),
                        ),
                        9.verticalSpace,
                        CustomContainer(
                          label: 'Single Origin',
                          containerWidth: 227.w,
                          containerHeight: 30.h,
                          borderColor: Colors.black,
                        ),
                      ],
                    ),
                    80.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Coffee Roast',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: Color(0xFF694233),
                                  fontWeight: FontWeight.w600),
                        ),
                        9.verticalSpace,
                        CustomContainer(
                          label: 'Light roast',
                          containerWidth: 227.w,
                          containerHeight: 30.h,
                          borderColor: Colors.black,
                        ),
                        CustomContainer(
                          label: 'Medium roast',
                          containerWidth: 227.w,
                          containerHeight: 30.h,
                          borderColor: Colors.black,
                        ),
                        CustomContainer(
                          label: 'Dark roast',
                          containerWidth: 227.w,
                          containerHeight: 30.h,
                          borderColor: Colors.black,
                        ),
                        66.verticalSpace,
                        Text(
                          'Specialty Coffee',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: Color(0xFF694233),
                                  fontWeight: FontWeight.w600),
                        ),
                        9.verticalSpace,
                        CustomContainer(
                          label: 'Yes',
                          containerWidth: 227.w,
                          containerHeight: 30.h,
                          borderColor: Colors.black,
                        ),
                        CustomContainer(
                          label: 'No',
                          containerWidth: 227.w,
                          containerHeight: 30.h,
                          borderColor: Colors.black,
                        ),
                      ],
                    ),
                    150.horizontalSpace,
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({super.key});

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  List<String> categories = [
    'Bubble tea',
    'Vegan',
    'Smoothie',
    'Sandwiches',
    'Vegetarian',
    'Halal',
  ];
  List<String> selectedCategory = [];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 3,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];
        final isChecked = selectedCategory.contains(category);

        return Row(
          children: [
            Checkbox(
              activeColor: const Color(0xFF694233),
              checkColor: Colors.white,
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    selectedCategory.add(category);
                  } else {
                    selectedCategory.remove(category);
                  }
                });
              },
            ),
            Expanded(
              child: Text(
                category,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      },
    );
  }
}


class CustomContainer extends StatelessWidget {
  final String label;
  final double containerWidth;
  final double containerHeight;
  final Color borderColor;

  const CustomContainer({
    Key? key,
    required this.label,
    required this.containerWidth,
    required this.containerHeight,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: borderColor),
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
