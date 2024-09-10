import 'package:flutter/material.dart';

import '../utils/app_constants.dart';

class ErrorLoading extends StatelessWidget {
  final String errorLabel ;
  const ErrorLoading({super.key, required this.errorLabel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 48.0 , left: 48 , top: 48),
            child: Center(child:Image.asset(AppConstants.errorLoading , fit: BoxFit.contain,)),
          ),
          SizedBox(height: 12,) ,
          Text("Oops , there was an error to $errorLabel , please try again later" ,textAlign: TextAlign.center, style: const TextStyle(fontSize: 12 , fontWeight: FontWeight.bold ,
            color: AppConstants.kPrimaryColor

          ),)
        ],
      ),
    );
  }
}
