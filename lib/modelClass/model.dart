import 'package:delivery_app/dashboard/dashboard_screen.dart';
import 'package:delivery_app/screens/Earning/earning.dart';
import 'package:delivery_app/screens/Pending_Delivery/pending_delivery_main.dart';
import 'package:delivery_app/screens/Total%20Collection/total_collected.dart';
import 'package:flutter/material.dart';

import '../screens/Pending_Delivery/pending_delivery_main.dart';

class DashBoardModel {
  var name;
  var imagePath;
  Widget pageName;
  int counter;

  DashBoardModel(
      {this.name, this.imagePath, required this.counter, required this.pageName});
}

var demoDashBoardModel = [
  DashBoardModel(
      name: "Complete Delivery",
      imagePath: "assets/dashboard/complet.png",
      counter: 0,
      pageName: Dashboard()),
  DashBoardModel(
      name: "Pending Delivery",
      imagePath: "assets/dashboard/pending.png",
      counter: 0,
      pageName: PendingDelivery()),
  DashBoardModel(
      name: "Total Collected",
      imagePath: "assets/dashboard/collection.png",
      counter: 0,
      pageName: Total_Collected()),
  DashBoardModel(
      name: "Earning",
      imagePath: "assets/dashboard/earning.png",
      counter: 0,
      pageName: Earning()),
];
// var DashBoard = [
//   demoDashBoardModel [0],
//   demoDashBoardModel [1],
//   demoDashBoardModel [2],
//   demoDashBoardModel [3],
// ];

class totalCollectionModel {
  final String orderCode;
  var time;
  int? price;
  var address;
  int? items;

  totalCollectionModel(
      {required this.orderCode,
      this.address,
      this.time,
      this.price,
      this.items});
}

var demototalCollectionModel = [
  totalCollectionModel(
      orderCode: '#43677-213456',
      address: 'abc',
      time: '13 Dec, 2021 at 8:00 PM',
      items: 3,
      price: 234),
  totalCollectionModel(
      orderCode: '#23761-093472',
      address: 'abc',
      time: '13 Dec, 2021 at 8:00 PM',
      items: 1,
      price: 39),
  totalCollectionModel(
      orderCode: '#23091-390327',
      address: 'abc',
      time: '18 Feb, 2022 at 7:25 PM',
      items: 2,
      price: 65),
  totalCollectionModel(
      orderCode: '#43677-213456',
      address: 'abc',
      time: '13 Dec, 2021 at 8:00 PM',
      items: 3,
      price: 234),
  totalCollectionModel(
      orderCode: '#23761-093472',
      address: 'abc',
      time: '13 Dec, 2021 at 8:00 PM',
      items: 1,
      price: 39),
  totalCollectionModel(
      orderCode: '#23091-390327',
      address: 'abc',
      time: '18 Feb, 2022 at 7:25 PM',
      items: 2,
      price: 65),
];
