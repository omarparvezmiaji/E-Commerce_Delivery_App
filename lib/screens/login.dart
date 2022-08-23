import 'package:delivery_app/common_widgets/app_button.dart';
import 'package:delivery_app/common_widgets/app_text.dart';
import 'package:delivery_app/dashboard/dashboard_screen.dart';
import 'package:delivery_app/navigator/navigator.dart';
import 'package:delivery_app/styles/colors.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final String login_imagePath = "assets/delivery_man_Login.png";
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 15,),
              Center(child: Delivery_Service_TextWidget(),),
              Image(
                image: AssetImage('assets/delivery_man_Login.png'),
                height: 300,
                width: 300,
              ),
              Container(
                margin: EdgeInsets.only(left: 35, right: 35,bottom: 40),
                child: Column(
                  children: [
                    TextField(

                      style: TextStyle(color: Colors.black),


                      decoration: InputDecoration(
                          fillColor: AppColors.fillColor,
                          filled: true,
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(

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
                              })),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xff4c505b),
                              fontSize: 18,
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
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryColor,
    );
  }

  Widget getButton(BuildContext context) {
    return AppButton(
      label: "Login",
      fontWeight: FontWeight.w700,
      padding: EdgeInsets.symmetric(vertical: 25),
      onPressed: () {
        onGetStartedClicked(context);
      },
    );
  }
  void onGetStartedClicked(BuildContext context) {
    Navigator.of(context).pushReplacement(new MaterialPageRoute(
      builder: (BuildContext context) {
        return Navigator_Page();
      },
    ));
  }
}
