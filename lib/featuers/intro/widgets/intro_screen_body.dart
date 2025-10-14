import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/core/routes_manager/routes.dart';
import 'package:myeventlyapp/core/widgets/Custom_elvetbuttom.dart';
import 'package:myeventlyapp/featuers/intro/widgets/Switchbutton.dart';

class IntroScreenBody extends StatelessWidget {
  const IntroScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/Evenntly_h_logo.png'),
        SizedBox(height: 12.h),
        Image.asset('assets/images/being-creative.png'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Personalize Your Experience',
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,

                  color: ColorsManager.blue,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dark Theme',
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorsManager.blue,
                    ),
                  ),
                  SwitchExample(),
                ],
              ),
              SizedBox(height: 16.h),
              Custom_ElevatedButton(
                title: 'Let\'s Start',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
