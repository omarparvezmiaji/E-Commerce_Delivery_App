import 'package:delivery_app/screens/Pending_Delivery/pending_delivery_main.dart';
import 'package:delivery_app/screens/complete_delivery/completed_delivery_items.dart';
import 'package:delivery_app/screens/dashboard/dashboard_screen.dart';
import 'package:delivery_app/screens/login.dart';
import 'package:delivery_app/screens/login_screen.dart';
import 'package:delivery_app/screens/profile_details.dart';
import 'package:delivery_app/screens/splash_screen.dart';
import 'package:delivery_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),

     //ProfileDetails(),
      // //CompletedDeliveryItems(),
      // WelcomeScreen(),

      home:

      //CompletedDeliveryItems(),

     // LoginPage(),

//   LoginScreen(),

     Dashboard(),


     // const AnimatedSplashScreen(),


      //PendingDelivery(),


    );
  }
}
