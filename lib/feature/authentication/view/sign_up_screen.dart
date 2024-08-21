import 'package:ecommercetemplate/core/router/app_router.dart';
import 'package:ecommercetemplate/core/style/text.dart';
import 'package:ecommercetemplate/core/utils/app_constants.dart';
import 'package:ecommercetemplate/core/utils/validation.dart';
import 'package:ecommercetemplate/core/widgets/app_buttons.dart';
import 'package:ecommercetemplate/feature/authentication/view/widget/diveder_with_text.dart';
import 'package:ecommercetemplate/feature/authentication/view/widget/text_button_labeled.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/custom_text_feild.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "Create an account",
                    style: KTextStyle.h1,
                  ),
                  const Text(
                    "Let’s create your account.",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  CustomTextField(
                    hint: "Enter your full name",
                    label: "Full name",
                    controller: usernameController,
                    validation:(value)=>Validation.validatePassword(value ??"")
                  ),
                  CustomTextField(
                    hint: "Enter your email address",
                    label: "Email",
                    controller: emailController,
                    validation: (value)=> Validation.validateEmail(value??""),
                  ),
                  CustomTextField(
                    hint: "Enter your Password",
                    label: "Password",
                    controller: passwordController,
                    validation: (value)=> Validation.validatePassword(value??""),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        "By signing up you agree to our Terms, Privacy Policy, and Cookie Use"),
                  ),
                  const SizedBox(height: 16,),
                  BigButton(
                    label: "Sign up",
                    onTap: () {
                      if (globalKey.currentState!.validate()) {}
                    },
                  ),
                  const DividerWithText(
                    label: "Or",
                  ),
                  const BigIconSocialButton(
                    label: "Sign Up with Google",
                    svgPath: AppConstants.googleSvg,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: TextButtonLabeled(
                      hint: "Already have an account?",
                      label: "Log In",
                      onTap: () {
                        Navigator.pushNamed(context, AppRouter.loginPage);
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
