import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myeventlyapp/Models/onboard_page_model.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key, required this.onboardPageModel});
  final OnboardPageModel onboardPageModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(onboardPageModel.image),
          SizedBox(height: 16.h),
          Text(
            onboardPageModel.title,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: ColorsManager.blue,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            onboardPageModel.description,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
