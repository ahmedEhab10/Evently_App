import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myeventlyapp/Providers/Theme_provider.dart';
import 'package:myeventlyapp/core/Prefs/Prefs_Manager.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:provider/provider.dart';

class information_widget extends StatelessWidget {
  const information_widget({super.key});

  @override
  Widget build(BuildContext context) {
    var themeprovaider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back ✨',
                  style: TextStyle(
                    color: ColorsManager.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Ahmed Ehab',
                  style: TextStyle(
                    color: ColorsManager.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    themeprovaider.changtheme(
                      themeprovaider.cuurrentTheme == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light,
                    );
                    PrefsManager.savecurrenttheme(
                      themeprovaider.cuurrentTheme == ThemeMode.light
                          ? "lIght"
                          : "Dark",
                    );
                  },
                  child: Icon(
                    themeprovaider.cuurrentTheme == ThemeMode.light
                        ? Icons.dark_mode
                        : Icons.sunny,
                    color: ColorsManager.white,
                    size: 24.sp,
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      'En',
                      style: TextStyle(
                        color: ColorsManager.blue,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 6.h),
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: ColorsManager.white,
              size: 24.sp,
            ),
            Text(
              'Cairo, Egypt',
              style: TextStyle(
                color: ColorsManager.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
