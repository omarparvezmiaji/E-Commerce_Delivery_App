import 'package:delivery_app/screens/dashboard/dashboard_screen.dart';
import 'package:delivery_app/screens/Earning/earning.dart';
import 'package:delivery_app/screens/ProfilePage.dart';
import 'package:delivery_app/screens/complete_delivery/complete_delivery_empty.dart';
import 'package:flutter/material.dart';
// import 'package:grocery_app/screens/account/account_screen.dart';
// import 'package:grocery_app/screens/cart/cart_screen.dart';
// import 'package:grocery_app/screens/favourite_screen.dart';
// import 'package:grocery_app/screens/home/home_screen.dart';

class NavigatorItem {
  final String label;
  final String iconPath;
  int index;
  final Widget screen;

  NavigatorItem(this.label, this.iconPath, this.index, this.screen);
}

List<NavigatorItem> navigatorItems = [
  NavigatorItem("Dashboard", "assets/icons/dashboard.svg", 0, Dashboard()),
  NavigatorItem("My Delivery", "assets/icons/delivery_complete.svg", 1, Complete_Delivery_Empty()),
  NavigatorItem("My Earning", "assets/icons/earning.svg", 2, Earning()),
  NavigatorItem("Profile", "assets/icons/account_icon.svg", 3, ProfilePage()),
];
