
import 'dart:convert';

import 'package:delivery_app/common_widgets/app_text.dart';

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
      int id = await smartDeliveryMan['data']['user']['delivery_man']
          ['id'];
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
    'Authorization': 'Bearer $token',
  });
//  print("Status code is -----------${response.statusCode}");
  if (response.statusCode == 200) {
    orderData = orderResponseFromJson(response.body);
    // print('get order data: ${orderData.data[0].subtotal}');
    return orderData.data;
  }
  return orderData?.data;
}
