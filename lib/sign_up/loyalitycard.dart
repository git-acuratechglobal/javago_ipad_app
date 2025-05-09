import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/config/common/widgets.dart';
import 'package:java_go/sign_up/reviewscreen.dart';

class LoyalityCardScreen extends StatefulWidget {
  const LoyalityCardScreen({super.key, required this.isEditMode});
final bool  isEditMode; 
  @override
  State<LoyalityCardScreen> createState() => _LoyalityCardScreenState();
}

class _LoyalityCardScreenState extends State<LoyalityCardScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F3F0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFF5F3F0),
         leading: widget.isEditMode 
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
        title: Text(
          'LOYALTY CARD',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF461C10),
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 33),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(widget.isEditMode) Align(
              alignment: Alignment.centerRight,
              child: EditContainer(title: 'Save Changes')),
            49.verticalSpace,
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoyalityText(title: 'Stamp Card Color*'),
                    16.verticalSpace,
                    SizedBox(height: 54.h, width: 520.w, child: Dropdown('', Color(0xFF7B7B7B))),
                  ],
                ),
                77.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoyalityText(title: 'No Of Total Stamp'),
                    16.verticalSpace,
                    SizedBox(
                        height: 54.h,
                        width: 520.w,
                        child: Dropdown('Please select stamp', Color(0xFF7B7B7B))),
                  ],
                ),
              ],
            ),
            60.verticalSpace,
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoyalityText(title: 'Discount in % Or £ '),
                    16.verticalSpace,
                    SizedBox(
                        height: 54.h,
                        width: 520.w,
                        child: Dropdown('Please select % or £', Color(0xFF7B7B7B))),
                  ],
                ),
                77.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoyalityText(title: '% Or £XX Off Of Next Order '),
                    16.verticalSpace,
                    SizedBox(
                        height: 54.h,
                        width: 520.w,
                        child: SizedBox(
                            height: 54.h,
                            width: 520.w,
                            child: TextField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF4C2F27),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF4C2F27),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                ),
                                hintText: 'Enter % or £',
                                hintStyle: TextStyle(
                                  color: const Color(0xFF7B7B7B),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )))
                  ],
                ),
              ],
            ),
            60.verticalSpace,
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoyalityText(title: 'Exclude Item'),
                    16.verticalSpace,
                    SizedBox(
                        height: 54.h,
                        width: 520.w,
                        child: Dropdown('Please select item', Color(0xFF7B7B7B))),
                  ],
                ),
                77.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoyalityText(title: 'Minimum Order Value '),
                    16.verticalSpace,
                    SizedBox(
                        height: 54.h,
                        width: 520.w,
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF4C2F27),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF4C2F27),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                            ),
                            hintText: 'Enter order value',
                            hintStyle: TextStyle(
                              color: const Color(0xFF7B7B7B),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ))
                  ],
                ),
              ],
            ),
            60.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoyalityText(title: 'Categories discount applies to '),
                16.verticalSpace,
                SizedBox(
                    height: 54.h,
                    width: 520.w,
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF4C2F27),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF4C2F27),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                        ),
                        prefixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              activeColor: Color(0xFF7B7B7B),
                              checkColor:  Color(0xFFF5F3F0),
                             
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value ??
                                      false;
                                });
                              },
                            ),
                            Text(
                              'All',
                              style: TextStyle(
                                color: const Color(0xFF7B7B7B),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoyalityText extends StatefulWidget {
  final String title;
  const LoyalityText({super.key, required this.title});

  @override
  State<LoyalityText> createState() => _LoyalityTextState();
}

class _LoyalityTextState extends State<LoyalityText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      style: TextStyle(
        color: const Color(0xFF4C2F27),
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
