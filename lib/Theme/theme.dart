import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:java_go/Theme/extension.dart';

class Themes {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: "Poppins",
    // scaffoldBackgroundColor: Color(0xFFD7ED5D),
    colorScheme: ColorScheme.light(primary: Colors.white),
    
    textTheme: _textTheme.apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
    ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Color(0xFFC0987C), // ok , cancel buttons
          ),
        ),
     timePickerTheme: TimePickerThemeData(
            
            backgroundColor: Colors.white,
            dialHandColor: Color(0xFFC0987C),
            dialBackgroundColor: Colors.white,
            dialTextColor: WidgetStateColor.resolveWith((states) =>
                states.contains(WidgetState.selected)
                    ? Colors.white
                    : Color(0xFFC0987C)),
            entryModeIconColor: Colors.white,
            hourMinuteTextColor: Colors.white,
            hourMinuteColor:Color(0xFFC0987C),
            helpTextStyle: TextStyle(color: Color(0xFFC0987C), fontSize: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            dayPeriodColor: Color(0xFFC0987C),
            dayPeriodTextColor: WidgetStateColor.resolveWith((states) =>
              states.contains(WidgetState.selected)
                  ? Colors.white
                  : Color(0xFFC0987C)),
                  dayPeriodBorderSide: BorderSide(color: Color(0xFFC0987C),)
                  
          ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0x33253E3F),
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0x33253E3F),
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0x33253E3F),
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      filled: true,
      fillColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      //minimumSize: Size.fromHeight(20),
      //maximumSize: Size.fromWidth(20),
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4)
      ),
    //  padding:  EdgeInsets.all(20),

      //elevation: 4,
      backgroundColor: Color(0xFF461C10),
      foregroundColor: Colors.white,
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 18.sp,
        fontFamily: "Plus Jakarta Sans",
        fontWeight: FontWeight.w700,
      ),
    )),
  );
  static TextTheme get _textTheme {
    return Typography.englishLike2021.copyWith(
      headlineLarge: TextStyle(
        fontSize: 32.sp,
        // fontWeight: FontWeight.w500,
        color: Colors.white,
        fontFamily: "Poppins",
        fontVariations: FontVariations.w600,
        height: 1.10,
      ),
      headlineMedium: TextStyle(
        fontSize: 30.sp,
        fontFamily: "Poppins",
        fontVariations: FontVariations.w500,
        height: 1.10,
        letterSpacing: -0.56,
      ),
      headlineSmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 25.sp,
        fontVariations: FontVariations.w600,
      ),
      titleLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 24.sp,
        fontVariations: FontVariations.w400,
      ),
      titleMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18.0,
        fontVariations: FontVariations.w500,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 16.sp,
        fontVariations: FontVariations.w500,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15.sp,
        fontVariations: FontVariations.w400,
        // color: Color(0xFF777777)
      ),
      bodySmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 14.sp,
        fontVariations: FontVariations.w500,
        height: 1.30,
      ),
    );
  }
}
