import 'package:ecommercetemplate/core/utils/app_constants.dart';
import 'package:ecommercetemplate/core/utils/dimentions.dart';
import 'package:ecommercetemplate/feature/authentication/view/widget/text_button_labeled.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/style/text.dart';
import '../../../core/widgets/app_buttons.dart';

class OtpConfirmationScreen extends StatelessWidget {
  OtpConfirmationScreen({super.key});

  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Enter 4 Digit Code",
              style: KTextStyle.h1,
            ),
            const Text.rich(
              style: TextStyle(color: Colors.grey, fontSize: 16),
              TextSpan(
                children: [
                  TextSpan(
                      text: "cody.fisher45@example.com",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: " )",
                  )
                ],
                text: "Enter 4 digit code that your receive on your email( ",
              ),
            ),
const SizedBox(height: 16,) ,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Center(
                child: SizedBox(
                  width: screenWidth(context) * .775,
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    controller: otpController,
                    animationType: AnimationType.scale,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 50,
                      fieldWidth: 60,

                      activeFillColor: Theme.of(context).scaffoldBackgroundColor,
                      selectedFillColor: Theme.of(context).scaffoldBackgroundColor,
                      inactiveFillColor: Theme.of(context).scaffoldBackgroundColor,
                      activeColor: Colors.grey.shade200,
                      selectedColor: AppConstants.kPrimaryColor,
                      inactiveColor: Colors.grey.shade400,
                      inactiveBorderWidth: 1
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    animationDuration: const Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    onChanged: (value) {},
                  ),
                ),
              ),
            ),

            const TextButtonLabeled(hint: "Email not received?", label: " Resend code") ,
            const Spacer() ,
            BigButton(label: "Continue" , onTap: (){

            },) ,
            const SizedBox(height: 16,)


          ],
        ),
      ),
    );
  }
}
