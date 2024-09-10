import 'package:flutter/material.dart';
import '../../../core/style/text.dart';
import '../../../core/utils/validation.dart';
import 'package:ecommercetemplate/core/utils/dimentions.dart';

import '../../../core/widgets/app_buttons.dart';
import '../../../core/widgets/custom_text_feild.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  GlobalKey <FormState> globalKey = GlobalKey<FormState>() ;
  TextEditingController passwordController = TextEditingController() ;
  TextEditingController passwordConfirmController = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: globalKey,
          child: SingleChildScrollView(child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              const Text(
                "Reset Password",
                style: KTextStyle.h1,
              ),
              const Text(
                "Set the new password for your account so you can login and access all the features.",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 18,
              ),
              CustomTextField(
                hint: "Enter new password",
                label: "Password",
                controller: passwordController,
                validation: (value) => Validation.validatePassword(value ?? ""),
              ),
              CustomTextField(
                hint: "Confirm your password",
                label: "Password",
                controller: passwordConfirmController,
                validation: (value) => Validation.validatePassword(value ?? ""),
              ),
              SizedBox(height: screenHeight(context)*0.2),

              BigButton(
                label: "Continue",
                onTap: () {
                  if (globalKey.currentState!.validate()&& passwordController.text==passwordConfirmController.text ) {
                  }
                },
              ),
              const SizedBox(
                height: 16,
              )
            ],
          )),
        ),
      ),
    );
  }
}
