import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myeventlyapp/Models/User_Model.dart';
import 'package:myeventlyapp/core/res/colors_manager.dart';
import 'package:myeventlyapp/core/routes_manager/routes.dart';
import 'package:myeventlyapp/core/utils/UI_Utils.dart';
import 'package:myeventlyapp/core/widgets/Custom_elvetbuttom.dart';
import 'package:myeventlyapp/core/widgets/custom_text_form_faild.dart';
import 'package:myeventlyapp/featuers/Login/Widgets/google_login_button.dart';
import 'package:myeventlyapp/firebase/firebase_service.dart';

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
                  login();
                  // Navigator.pushNamed(context, AppRoutes.Main_layout);
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
                      Navigator.pushNamed(context, AppRoutes.register);
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
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: Divider(color: ColorsManager.blue, thickness: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Or ',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: ColorsManager.blue,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: ColorsManager.blue, thickness: 1),
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              GoogleLoginButton(),
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    try {
      UiUtils.showloading(context);
      final credential = await FirebaseService.login(
        emailAddress: emailController.text,
        password: passwordController.text,
      );
      UserModel.currentUser = await FirebaseService.getuserfromfirestore(
        credential.user!.uid,
      );
      UiUtils.showtoastmassage(
        backgroundColor: Colors.green,
        message: 'Account created successfully',
      );
      UiUtils.hideloading(context);
      Navigator.pushReplacementNamed(context, AppRoutes.Main_layout);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      UiUtils.hideloading(context);
      UiUtils.showtoastmassage(
        backgroundColor: Colors.red,
        message: 'email or password is wrong',
      );
    } catch (e) {
      UiUtils.showtoastmassage(
        backgroundColor: Colors.red,
        message: 'email or password is wrong',
      );
    }
  }
}
