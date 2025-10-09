import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/featuers/main_layout/widgets/person_tap/widgets/custom_drop_item.dart';

import 'package:myeventlyapp/featuers/main_layout/widgets/person_tap/widgets/information_continar.dart';

class PersonBody extends StatelessWidget {
  const PersonBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        information_continar(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              dropitemscontinar(
                lapel: 'theme',
                selated_item: 'light',
                items: ['light', 'dark'],
              ),
              SizedBox(height: 16.h),
              dropitemscontinar(
                lapel: 'language',
                selated_item: 'english',
                items: ['english', 'arabic'],
              ),
            ],
          ),
        ),
        Spacer(flex: 7),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              backgroundColor: ColorsManager.red,
            ),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 8.w),
                  Text(
                    'log out',
                    style: GoogleFonts.inter(
                      color: ColorsManager.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Spacer(flex: 1),
      ],
    );
  }
}
