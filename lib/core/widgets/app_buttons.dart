import 'package:ecommercetemplate/core/utils/app_constants.dart';
import 'package:ecommercetemplate/core/utils/dimentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BigButton extends StatelessWidget {
  final String label ;
  const BigButton({super.key , required this.label});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
      fixedSize: Size(screenWidth(context), 60) , backgroundColor: AppConstants.kPrimaryColor ,foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12) ,
    ) ,
      
    ), child:Text(label) ,  );
  }
}
class BigIconButton extends StatelessWidget {
  final String label ;
  final String svgPath ;
  const BigIconButton({super.key , required this.label  , required this.svgPath});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
      fixedSize: Size(screenWidth(context), 60) , backgroundColor: Colors.grey.shade50 ,foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12) ,
      ) ,

    ), child:Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(svgPath),
        const SizedBox(width: 6,) ,
        Text(label),
      ],
    ) ,  );
  }
}
