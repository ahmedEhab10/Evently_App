import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myeventlyapp/Models/category_model.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/core/widgets/Custom_tab_item.dart';
import 'package:myeventlyapp/core/widgets/Custom_tapbar.dart';
import 'package:myeventlyapp/core/widgets/custom_text_form_faild.dart';

class CreateEventBody extends StatelessWidget {
  const CreateEventBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset('assets/images/sport.png'),
          ),
          SizedBox(height: 8.h),
          CustomTabBar(
            categories: CategoryModel.categories,
            selectedBgColor: ColorsManager.blue,
            selectedFgColor: ColorsManager.white,
            unSelectedBgColor: ColorsManager.white,
            unSelectedFgColor: ColorsManager.blue,
          ),
          SizedBox(height: 8.h),
          Text(
            'Title',
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          custom_text_form_faild(
            title: 'Event Title',
            icon: Icons.title,
            validator: (String? p1) {},
            controller: null,
          ),
          SizedBox(height: 8.h),
          Text(
            'Description',
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          custom_text_form_faild(
            title: 'Event Description',
            icon: Icons.density_small_rounded,
            validator: (String? p1) {},
            controller: null,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
