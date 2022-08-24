import 'dart:async';

import 'package:delivery_app/common_widgets/app_text.dart';
import 'package:delivery_app/navigator/navigator.dart';
import 'package:delivery_app/screens/login.dart';
import 'package:delivery_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedSplashScreen> createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<double> animation;
  final String imagePath = "assets/welcome_image.jpg";
  SharedPreferences? prefs;
  var previousLoginChecker;

  startTime() async {
    var _duration = Duration(milliseconds: 3000);
    return Timer(_duration,loadUserInfo);
  }

  // _nextPageInfo() async {
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (contex)=>LoginPage()));
  // }

  sharedPreferences() async{
    prefs = await SharedPreferences.getInstance();
    previousLoginChecker = (prefs!.getString('token') ?? '');
  }

  loadUserInfo() async {
    previousLoginChecker != "" && previousLoginChecker != null ?
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Navigator_Page())) :
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
  }


  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(seconds: 1));
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();
    sharedPreferences();
    startTime();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath),
              welcomeTextWidget(),
            ],
          ),
        ),
        ),

      // Container(
      //   padding: EdgeInsets.symmetric(horizontal: 30),
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage(imagePath),
      //       fit: BoxFit.fitWidth,
      //     ),
      //   ),
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         welcomeTextWidget(),
      //       ],
      //     ),
      //   ),
      // ),
      
    );
  }
  Widget welcomeTextWidget() {
    return AppText(
      text: "Welcome",
      fontSize: 48.0,
      fontWeight: FontWeight.w600,
      color: AppColors.darkColor,
    );
  }
}
