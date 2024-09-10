import 'package:flutter/material.dart';

import '../../../../core/utils/app_constants.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return           TextFormField(

        cursorColor: AppConstants.kPrimaryColor,
        decoration: InputDecoration(
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(12)),
            errorStyle: const TextStyle(color: Colors.red),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(12)),
            contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppConstants.kPrimaryColor,
                ),
                borderRadius: BorderRadius.circular(8)),
            hintText: "Search for clothes...",
            prefixIcon: Icon(Icons.search , color: Colors.grey.shade400,),
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 16 , fontWeight: FontWeight.w300),
    )
    ) ;


  }
}
