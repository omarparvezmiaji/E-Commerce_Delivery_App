// //import 'package:delivery_app/modelClass/api_request/login_model.dart';
// import 'package:delivery_app/common_widgets/app_text.dart';
// import 'package:delivery_app/modelClass/api_request/login_model2.dart';
// import 'package:delivery_app/navigator/navigator.dart';
// import 'package:delivery_app/styles/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
//
// var _baseUrl= 'https://appsafwahmart.hotelsetting.com/api/delivery-app';
// bool isLoading = false;
//
//
// //var x;
//
//
// ///for snackbar Message
// snackBarMessage(BuildContext context, String exp){
//   return ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       backgroundColor: AppColors.greyColor,
//       content: Text(
//         exp,
//         style: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.normal
//         ),
//       ),
//     ),
//   );
// }
//
//
//
// ///Login Request
// Future Login(BuildContext context, email,password)async{
//
//     //isLoading = true;
//
//   print('Email: $email');
//   print('Password: $password');
//
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//
//   String url = '$_baseUrl/login';
//   var response = await http.post(Uri.parse(url), body: {
//     'email': email,
//     'password': password,
//   });
//
//   print('Status Code: ${response.statusCode}');
//   if(response.statusCode == 200){
//     // var status = json.decode(response.body)['status'];
//     loginResponse smartDeliveryMan = loginResponseFromJson(response.body);
//
//     //print("Status: ${smartDeliveryMan.data.user.deliveryMan.name}");
//
//     if(smartDeliveryMan.status == 1){
//      //print("Status: ${smartDeliveryMan.data.user.name}");
//
//       Navigator.push(context, MaterialPageRoute(builder: (context)=> Navigator_Page()));
//       snackBarMessage(context, 'Login Successful');
//
//       String token = await smartDeliveryMan.data.token;
//       String name = await smartDeliveryMan.data.user.deliveryMan.name;
//       String email = await smartDeliveryMan.data.user.email;
//       String phone = await smartDeliveryMan.data.user.phone;
//       String address = await smartDeliveryMan.data.user.deliveryMan.address;
//       String area = await smartDeliveryMan.data.user.deliveryMan.area.name;
//       await prefs.setString('token', token);
//       await prefs.setString('name', name);
//       await prefs.setString('email', email);
//       await prefs.setString('phone', phone);
//       await prefs.setString('address', address);
//       await prefs.setString('area_name', area);
//
//
//       // x = prefs.getString("token");
//       // print("show Tokkkkken: " + x);
//     }
//     else {
//
//       print("Shooooooooow Statuuuuuuuus: ${smartDeliveryMan.status}");
//
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: AppText(text: "Mobile No or Password might be wrong")));
//
//
//     }
//   }
//   else{
//     throw Exception('Failed to Fetch');
//   }
// }

///Login and manual API

import 'dart:convert';

import 'package:delivery_app/common_widgets/app_text.dart';

//import 'package:delivery_app/modelClass/api_request/order_model.dart';
import 'package:delivery_app/modelClass/api_request/order_model.dart';
import 'package:delivery_app/navigator/navigator.dart';
import 'package:delivery_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

var _baseUrl = 'https://appsafwahmart.hotelsetting.com/api/delivery-app';

var imageBaseUrl = 'https://appsafwahmart.hotelsetting.com';

bool isLoading = false;


var x;
//SharedPreferences prefs =  SharedPreferences.getInstance();

///for snackbar Message
snackBarMessage(BuildContext context, String exp) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.primaryColor,
      content: Text(
        exp,
        style:
        const TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
      ),
    ),
  );
}

///Login Request
Future Login(BuildContext context, email, password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String url = '$_baseUrl/login';
  var response = await http.post(Uri.parse(url), body: {
    'email': email,
    'password': password,
  });

  if (response.statusCode == 200) {
    var smartDeliveryMan = json.decode(response.body);
    if (smartDeliveryMan['status'] == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Navigator_Page()));
      snackBarMessage(context, 'Login Successful');
      String token = await smartDeliveryMan['data']['token'];
      String name =
      await smartDeliveryMan['data']['user']['delivery_man']['name'];
      String email = await smartDeliveryMan['data']['user']['email'];
      String phone = await smartDeliveryMan['data']['user']['phone'];
      String address =
      await smartDeliveryMan['data']['user']['delivery_man']['address'];
      String area = await smartDeliveryMan['data']['user']['delivery_man']
      ['area']['name'];
      int id = await smartDeliveryMan['data']['user']['delivery_man']['id'];
      await prefs.setString('token', token);
      await prefs.setInt('id', id);
      await prefs.setString('name', name);
      await prefs.setString('email', email);
      await prefs.setString('phone', phone);
      await prefs.setString('address', address);
      await prefs.setString('area_name', area);
      print('token: $token');
      print('name: $name');
      print('email: $email');
      print('phone: $phone');
      print('address: $address');
      print('area: $area');
    } else {
      print("Shooooooooow Statuuuuuuuus: ${smartDeliveryMan['status']}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: AppText(text: "Mobile No or Password might be wrong")));
    }
  } else {
    throw Exception('Failed to Fetch');
  }
}

