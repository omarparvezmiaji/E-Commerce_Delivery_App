import 'dart:convert';

import 'package:delivery_app/modelClass/api_request/login_model.dart';
import 'package:delivery_app/navigator/navigator.dart';
import 'package:delivery_app/screens/dashboard/dashboard_screen.dart';
import 'package:delivery_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


var _baseUrl= 'https://appsafwahmart.hotelsetting.com/api/delivery-app';

var x;


///for snackbar Message
snackBarMessage(BuildContext context, String message){
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.greyColor,
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
  if(response.statusCode == 200){
    // var status = json.decode(response.body)['status'];
    loginResponse smartDeliveryMan = loginResponseFromJson(response.body);

    print("Name one: ${smartDeliveryMan.data.user.deliveryMan.name}");
    print("Status: ${smartDeliveryMan.status}");

    if(smartDeliveryMan.status == 1){
      print("------ > Token is :  ${smartDeliveryMan.data.token}" );
      String token =  smartDeliveryMan.data.token;
      print("------ > Token is again :  $token" );
      await prefs.setString('token', token);

      print("DeliveryMan name from User is : ${smartDeliveryMan.data.user.name}");

    //  Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));


      x = await prefs.getString("token");

       print("------ >  X  Token is  :  $x" );


    }
    else   {

      print("Shooooooooow Statuuuuuuuus: ${smartDeliveryMan.status}");

      snackBarMessage(context,"Mobile or Password  wrong");

    }
  }
  // else{
  //   throw Exception('Failed to Fetch');
  // }
}