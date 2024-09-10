import 'package:ecommercetemplate/core/router/app_router.dart';
import 'package:ecommercetemplate/core/utils/validation.dart';
import 'package:ecommercetemplate/feature/authentication/view/widget/diveder_with_text.dart';
import 'package:ecommercetemplate/feature/authentication/view/widget/text_button_labeled.dart';
import 'package:flutter/material.dart';

import '../../../core/style/text.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/widgets/app_buttons.dart';
import '../../../core/widgets/custom_text_feild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Login to your account",
                    style: KTextStyle.h1,
                  ),
                  Text(
                    "It’s great to see you again.",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  CustomTextField(
                    hint: "Enter your email address",
                    label: "Email",
                    controller: emailController,
                    validation: (value) =>
                        Validation.validateEmail(value ?? ""),
                  ),
                  CustomTextField(
                    hint: "Enter your Password",
                    label: "Password",
                    controller: passwordController,
                    validation: (value) =>
                        Validation.validatePassword(value ?? ""),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 24.0, top: 8, left: 8, right: 8),
                    child: TextButtonLabeled(
                      hint: "Forgot you password",
                      label: "Reset password",
                      isPasswordReset: true,
                      onTap: () {
                        Navigator.pushNamed(context, AppRouter.forgetPassword);
                      },
                    ),
                  ),
                  BigButton(
                    label: "Login",
                    onTap: () {
                      if (globalKey.currentState!.validate()) {
                        print(passwordController.text);
                        print(emailController.text);
                      }
                    },
                  ),
                  DividerWithText(
                    label: "Or",
                  ),
                  BigIconSocialButton(
                    label: "Login with Google",
                    svgPath: AppConstants.googleSvg,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 18.0),
                    child: TextButtonLabeled(
                      hint: "Don’t have an account?",
                      label: "Join",
                      onTap: () {
                        Navigator.pushNamed(context, AppRouter.signUpPage);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
