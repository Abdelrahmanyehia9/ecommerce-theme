import 'package:ecommercetemplate/feature/authentication/view/forget_password_screen.dart';
import 'package:ecommercetemplate/feature/home/view/home_screen.dart';
import 'package:ecommercetemplate/feature/product/view/single_product_screen.dart';
import 'package:flutter/material.dart';
import '../../feature/authentication/view/login_screen.dart';
import '../../feature/authentication/view/sign_up_screen.dart';
import '../../feature/authentication/view/otp_confirmation_screen.dart';
import '../../feature/home/view/all_product_view.dart';
import '../../feature/home/view/home_v2.dart';




class AppRouter{

static const loginPage= "/login" ;
static const signUpPage = "/signup" ;
static const forgetPassword = "/forgetPassword" ;
static const otpConfirm = "/OTPConfirm" ;
static const homeScreen = "/home" ;
static const homeV2 = "/homeV2";
static const singleProductScreen = "/singleProduct" ;

  static Map<String, Widget Function(BuildContext)> router = {

    AppRouter.signUpPage: (context) =>   const SignUpScreen(),
    loginPage: (context) => const LoginScreen(),
    homeV2: (context) {
      final args = ModalRoute.of(context)?.settings.arguments as int;
      return HomeScreenV2(id: args); // Passing the parameter
    },
    homeScreen:(context)=>const HomeScreen() ,
    forgetPassword :(context)=>const ForgetPasswordScreen(),
    otpConfirm :(context)=> OtpConfirmationScreen() ,
    singleProductScreen :(context)=> const SingleProductScreen() ,



  };





}