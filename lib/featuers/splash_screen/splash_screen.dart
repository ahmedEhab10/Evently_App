import 'package:flutter/material.dart';
import 'package:myeventlyapp/core/routes_manager/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.intro_screen);
    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(flex: 4),

          Image.asset('assets/images/Logo.png'),
          Spacer(),
          Image.asset('assets/images/Mask_group.png'),
        ],
      ),
    );
  }
}
