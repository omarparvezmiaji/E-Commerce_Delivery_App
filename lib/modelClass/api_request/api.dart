

//import 'package:delivery_app/modelClass/api_request/login_model.dart';
import 'package:delivery_app/common_widgets/app_text.dart';

import 'package:delivery_app/modelClass/api_request/login_model2.dart';
import 'package:delivery_app/modelClass/api_request/order_model.dart';
import 'package:delivery_app/navigator/navigator.dart';
import 'package:delivery_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


var _baseUrl= 'https://appsafwahmart.hotelsetting.com/api/delivery-app';

var imageBaseUrl= 'https://appsafwahmart.hotelsetting.com';

bool isLoading = false;


var x;


///for snackbar Message
snackBarMessage(BuildContext context, String exp){
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.greyColor,
      content: Text(
        exp,
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal
        ),
      ),
    ),
  );
}


///Login Request
Future Login(BuildContext context, email,password)async{

    //isLoading = true;

  print('Email: $email');
  print('Password: $password');

  SharedPreferences prefs = await SharedPreferences.getInstance();

  String url = '$_baseUrl/login';
  var response = await http.post(Uri.parse(url), body: {
    'email': email,
    'password': password,
  });

 // print('Status Code: ${response.statusCode}');
  if(response.statusCode == 200){
    // var status = json.decode(response.body)['status'];
    loginResponse smartDeliveryMan = loginResponseFromJson(response.body);

    //print("Status: ${smartDeliveryMan.data.user.deliveryMan.name}");

    if(smartDeliveryMan.status == 1){
     //print("Status: ${smartDeliveryMan.data.user.name}");


   // print("Status: ${smartDeliveryMan.status}");

    if (smartDeliveryMan.status == 1) {

      Navigator.push(context, MaterialPageRoute(builder: (context)=> Navigator_Page()));
      snackBarMessage(context, 'Login Successful');

      String token = await smartDeliveryMan.data.token;
      String name = await smartDeliveryMan.data.user.deliveryMan.name;
      String email = await smartDeliveryMan.data.user.email;
      String phone = await smartDeliveryMan.data.user.phone;
      String address = await smartDeliveryMan.data.user.deliveryMan.address;
      String area = await smartDeliveryMan.data.user.deliveryMan.area.name;
      await prefs.setString('token', token);
      await prefs.setString('name', name);
      await prefs.setString('email', email);
      await prefs.setString('phone', phone);
      await prefs.setString('address', address);
      await prefs.setString('area_name', area);


      // x = prefs.getString("token");
      // print("show Tokkkkken: " + x);
    }
    else {

      print("Shooooooooow Statuuuuuuuus: ${smartDeliveryMan.status}");

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: AppText(text: "Mobile No or Password might be wrong")));



    //  print("DeliveryMan Name: ${smartDeliveryMan.data.user.deliveryMan.name}");
    //  print("DeliveryMan Area Name: ${smartDeliveryMan.data.user.deliveryMan.area.name}");
    //  print("Status: ${smartDeliveryMan.status}");

      if(smartDeliveryMan.status == 1){
       // print("------ > Token is :  ${smartDeliveryMan.data.token}" );
        String token =  smartDeliveryMan.data.token;
       // print("------ > Token is again :  $token" );
        await prefs.setString('token', token);

     //   print("DeliveryMan name from User is : ${smartDeliveryMan.data.user.name}");

      //  Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));


        x = await prefs.getString("token");

       //  print("------ >  X  Token is  :  $x" );


      }
      else   {

        print("Shooooooooow Statuuuuuuuus: ${smartDeliveryMan.status}");

        snackBarMessage(context,"Mobile or Password  wrong");

      }
    }
    // else{
    //   throw Exception('Failed to Fetch');

      snackBarMessage(context,"Mobile No or Password might be wrong");


    }
  }
  else{
    throw Exception('Failed to Fetch');
  }}

///order get
Future getOrder() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("token");
 // print("Get order token ------- $token");
   var client = http.Client();
  var uri = Uri.parse("$_baseUrl/get-orders-by-delivery-man/7");
  var response = await client.get(uri, headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  });
  //print("Status code is -----------${response.statusCode}");
  if (response.statusCode == 200) {
    OrderResponse orderData = orderResponseFromJson(response.body);
    return orderData.data;
  }
  return null;
}
