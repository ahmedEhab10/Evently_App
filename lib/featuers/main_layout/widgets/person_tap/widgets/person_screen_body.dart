import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myeventlyapp/Providers/Theme_provider.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/featuers/main_layout/widgets/person_tap/widgets/CustomDropDownItem.dart';
import 'package:provider/provider.dart';

class PersonScreenBody extends StatelessWidget {
  const PersonScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var themeprovider = Provider.of<ThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
          width: double.infinity,

          decoration: BoxDecoration(
            color: ColorsManager.red,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(36.r)),
          ),
          child: SafeArea(
            bottom: false,
            left: false,
            right: false,
            child: Row(
              children: [
                Image.asset('assets/images/routprofile.png'),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ahmed Ehab",
                        style: GoogleFonts.inter(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.white,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "ahmedhobaa24@gmail.com",
                        style: GoogleFonts.inter(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 24.h),
        Customdropdownitem(
          onChange: (newTheme) {
            themeprovider.changtheme(
              newTheme == 'Light' ? ThemeMode.light : ThemeMode.dark,
            );
          },
          label: 'Theme',
          selectedLabel: themeprovider.cuurrentTheme == ThemeMode.light
              ? 'Light'
              : 'Dark',
          menuItems: ['Light', 'Dark'],
        ),
        SizedBox(height: 16.h),
        Customdropdownitem(
          onChange: (newLang) {},
          label: 'Language',
          selectedLabel: 'English',
          menuItems: ["English", "Arabic"],
        ),
        Spacer(flex: 8),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
              backgroundColor: ColorsManager.red,
              foregroundColor: ColorsManager.white,
              textStyle: GoogleFonts.inter(
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: ColorsManager.white,
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.logout),

                SizedBox(width: 8.h),
                Text('Logout'),
              ],
            ),
          ),
        ),
        Spacer(flex: 2),
      ],
    );
  }
}
