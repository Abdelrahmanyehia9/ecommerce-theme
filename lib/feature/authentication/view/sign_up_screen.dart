import 'package:ecommercetemplate/core/style/text.dart';
import 'package:ecommercetemplate/core/utils/app_constants.dart';
import 'package:ecommercetemplate/core/widgets/app_buttons.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/custom_text_feild.dart';
import '../widget/diveder_with_text.dart';
import '../widget/text_button_labeled.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
 body: SafeArea(
   child: Padding(
     padding: EdgeInsets.all(16.0),
     child: SingleChildScrollView(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text("Create an account" ,style: KTextStyle.h1,) ,
           Text("Let’s create your account." , style: TextStyle(color: Colors.grey),) ,
           SizedBox(height: 18,),
           CustomTextField(hint: "Enter your full name", label: "Full name",),
           CustomTextField(hint: "Enter your email address", label: "Email",) ,
           CustomTextField(hint: "Enter your Password", label: "Password",) ,
           Padding(
             padding: EdgeInsets.all(8.0),
             child: Text("By signing up you agree to our Terms, Privacy Policy, and Cookie Use"),
           ) ,
           BigButton(label: "Sign up") ,
           DividerWithText(label: "Or",) ,
           BigIconButton(label: "Sign Up with Google" , svgPath: AppConstants.googleSvg,),
           Padding(
             padding: EdgeInsets.symmetric(vertical: 18.0),
             child: TextButtonLabeled (hint: "Already have an account?", label: "Log In", onTap: (){
               Navigator.pushNamed(context, "/login");
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
