import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:delivery_app/modelClass/login_model.dart';
import 'package:http/http.dart' as http;

var baseUrl = 'https://app.sarabosorekrate.com/api';


SharedPreferences? prefs;

Future login({phone, password}) async{

  var url = Uri.parse('$baseUrl/login');
  var response = await http.post(url, body: {
    'phone'     : '$phone',
    'password'  : '$password'
  });
  // var status  = json.decode(response.body)['status'];
  // var message = json.decode(response.body)['message'];
  // var token   = json.decode(response.body)['data']['token'];

  LoginResponse smartSoft = loginResponseFromJson(response.body);
var Name=smartSoft.data.user.customer.name;

  //
  // print('Status: ${smartSoft.status}');
  // print('Message: ${smartSoft.message}');
  // print('Token: ${smartSoft.data.token}');
  // print('Customer Name: ${smartSoft.data.user.customer.name}');
  // print('Customer Name: ${smartSoft.data.user.customer.accountId}');
  //


    prefs = await SharedPreferences.getInstance();
    await prefs!.setString("username", "$Name");




}

