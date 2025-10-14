import 'dart:math';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myeventlyapp/Models/onboard_page_model.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/featuers/onboarding/widgets/onboard_page.dart';

class Onboardingbody extends StatefulWidget {
  const Onboardingbody({super.key});

  @override
  State<Onboardingbody> createState() => _OnboardingbodyState();
}

class _OnboardingbodyState extends State<Onboardingbody> {
  final PageController _pageController = PageController();
  int currentPageIndex = 0;
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
              controller: _pageController,
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
              Visibility(
                visible: currentPageIndex > 0,
                child: GestureDetector(
                  onTap: () {
                    if (currentPageIndex > 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                      setState(() {
                        currentPageIndex--;
                      });
                    }
                  },
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(color: ColorsManager.blue, width: 1.w),
                    ),
                    child: Icon(Icons.arrow_back, color: ColorsManager.blue),
                  ),
                ),
              ),
              DotsIndicator(
                dotsCount: OnboardPageModel.onboardPages.length,
                position: currentPageIndex.toDouble(),
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: ColorsManager.white, // Inactive color
                  activeColor: ColorsManager.blue,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (currentPageIndex <
                      OnboardPageModel.onboardPages.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                    setState(() {
                      currentPageIndex++;
                    });
                  } else {
                    Navigator.pushNamed(context, '/login');
                  }
                },
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(color: ColorsManager.blue, width: 1.w),
                  ),
                  child: Icon(Icons.arrow_forward, color: ColorsManager.blue),
                ),
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