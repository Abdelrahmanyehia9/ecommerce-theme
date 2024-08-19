import 'package:ecommercetemplate/core/utils/app_constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;

  final String hint;

  final String Function(String?)? validation;

  const CustomTextField(
      {super.key, required this.label, required this.hint, this.validation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
              validator: validation,
              cursorColor: AppConstants.kPrimaryColor,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppConstants.kPrimaryColor,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  hintText: hint,
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                  suffixIcon:
                      label == "Password" ? const Icon(Icons.visibility , color: Colors.grey,) : null)),
        ],
      ),
    );
  }
}
