import 'package:flutter/material.dart';
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
    return MaterialApp(
      onGenerateRoute: RoutesManger.router,
      initialRoute: AppRoutes.register,
    );
  }
}
