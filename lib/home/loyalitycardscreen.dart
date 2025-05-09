import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/config/common/widgets.dart';
import 'package:java_go/sign_up/loyalitycard.dart';
import 'package:java_go/sign_up/reviewscreen.dart';

class LoyalityCardScreen2 extends StatefulWidget {
  const LoyalityCardScreen2({super.key});

  @override
  State<LoyalityCardScreen2> createState() => _LoyalityCardScreen2State();
}

class _LoyalityCardScreen2State extends State<LoyalityCardScreen2> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 21, vertical: 36),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  context.navigateTo(LoyalityCardScreen(isEditMode: true,));
                },
                child: EditContainer(
                  title: 'Edit Stamp',
                  icon: (Icons.add_circle_outline),
                ),
              )),
          38.verticalSpace,
       LoyalityCard()
        ],
      ),
    );
  }
}


class LoyalityCard extends StatefulWidget {
  const LoyalityCard({super.key});

  @override
  State<LoyalityCard> createState() => _LoyalityCardState();
}

class _LoyalityCardState extends State<LoyalityCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
children: [
     Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              width: 1076.w,
              height: 59.h,
              decoration: BoxDecoration(color: Color(0xFF9B6842)),
              child: Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 255.w,
                    child: ReviewItembarname(
                      label: 'Loyalty Stamp Color',
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    width: 255.w,
                    child: ReviewItembarname(
                      label: '%  or £ off  of next order',
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    width: 255.w,
                    child: ReviewItembarname(
                      label: 'Minimum Order Value',
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    width: 255.w,
                    child: ReviewItembarname(
                      label: 'No of Total Stamp ',
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 17),
            width: 1076.w,
            child: Column(
              children: [
                19.verticalSpace,
                Row(
                  children: [
                    SizedBox(
                  width: 275.w,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset(
                            'assets/images/ic_loyality_card.png',
                            width: 56,
                            height: 54,
                          ),
                        )),
                    SizedBox(
               width: 255.w,
                      child: ReviewItembarname(
                        label: '40%',
                        color: Color(0xFF1B0701),
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
               width: 255.w,
                      child: ReviewItembarname(
                        label: '£ 550.00 ',
                        color: Color(0xFF1B0701),
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(
                width: 255.w,
                      child: ReviewItembarname(
                        label: '10',
                        color: Color(0xFF1B0701),
                        fontSize: 16.sp,
                      ),
                    ),
                   
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: const Color(0xFFC0987C),
                )
              ],
            ),
          )
],
    );
  }
}