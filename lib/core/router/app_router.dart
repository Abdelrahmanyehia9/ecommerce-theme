import 'package:ecommercetemplate/feature/authentication/view/forget_password_screen.dart';
import 'package:flutter/material.dart';

import '../../feature/authentication/view/login_screen.dart';
import '../../feature/authentication/view/sign_up_screen.dart';
import '../../feature/authentication/view/otp_confirmation_screen.dart';

class AppRouter{

static const loginPage= "/login" ;
static const signUpPage = "/signup" ;
static const forgetPassword = "/forgetPassword" ;
static const otpConfirm = "/OTPConfirm" ;

  static Map<String, Widget Function(BuildContext)> router = {

    AppRouter.signUpPage: (context) =>  const SignUpScreen(),
    loginPage: (context) => const LoginScreen(),
    forgetPassword :(context)=>const ForgetPasswordScreen(),
    otpConfirm :(context)=> OtpConfirmationScreen() ,

  };





}