import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/core/routes_manager/routes.dart';
import 'package:myeventlyapp/core/widgets/Custom_elvetbuttom.dart';

import 'package:myeventlyapp/core/widgets/custom_text_form_faild.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
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
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 47.0),
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Image.asset('assets/images/evently_logo.png'),
              SizedBox(height: 20.h),
              custom_text_form_faild(
                title: 'Nmae',
                icon: Icons.person,
                keyboardType: TextInputType.name,
                validator: (String? input) {
                  if (input == null || input.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                  if (input.length < 3) {
                    return 'Name must be at least 4 characters';
                  }
                  return null;
                },
                controller: nameController,
              ),
              SizedBox(height: 12.h),
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
              custom_text_form_faild(
                controller: confirmpasswordController,
                obscureText: isvisible2,
                onPressed: () {
                  setState(() {
                    isvisible2 = !isvisible2;
                  });
                },
                title: 'Confirm Password',
                icon: Icons.lock,
                suffixicon: isvisible2
                    ? Icons.visibility_off
                    : Icons.visibility,
                keyboardType: TextInputType.visiblePassword,
                validator: (String? input) {
                  if (input == null || input.trim().isEmpty) {
                    return 'Please enter your password';
                  }
                  if (input != passwordController.text) {
                    return 'Password does not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12.h),

              Custom_ElevatedButton(
                title: 'Create Account',
                onPressed: () {
                  // if (formkey.currentState?.validate() == false) {
                  //   return;
                  // }
                  ;
                  Navigator.pushNamed(context, AppRoutes.Main_layout);
                },
              ),
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
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.login);
                    },
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
      ),
    );
  }
}
