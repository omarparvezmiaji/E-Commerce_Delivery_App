import 'package:delivery_app/common_widgets/app_button.dart';
import 'package:delivery_app/common_widgets/app_text.dart';
import 'package:delivery_app/screens/dashboard/dashboard_screen.dart';

//import 'package:delivery_app/dashboard/dashboard_screen.dart';
import 'package:delivery_app/modelClass/api_request/api.dart';
import 'package:delivery_app/navigator/navigator.dart';
import 'package:delivery_app/screens/login_screen.dart';
import 'package:delivery_app/styles/colors.dart';
import 'package:flutter/material.dart';

import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final String login_imagePath = "assets/delivery_man_Login.png";
  bool _isObscure = true;

  ///login
  var emailController = TextEditingController();
  var passwordlController = TextEditingController();

  ///for input field controller
  // var emailController     = TextEditingController();
  // var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 15,
          ),
          Center(
            child: Delivery_Service_TextWidget(),
          ),
          const Image(
            image: AssetImage('assets/delivery_man_Login.png'),
            height: 300,
            width: 300,
          ),
          Container(
            margin: const EdgeInsets.only(left: 35, right: 35, bottom: 40),
            child: Column(
              children: [
                TextField(
                  controller: emailController,

                  style: const TextStyle(color: Colors.black),

                  //    style: TextStyle(color: Colors.black),

                  decoration: InputDecoration(
                      fillColor: AppColors.fillColor,
                      filled: true,
                      hintText: "Email or Mobile No",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passwordlController,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    fillColor: AppColors.fillColor,
                    filled: true,
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      onPressed: () {
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewScreen()));
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPasswordScreen()));
                      },
                      child: const Text(
                        'Forgot Password?',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff4c505b),
                          fontSize: 18.0,
                        ),
                      )),
                ),
                getButton(context),
              ],
            ),
          ),
        ]),
      )),
    );
  }

  Widget Delivery_Service_TextWidget() {
    return AppText(
      text: "ABC Delivery Service",
      fontSize: 28.0,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryColor,
    );
  }

  Widget getButton(BuildContext context) {
    return AppButton(
      label: "Login",
      fontWeight: FontWeight.w700,
      padding: const EdgeInsets.symmetric(vertical: 25),
      onPressed: () {
        // onGetStartedClicked(context);

        if (emailController.text != '' && passwordlController.text != '') {
          // Navigator.of(context).pushReplacement(
          //   MaterialPageRoute(
          //     builder: (BuildContext context) {
          //       return const Dashboard();
          //     },
          //   ),
          // );

          //-----> Sending Login credentials <-----

          Login(context, emailController.text, passwordlController.text);
        } else if (emailController.text == '') {
          print('Please Enter a Phone Number');
        } else if (passwordlController.text == '') {
          print('Please Enter a Password');
        }
      },
    );
  }

  void onGetStartedClicked(BuildContext context) {
    Navigator.of(context).pushReplacement(new MaterialPageRoute(
      builder: (BuildContext context) {
        return const Dashboard();
      },
    ));
  }



// void onGetStartedClicked(BuildContext context) {
//   Navigator.of(context).pushReplacement(new MaterialPageRoute(
//     builder: (BuildContext context) {
//       return Navigator_Page();
//     },
//   ));
// }

}
