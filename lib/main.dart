import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myeventlyapp/config/Theme/Theme_Manager.dart';
import 'package:myeventlyapp/core/routes_manager/app_router.dart';
import 'package:myeventlyapp/core/routes_manager/routes.dart';

void main() {
  runApp(const EventlyApp());
}

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 841),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        onGenerateRoute: RoutesManger.router,
        initialRoute: AppRoutes.register,
        theme: ThemeManager.lightTheme,
        darkTheme: ThemeManager.darkTheme,
      ),
    );
  }
}
