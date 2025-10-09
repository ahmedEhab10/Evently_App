import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myeventlyapp/core/routes_manager/routes.dart';
import 'package:myeventlyapp/featuers/Create_Event/Create_evvet_screen.dart';
import 'package:myeventlyapp/featuers/Login/login.dart';
import 'package:myeventlyapp/featuers/Register/Register.dart';
import 'package:myeventlyapp/featuers/intro/intro_screen.dart';
import 'package:myeventlyapp/featuers/main_layout/main_ayout.dart';
import 'package:myeventlyapp/featuers/onboarding/onboarding.dart';
import 'package:myeventlyapp/featuers/splash_screen/splash_screen.dart';

class RoutesManger {
  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.start:
        {
          return CupertinoPageRoute(builder: (context) => SplashScreen());
        }
      case AppRoutes.intro_screen:
        {
          return CupertinoPageRoute(builder: (context) => IntroScreen());
        }
      case AppRoutes.onboarding:
        {
          return CupertinoPageRoute(builder: (context) => Onboarding());
        }
      case AppRoutes.register:
        {
          return CupertinoPageRoute(builder: (context) => Register());
        }
      case AppRoutes.login:
        {
          return CupertinoPageRoute(builder: (context) => Login());
        }
      case AppRoutes.Main_layout:
        {
          return CupertinoPageRoute(builder: (context) => Main_Ayout());
        }
      case AppRoutes.Crate_Event:
        {
          return CupertinoPageRoute(builder: (context) => CreateEvvetScreen());
        }
    }
  }
}
