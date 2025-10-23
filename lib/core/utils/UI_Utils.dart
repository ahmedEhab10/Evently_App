import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';

class UiUtils {
  static void showtoastmassage({
    required Color backgroundColor,
    required String message,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void showloading(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => PopScope(
        canPop: false,
        child: Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: ColorsManager.blue,
            size: 200,
          ),
        ),
      ),
    );
  }

  static void hideloading(BuildContext context) {
    Navigator.pop(context);
  }
}
