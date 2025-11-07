import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';

class DateContinr extends StatelessWidget {
  const DateContinr({super.key});

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
          SvgPicture.asset('assets/Svg/Frame 78.svg'),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '21 November 2024 ',
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.blue,
                ),
              ),
              Text(
                '12:00 PM',
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
