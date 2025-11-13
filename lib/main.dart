import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myeventlyapp/Models/User_Model.dart';

import 'package:myeventlyapp/Providers/Theme_provider.dart';
import 'package:myeventlyapp/Providers/language_provider.dart';
import 'package:myeventlyapp/config/Theme/Theme_Manager.dart';
import 'package:myeventlyapp/core/Prefs/Prefs_Manager.dart';
import 'package:myeventlyapp/core/routes_manager/app_router.dart';
import 'package:myeventlyapp/core/routes_manager/routes.dart';
import 'package:myeventlyapp/firebase/FcmService.dart';
import 'package:myeventlyapp/firebase/firebase_service.dart';
import 'package:myeventlyapp/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await FlutterLocalization.instance.ensureInitialized();
  await PrefsManager.init();
  if (FirebaseAuth.instance.currentUser != null) {
    UserModel.currentUser = await FirebaseService.getuserfromfirestore(
      FirebaseAuth.instance.currentUser!.uid,
    );
  }
  FcmService.intfcm();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
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
          localizationsDelegates: AppLocalizations.localizationsDelegates,

          supportedLocales: [Locale("en"), Locale("ar")],
          locale: const Locale('en'),
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
