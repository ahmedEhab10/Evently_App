import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';

class information_continar extends StatelessWidget {
  const information_continar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
        bottom: 16.0,
      ),
      width: double.infinity,

      decoration: BoxDecoration(
        color: ColorsManager.blue,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32.r)),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Image.asset('assets/images/Rectangle_rout.png'),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  'Ahmed Ehab',
                  style: GoogleFonts.inter(
                    color: ColorsManager.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'ahmedhobaa24@gmail.com',
                  style: GoogleFonts.inter(
                    color: ColorsManager.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
