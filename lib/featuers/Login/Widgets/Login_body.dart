import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/core/widgets/Custom_elvetbuttom.dart';
import 'package:myeventlyapp/core/widgets/custom_text_form_faild.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmpasswordController;
  bool isvisible = false;
  bool isvisible2 = false;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 47.0),
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Image.asset('assets/images/evently_logo.png'),
              SizedBox(height: 20.h),

              custom_text_form_faild(
                controller: emailController,
                title: 'Email',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: (String? input) {
                  if (input == null || input.trim().isEmpty) {
                    return 'Please enter your email';
                  }
                  if (RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      ).hasMatch(input) ==
                      false) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12.h),
              custom_text_form_faild(
                controller: passwordController,
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
                validator: (String? input) {
                  if (input == null || input.trim().isEmpty) {
                    return 'Please enter your password';
                  }
                  if (input.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  if (RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                      ).hasMatch(input) ==
                      false) {
                    return "Weak Password";
                  }
                  return null;
                },
              ),
              SizedBox(height: 12.h),

              SizedBox(height: 12.h),

              Custom_ElevatedButton(
                title: 'Login',
                onPressed: () {
                  if (formkey.currentState?.validate() == false) return;
                },
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t Have Account ? ',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Create Account',
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
      ),
    );
  }
}
