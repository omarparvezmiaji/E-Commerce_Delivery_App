import 'package:flutter/material.dart';

import '../common_widgets/app_custom_buttom.dart';
import '../common_widgets/input_text.dart';
import '../styles/colors.dart';
import 'dashboard/dashboard_screen.dart';
import 'login.dart';


class ForgetPasswordScreen extends StatefulWidget {

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: <Widget>[

            //Image
            const Center(
                child: Image(
                  image: AssetImage("assets/delivery_man.png"),
                  width: 400,
                  height: 200,
                )),

            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              padding: const EdgeInsets.only(top: 10, left: 12, right: 12,),
              decoration: const BoxDecoration(
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(20), bottom: Radius.circular(20)),
                  color: Color(0xfff6f6f6)),
              //0xfff6f6f6
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),

                  const Text('Forgot Password', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),

                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 25),
                    child: Text('Enter your email address you registered with and we will send you a unique verification code'),
                  ),

                  inputField(context, controller: emailController, hintText: 'Email', keyboardType: TextInputType.emailAddress,
                      icon: const Icon(Icons.email_outlined, color: AppColors.iconColor), autofillHints: AutofillHints.email),

                  const SizedBox(
                    height: 20,
                  ),

                  appCustomButton(context, text: 'Reset Password', height: 50.0, width: 380.0, top: 15.0, left: 10.0, right: 10.0,
                      color: AppColors.blueDark, radius: 20.0,
                      press: (){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Dashboard()), (route) => false);
                        debugPrint('Email/Username: ${emailController.text}');
                      }),

                  const SizedBox(
                    height: 8,
                  ),

                  Align(
                      alignment: Alignment.center,
                      child: TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                          child: const Text('Back to login', style: TextStyle(fontSize: 15),))
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}