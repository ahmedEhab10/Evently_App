import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myeventlyapp/Models/onboard_page_model.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/featuers/onboarding/widgets/onboard_page.dart';

class Onboardingbody extends StatelessWidget {
  const Onboardingbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/Evenntly_h_logo.png'),
          Expanded(
            child: PageView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                OnboardPageModel.onboardPages.length,
                (index) => OnboardPage(
                  onboardPageModel: OnboardPageModel.onboardPages[index],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  border: Border.all(color: ColorsManager.blue, width: 1.w),
                ),
                child: Icon(Icons.arrow_back, color: ColorsManager.blue),
              ),
              Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  border: Border.all(color: ColorsManager.blue, width: 1.w),
                ),
                child: Icon(Icons.arrow_forward, color: ColorsManager.blue),
              ),
            ],
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}



//Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: List.generate(
        //     OnboardPageModel.onboardPages.length,
        //     (index) => Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Container(
        //         width: 10,
        //         height: 10,
        //         decoration: BoxDecoration(
        //           shape: BoxShape.circle,
        //           color: index == 0 ? ColorsManager.blue : Colors.grey,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),