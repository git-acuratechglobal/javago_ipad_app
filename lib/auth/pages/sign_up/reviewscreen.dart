import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/config/common/widgets.dart';
import 'package:java_go/home/loyalitycardscreen.dart';

class Reviewscreen extends StatefulWidget {
  const Reviewscreen({super.key});

  @override
  State<Reviewscreen> createState() => _ReviewscreenState();
}

class _ReviewscreenState extends State<Reviewscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F3F0),
        automaticallyImplyLeading: false,
        title: Text(
          'REVIEW',
          style: TextStyle(
            color: const Color(0xFF461C10),
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 26),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'EMAIL ID: CAFE@HOTMAIL.CO.UK',
            style: TextStyle(
              color: const Color(0xFF461C10),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          25.verticalSpace,
          Text(
            'PASSWORD: XXXXXXX',
            style: TextStyle(
              color: const Color(0xFF461C10),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          12.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 47),
            child: Divider(
              thickness: 1,
              color: Color(0xFFA0A0A0),
            ),
          ),
          25.verticalSpace,
          Row(
            children: [
              Text(
                'Emily’s cafe',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Color(0xFF694233), fontWeight: FontWeight.w600),
              ),
              Expanded(
                child: Align(
                    alignment: Alignment.topRight,
                    child: EditContainer(
                      title: 'Edit Profile',
                      icon: (Icons.add_circle_outline),
                    )),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(width: 423.w, height: 282.h, child: Image.asset('assets/images/cafe.png')),
              60.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Phone Number',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Color(0xFF694233),
                          )),
                  11.verticalSpace,
                  Text(
                    '07 123456789',
                    style: TextStyle(
                      color: const Color(0xFF1B0701),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  30.verticalSpace,
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Categories',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: Color(0xFF694233),
                            )),
                    11.verticalSpace,
                    Text(
                      'Bubble \n Vegan \n Smoothie',
                      style: TextStyle(
                        color: const Color(0xFF1B0701),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ])
                ],
              ),
              124.horizontalSpace,
              Padding(
                padding: EdgeInsets.only(bottom: 150),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Address',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: Color(0xFF694233),
                            )),
                    11.verticalSpace,
                    Text(
                      '21438 Ingomar, 34 Street, Barnet, EN5 2EH.',
                      style: TextStyle(
                        color: const Color(0xFF1B0701),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          67.verticalSpace,
          Text(
            'Bio',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Color(0xFF694233),
                ),
          ),
          SizedBox(
            width: 996,
            height: 77,
            child: Text(
              "Cafe bio/ description Lorem Ipsum is simply dummy text of the  printing and typesetting industry. Cafe bio/ description Lorem  Ipsum is simply dummy text of the printing and typesetting  industry. Cafe bio/ description Lorem Ipsum is simply dummy text of the     printing and typesetting industry.  ",
              style: TextStyle(
                color: const Color(0xFF727272),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          17.verticalSpace,
          Text(
            'Cafe Hours',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Color(0xFF694233), fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 300.h,
            width: 350.w,
            child: Reviewtiming(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 47),
            child: Divider(
              thickness: 1,
              color: Color(0xFFA0A0A0),
            ),
          ),
          25.verticalSpace,
          Row(
            children: [
              Text(
                'Click and Collect: ',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              40.horizontalSpace,
              Text(
                'Opted in ',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Expanded(
                child: Align(
                    alignment: Alignment.topRight,
                    child: EditContainer(
                      title: 'Edit',
                      icon: (Icons.add_circle_outline),
                    )),
              )
            ],
          ),
          30.verticalSpace,
          Row(
            children: [
              Text(
                'Maximum orders: ',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              40.horizontalSpace,
              Text(
                'No limit  ',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          24.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 47),
            child: Divider(
              thickness: 1,
              color: Color(0xFFA0A0A0),
            ),
          ),
          35.verticalSpace,
          ReviewItems(),
          41.verticalSpace,
          // PageIndex(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 47),
            child: Divider(
              thickness: 1,
              color: Color(0xFFA0A0A0),
            ),
          ),
          29.verticalSpace,
          Align(
              alignment: Alignment.topRight,
              child: EditContainer(
                title: 'Edit Stamp',
                icon: (Icons.add_circle_outline),
              )),
          38.verticalSpace,
          LoyalityCard()
        ]),
      ),
    );
  }
}

class EditContainer extends StatefulWidget {
  final String title;
  final IconData? icon;
  const EditContainer({
    super.key,
    required this.title,
    this.icon,
  });

  @override
  State<EditContainer> createState() => _EditContainerState();
}

class _EditContainerState extends State<EditContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 178.w,
      height: 50.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color(0xFF9B6842),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.icon != null) ...[
            Icon(
              widget.icon,
              color: Colors.white,
            ),
            SizedBox(width: 10),
          ],
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
