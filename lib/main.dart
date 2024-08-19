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
    return  MaterialApp(
      theme: ThemeData
        (

      ),
      initialRoute: "/",
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const SignUpScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/login': (context) => const LoginScreen(),
      },

    );
  }
}
