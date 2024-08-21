import 'package:ecommercetemplate/core/router/app_router.dart';
import 'package:ecommercetemplate/core/utils/app_constants.dart';
import 'package:ecommercetemplate/feature/authentication/view/login_screen.dart';
import 'package:ecommercetemplate/feature/authentication/view/sign_up_screen.dart';
import 'package:flutter/material.dart';

void main(){


  runApp(const StoreShop()) ;
}

class StoreShop extends StatelessWidget {
  const StoreShop({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      theme: ThemeData(appBarTheme: AppBarTheme(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor ,
        foregroundColor: AppConstants.kPrimaryColor ,
      )),
     debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.signUpPage,
      routes: AppRouter.router

    );
  }
}
