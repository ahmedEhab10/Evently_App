import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';

abstract class ThemeManager {
  static ThemeData lightTheme = ThemeData(
    // inputDecorationTheme: InputDecorationTheme(
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(14.r),
    //     borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
    //   ),
    //   errorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(14.r),
    //     borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
    //   ),

    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(14.r),
    //     borderSide: BorderSide(color: ColorsManager.grey, width: 1.w),
    //   ),
    //   focusedErrorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(14.r),
    //     borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
    //   ),
    //   // labelStyle: GoogleFonts.inter(
    //   //   fontSize: 14.sp,
    //   //   fontWeight: FontWeight.w500,
    //   //   color: ColorsManager.grey,
    //   // ),
    // ),
  );
  static ThemeData darkTheme = ThemeData.dark();
}
