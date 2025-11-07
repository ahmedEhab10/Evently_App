import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 16.r),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: ColorsManager.blue),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/Svg/google logo.svg'),
            SizedBox(width: 8.w),
            Text(
              'Login with Google',

              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: ColorsManager.blue,

                fontStyle: FontStyle.italic,
                decorationColor: ColorsManager.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
