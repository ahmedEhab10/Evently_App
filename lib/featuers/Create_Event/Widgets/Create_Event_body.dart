import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myeventlyapp/Models/category_model.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/core/widgets/Custom_tab_item.dart';
import 'package:myeventlyapp/core/widgets/Custom_tapbar.dart';

class CreateEventBody extends StatelessWidget {
  const CreateEventBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
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
        ],
      ),
    );
  }
}
