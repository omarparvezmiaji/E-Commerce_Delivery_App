import 'dart:convert';

import 'package:delivery_app/navigator/navigator.dart';
import 'package:delivery_app/screens/dashboard/dashboard_screen.dart';
import 'package:delivery_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'login_model2.dart';
import 'model4.dart';

//DeliveryManResponse?   smartDeliveryMan;
var _baseUrl= 'https://appsafwahmart.hotelsetting.com/api/delivery-app';

var x;


///for snackbar Message
snackBarMessage(BuildContext context, String message){
  return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
      backgroundColor: AppColors.darkGrey,
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.normal
        ),
      ),
    ),
  );
}


///Login Request
Future Login(BuildContext context, {email,password})async{
  print('Email: $email');
  print('Password: $password');

  SharedPreferences prefs = await SharedPreferences.getInstance();

  String url = '$_baseUrl/login';
  var response = await http.post(Uri.parse(url), body: {
    'email': email,
    'password': password,
  });

  print('Status Code: ${response.statusCode}');
 // print('Body Code:================ ${response.body}');



  if(response.statusCode == 200) {
   // final map = jsonDecode(response.body) ;
    DeliveryManLogin  smartDeliveryMan = deliveryManLoginFromJson(response.body);
  //  smartDeliveryMan = DeliveryManResponse.fromJson(map);

    print("Status: ${smartDeliveryMan?.status}");

    if (smartDeliveryMan?.status == 1) {
      snackBarMessage(context, 'Login Successful');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const Dashboard();
          },
        ),
      );
    }
    else {
      snackBarMessage(context, 'Email or Password is incorrect');
    }


    //   print("DeliveryMan Name: ${smartDeliveryMan.data.user.deliveryMan.name}");
    //   print("DeliveryMan Area Name: ${smartDeliveryMan.data.user.deliveryMan.area.name}");
    //   print("Status: ${smartDeliveryMan.status}");
    //
    //   if(smartDeliveryMan.status == 1){
    //     print("------ > Token is :  ${smartDeliveryMan.data.token}" );
    //     String token =  smartDeliveryMan.data.token;
    //     print("------ > Token is again :  $token" );
    //     await prefs.setString('token', token);
    //
    //     print("DeliveryMan name from User is : ${smartDeliveryMan.data.user.name}");
    //
    //   //  Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));
    //
    //
    //     x = await prefs.getString("token");
    //
    //      print("------ >  X  Token is  :  $x" );
    //
    //
    //   }
    //   else   {
    //
    //     print("Shooooooooow Statuuuuuuuus: ${smartDeliveryMan.status}");
    //
    //     snackBarMessage(context,"Mobile or Password  wrong");
    //
    //   }
    // }
    // // else{
    // //   throw Exception('Failed to Fetch');

  }
}