import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/core/widgets/Custom_elvetbuttom.dart';

import 'package:myeventlyapp/core/widgets/custom_text_form_faild.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  bool isvisible = false;
  bool isvisible2 = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 47.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/evently_logo.png'),
            SizedBox(height: 20.h),
            custom_text_form_faild(
              title: 'Nmae',
              icon: Icons.person,
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 12.h),
            custom_text_form_faild(
              title: 'Email',
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 12.h),
            custom_text_form_faild(
              obscureText: isvisible,
              title: 'Password',
              icon: Icons.lock,
              suffixicon: isvisible ? Icons.visibility_off : Icons.visibility,
              keyboardType: TextInputType.visiblePassword,
              onPressed: () {
                setState(() {
                  isvisible = !isvisible;
                });
              },
            ),
            SizedBox(height: 12.h),
            custom_text_form_faild(
              obscureText: isvisible2,
              onPressed: () {
                setState(() {
                  isvisible2 = !isvisible2;
                });
              },
              title: 'Confirm Password',
              icon: Icons.lock,
              suffixicon: isvisible2 ? Icons.visibility_off : Icons.visibility,
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 12.h),

            Custom_ElevatedButton(title: 'Create Account'),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account ? ',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorsManager.blue,
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
