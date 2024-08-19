import 'package:ecommercetemplate/core/utils/app_constants.dart';
import 'package:flutter/material.dart';

class TextButtonLabeled extends StatelessWidget {
  final String hint ;
  final String label ;
  final bool? isPasswordReset ;
  final GestureTapCallback? onTap ;
  const TextButtonLabeled({super.key , required this.hint ,  required this.label  , this.isPasswordReset  , this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: isPasswordReset == true? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        Text(hint , style: TextStyle(color: Colors.grey , fontSize: isPasswordReset ==true ? 14 : 16 ),) ,
        const SizedBox(width: 4,) ,
        InkWell(
          onTap: onTap,
          child: Text(label , style: TextStyle(fontWeight: FontWeight.bold , fontSize:isPasswordReset ==true ?14 :  16 ,
          decoration: TextDecoration.underline
          )),
        )
      ],
    );
  }
}
