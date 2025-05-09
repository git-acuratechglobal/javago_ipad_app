import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatsScreen extends StatefulWidget {
  StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  final List<StatsItem> statsData = [
    StatsItem(
      title: 'TOTAL NUMBER OF',
      subtitle: 'All Orders',
      count: '400+',
      imagePath: 'assets/images/ic_stats_image.png',
      frameIconPath: 'assets/images/ic_frame.png',
    ),
    StatsItem(
      title: 'TOTAL SALES IN USD',
      subtitle: 'Sales',
      count: '\$25K',
      imagePath: 'assets/images/ic_stats_image.png',
      frameIconPath: 'assets/images/ic_frame2.png',
    ),
    StatsItem(
      title: 'TOTAL SALES IN USD',
      subtitle: 'Sales',
      count: '\$25K',
      imagePath: 'assets/images/ic_stats_image.png',
      frameIconPath: 'assets/images/ic_frame3.png',
    ),
    StatsItem(
      title: 'TOTAL SALES IN USD',
      subtitle: 'Sales',
      count: '\$25K',
      imagePath: 'assets/images/ic_stats_image.png',
      frameIconPath: 'assets/images/ic_frame4.png',
    ),
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3F0),
      body: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 180, vertical: 0),
        itemCount: statsData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 160,
          childAspectRatio: 1.37,
        ),
        itemBuilder: (context, index) {
          return StatsCard(item: statsData[index]);
        },
      ),
    );
  }
}

class StatsItem {
  final String title;
  final String subtitle;
  final String count;
  final String imagePath;
  final String frameIconPath;

  StatsItem({
    required this.title,
    required this.subtitle,
    required this.count,
    required this.imagePath,
    required this.frameIconPath,
  });
}

class StatsCard extends StatefulWidget {
  final StatsItem item;
  const StatsCard({super.key, required this.item});

  @override
  State<StatsCard> createState() => _StatsCardState();
}

class _StatsCardState extends State<StatsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x29000000),
            blurRadius: 6,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // top row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.item.title,
                        style: TextStyle(
                          color: const Color(0xFF9B6842),
                          fontSize: 18.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: '\n',
                      ),
                      TextSpan(
                        text: widget.item.subtitle,
                        style: TextStyle(
                          color: const Color(0xFF461C10),
                          fontSize: 25.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Image.asset(
                  widget.item.imagePath,
                  height: 106.10,
                ),
              )
            ],
          ),

          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              widget.item.count,
              style: TextStyle(
                color: const Color(0xFF461C10),
                fontSize: 36.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 60.w,
              decoration: ShapeDecoration(
                color: const Color(0xFF9B6842),
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Image.asset(
                    widget.item.frameIconPath,
                    width: 39,
                    height: 39,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
