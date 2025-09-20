import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';

class custom_text_form_faild extends StatelessWidget {
  custom_text_form_faild({
    super.key,
    required this.title,
    required this.icon,
    this.suffixicon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onPressed,
  });
  final String title;
  final IconData? icon;
  final IconData? suffixicon;
  TextInputType keyboardType;
  bool obscureText;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: ColorsManager.blue, width: 1.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: ColorsManager.grey, width: 1.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: ColorsManager.red, width: 1.w),
        ),
        // labelStyle: GoogleFonts.inter(
        //   fontSize: 14.sp,
        //   fontWeight: FontWeight.w500,
        //   color: ColorsManager.grey,
        // ),

        // prefixIconColor: ColorsManager.grey,
        // suffixIconColor: ColorsManager.grey,
        labelText: title,
        prefixIcon: Icon(icon, color: ColorsManager.grey),
        suffixIcon: IconButton(
          onPressed: onPressed,
          color: ColorsManager.grey,
          icon: Icon(suffixicon),
        ),
      ),
    );
  }
}
