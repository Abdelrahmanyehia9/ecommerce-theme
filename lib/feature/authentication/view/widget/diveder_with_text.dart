import 'package:ecommercetemplate/core/utils/dimentions.dart';
import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Expanded(child: Container( color: Colors.grey.shade300, height: 1,))  ,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(label , style: const TextStyle(color: Colors.grey),),
        ),
        Expanded(child: Container( color: Colors.grey.shade300, height: 1,))  ,


      ],),
    );
  }
}
