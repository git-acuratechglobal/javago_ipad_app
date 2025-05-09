import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/navigation.dart';
import 'package:java_go/home/account.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController currentPasswordController = TextEditingController();

  final TextEditingController newPasswordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F3F0),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Change Password',
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ChangePasswordField(
                label: 'Current Password', controller: currentPasswordController),
          ),
          80.verticalSpace,
          Center(
              child: ChangePasswordField(label: 'New Password', controller: newPasswordController)),
          80.verticalSpace,
          Center(
              child: ChangePasswordField(
                  label: 'Confirm Password', controller: confirmPasswordController)),
          40.verticalSpace,
          SizedBox(
            width: 345.w,
            height: 50.h,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFC0987C),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () {
                  context.pop();
                },
                child: Text('Update Password')),
          )
        ],
      ),
    );
  }
}

class ChangePasswordField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const ChangePasswordField({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
        13.verticalSpace,
        SizedBox(
          width: 488.w,
          height: 43.h,
          child: TextField(
            controller: controller,
            obscureText: true,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
