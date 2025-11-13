import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myeventlyapp/Models/User_Model.dart';
import 'package:myeventlyapp/Providers/Theme_provider.dart';
import 'package:myeventlyapp/Providers/language_provider.dart';
import 'package:myeventlyapp/core/Prefs/Prefs_Manager.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class information_widget extends StatelessWidget {
  const information_widget({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    var themeprovaider = Provider.of<ThemeProvider>(context);
    var langProvider = Provider.of<LanguageProvider>(context);
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
                  '${AppLocalizations.of(context)!.welcome_back}✨',
                  style: TextStyle(
                    color: ColorsManager.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  UserModel.currentUser!.name,
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
                GestureDetector(
                  onTap: () {
                    langProvider.changeAppLanguage(
                      langProvider.isEnglish ? "ar" : "en",
                    );
                  },
                  child: Container(
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