/// get order request
// Future getOrder() async {
//   // <OrderResponse?>
//   OrderResponse? orderData;
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var token = prefs.getString("token");
//   var id = prefs.getInt("id");
//   print("Get order token ------- $token");
//   print("DeliveryMan id ------- $id");
//   //  var client = http.Client();
//   var uri = Uri.parse("$_baseUrl/get-orders-by-delivery-man/$id");
//   var response = await http.get(uri, headers: {
//     'Accept': 'application/json',
//     'Authorization': 'Bearer $token',
//   });
// //  print("Status code is -----------${response.statusCode}");
//   if (response.statusCode == 200) {
//     orderData = orderResponseFromJson(response.body);
//     // print('get order data: ${orderData.data[0].subtotal}');
//     return orderData.data;
//   }
//   return orderData?.data;
// }

Future getOrder() async {
  // <OrderResponse?>
  OrderResponse? orderData;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("token");
  var id = prefs.getInt("id");
  print("Get order token ------- $token");
  print("DeliveryMan id ------- $id");
  //  var client = http.Client();
  var uri = Uri.parse("$_baseUrl/get-orders-by-delivery-man/$id");
  var response = await http.get(uri, headers: {
    'Accept': 'application/json',
    //'Authorization': 'Bearer 1304|ZiD0TyPBDYEvZuWABp44v0kGldTfhKN7ExAbOt7K',
    'Authorization': 'Bearer $token',
  },

  );
//  print("Status code is -----------${response.statusCode}");
  if (response.statusCode == 200) {
    orderData = orderResponseFromJson(response.body);
    // print('get order data: ${orderData.data[0].subtotal}');
    return orderData.data;
  }
  return orderData?.data;
}

/// Status post
Future sendStatus({required BuildContext context, statusId, orderId}) async {
  print("orderId ----------$orderId");
  print("statusId ----------$statusId");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("token");
  print("sendStatus token ----------$token");


  String url = '$_baseUrl/change-order-status-delivery-man/$orderId';
  var response = await http.post(Uri.parse(url), body: {
    'status_id': statusId.toString(),

  }, headers: {
    'Accept': 'application/json',
    // 'Authorization': 'Bearer 1304|ZiD0TyPBDYEvZuWABp44v0kGldTfhKN7ExAbOt7K',
    'Authorization': 'Bearer $token',
  });

  // if (response.statusCode == 200) {
  //   var smartDeliveryMan = json.decode(response.body);
  //   if (smartDeliveryMan['status'] == 1) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => Navigator_Page()));
  //     snackBarMessage(context, 'Login Successful');
  //     String token = await smartDeliveryMan['data']['token'];
  //     String name =
  //     await smartDeliveryMan['data']['user']['delivery_man']['name'];
  //     String email = await smartDeliveryMan['data']['user']['email'];
  //     String phone = await smartDeliveryMan['data']['user']['phone'];
  //     String address =
  //     await smartDeliveryMan['data']['user']['delivery_man']['address'];
  //     String area = await smartDeliveryMan['data']['user']['delivery_man']
  //     ['area']['name'];
  //     int id = await smartDeliveryMan['data']['user']['delivery_man']
  //     ['id'];
  //     await prefs.setString('token', token);
  //     await prefs.setInt('id', id);
  //     await prefs.setString('name', name);
  //     await prefs.setString('email', email);
  //     await prefs.setString('phone', phone);
  //     await prefs.setString('address', address);
  //     await prefs.setString('area_name', area);
  //     print('token: $token');
  //     print('name: $name');
  //     print('email: $email');
  //     print('phone: $phone');
  //     print('address: $address');
  //     print('area: $area');
  //   } else {
  //     print("Shooooooooow Statuuuuuuuus: ${smartDeliveryMan['status']}");
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: AppText(text: "Mobile No or Password might be wrong")));
  //   }
  // } else {
  //   throw Exception('Failed to Fetch');
  // }
}
