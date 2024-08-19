import 'package:ecommercetemplate/core/utils/dimentions.dart';
import 'package:flutter/material.dart';

import '../../../core/style/text.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/widgets/app_buttons.dart';
import '../../../core/widgets/custom_text_feild.dart';
import '../widget/diveder_with_text.dart';
import '../widget/text_button_labeled.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Login to your account" ,style: KTextStyle.h1,) ,
                Text("It’s great to see you again." , style: TextStyle(color: Colors.grey),) ,
                SizedBox(height: 18,),
                CustomTextField(hint: "Enter your email address", label: "Email",) ,
                CustomTextField(hint: "Enter your Password", label: "Password",) ,
                Padding(
                  padding: EdgeInsets.only(bottom: 24.0 , top:  8  , left: 8  , right: 8),
                  child: TextButtonLabeled (hint: "Forgot you password", label: "Reset password", isPasswordReset :true),
                )  ,
                BigButton(label: "Login") ,
                DividerWithText(label: "Or",) ,
                BigIconButton(label: "Login with Google" , svgPath: AppConstants.googleSvg,),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 18.0),
                  child: TextButtonLabeled (hint: "Don’t have an account?", label: "Join", onTap: (){
                    Navigator.pushNamed(context, "/");

                  },),
                )  ,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
