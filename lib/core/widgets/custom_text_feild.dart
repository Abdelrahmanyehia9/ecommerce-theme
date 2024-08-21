import 'package:ecommercetemplate/core/utils/app_constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;

  final String? Function(String?)? validation;
  final bool? error;

  const CustomTextField(
      {super.key,
      required this.label,
      required this.hint,
      this.validation,
      required this.controller,
      this.error});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool textHidden = true;
  String? errorText ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
              controller: widget.controller,
              obscureText: widget.label == "Password" && textHidden == true
                  ? true
                  : false,
              validator: (value) {
                String? validationResult = widget.validation?.call(value);
                setState(() {
                  errorText = validationResult;
                });
                return validationResult;
              },
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
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppConstants.kPrimaryColor,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  hintText: widget.hint,
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
                  suffixIcon:
                  errorText != null ? const Icon(Icons.error_outline , color: Colors.red,):
                  widget.label == "Password"
                      ? InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              textHidden = !textHidden;
                            });
                          },
                          child: Icon(
                            textHidden == false
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ))
                      : null)),
        ],
      ),
    );
  }
}
