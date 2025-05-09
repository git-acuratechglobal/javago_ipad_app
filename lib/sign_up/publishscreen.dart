import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/home/bottombar.dart';

class Publishscreen extends StatefulWidget {
  const Publishscreen({super.key});

  @override
  State<Publishscreen> createState() => _PublishscreenState();
}

class _PublishscreenState extends State<Publishscreen> {
  bool istapped = false; // make this mutable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3F0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF5F3F0),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'SIGN UP',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: const Color(0xFF461C10), fontWeight: FontWeight.bold),
            ),
          ),
          207.verticalSpace,

          // Show this button only when Stripe is connected
          if (istapped)
            SizedBox(
              width: 244,
              height: 51,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC0987C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(38),
                  ),
                ),
                onPressed: () {
                  context.navigateTo(CustomBottomNavBar());
                },
                child: const Text('Publish'),
              ),
            ),
          
            45.verticalSpace,

          // Stripe connect button
          SizedBox(
            width: 244,
            height: 51,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC0987C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(38),
                ),
              ),
              onPressed: () {
                setState(() {
                  istapped = true; // enable the Publish button
                });
              },
              child: const Text('Connect to Stripe'),
            ),
          ),

          45.verticalSpace,
          Text(
            'Back',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF4C2F27),
            ),
          ),
        ],
      ),
    );
  }
}
