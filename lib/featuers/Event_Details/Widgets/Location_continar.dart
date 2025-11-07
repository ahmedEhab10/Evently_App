import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';

class LocationContinar extends StatelessWidget {
  const LocationContinar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.blue, width: 1.w),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/Svg/location.svg'),
          SizedBox(width: 8.w),
          Text(
            'Cairo , Egypt',
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: ColorsManager.blue,
            ),
          ),
          Spacer(),
          Icon(Icons.keyboard_arrow_right, color: ColorsManager.blue),
        ],
      ),
    );
  }
}
