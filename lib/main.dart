import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myeventlyapp/Providers/Theme_provider.dart';
import 'package:myeventlyapp/config/Theme/Theme_Manager.dart';
import 'package:myeventlyapp/core/Prefs/Prefs_Manager.dart';
import 'package:myeventlyapp/core/routes_manager/app_router.dart';
import 'package:myeventlyapp/core/routes_manager/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const EventlyApp(),
    ),
  );
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
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesManger.router,
          initialRoute: AppRoutes.start,
          theme: ThemeManager.light, // هنا بيتبني بعد init
          darkTheme: ThemeManager.dark,
          themeMode: Provider.of<ThemeProvider>(context).cuurrentTheme,
        );
      },
    );
  }
}
