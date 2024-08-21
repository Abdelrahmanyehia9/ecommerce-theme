import 'package:ecommercetemplate/core/router/app_router.dart';
import 'package:flutter/material.dart';

import '../../../core/style/text.dart';
import '../../../core/utils/validation.dart';
import '../../../core/widgets/app_buttons.dart';
import '../../../core/widgets/custom_text_feild.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController controller = TextEditingController() ;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>() ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24,),
              Text("Forgot password" ,style: KTextStyle.h1,) ,
              Text("Enter your email for the verification process. We will send 4 digits code to your email." , style: TextStyle(color: Colors.grey),) ,
              SizedBox(height: 18,),
              CustomTextField(hint: "Enter your email address", label: "Email", controller: controller,
                validation: (value)=>Validation.validateEmail(value??""),) ,
              Spacer() ,
              BigButton(label: "Send Code" , onTap: (){
                if(globalKey.currentState!.validate()){
                  Navigator.pushNamed(context, AppRouter.otpConfirm) ;
                }
              },) ,
              SizedBox(height: 16,)
            ],
          ),
        ),
      ),
    );
  }
}
