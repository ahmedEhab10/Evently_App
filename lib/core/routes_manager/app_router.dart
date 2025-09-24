import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myeventlyapp/core/routes_manager/routes.dart';
import 'package:myeventlyapp/featuers/Login/login.dart';
import 'package:myeventlyapp/featuers/Register/Register.dart';
import 'package:myeventlyapp/featuers/main_layout/main_ayout.dart';

class RoutesManger {
  static Route? router(RouteSettings settings) {
    switch (settings.name) {
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
    }
  }
}
