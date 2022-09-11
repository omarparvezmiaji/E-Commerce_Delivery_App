// import 'dart:math' as math;
//
// import 'package:flutter/material.dart';
//
//
// CustomPopupMenu
// (
// verticalMargin: -
// 22
// ,
// horizontalMargin: 5
// ,
// arrowSize: 20
// ,
// arrowColor: Colors.white.withOpacity(.95
// )
// ,
// menuBuilder: (
// )
// =>
// Container
// (
// decoration: BoxDecoration
// (
// color: Colors.white.withOpacity(.95
// )
// ,
// borderRadius: BorderRadius.circular(5
// )
// )
// ,
// child: IntrinsicWidth
// (
// child: Column
// (
// crossAxisAlignment: CrossAxisAlignment.stretch,children: [
// TextButton
// (
// style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 50
// ,
// vertical: 0
// )
// ,
// primary: Colors.black),
// onPressed: () {},
// child: const Text('
//
// My Profile
// '
// )
// ,
// )
// ,
// const Divider(height: 0
// ,
// )
// ,
// TextButton
// (
// style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 50
// ,
// vertical: 0
// )
// ,
// primary: Colors.black),
// onPressed: () {},
// child: const Text('
// Settings')
// ,
// )
// ,
// const Divider(height: 0
// ,
// )
// ,
// TextButton
// (
// style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 50
// ,
// vertical: 0
// )
// ,
// primary: Colors.black),
// onPressed: () {
// Navigator.pop(context);
// Navigator.push(
// context,
// PageTransition(
// child: SignInScreen(),
// type: PageTransitionType.rightToLeft));
// },
// child: const Text('Log Out'),
// ),
// ],
// ),
// )
// ,
// )
// ,
// pressType: PressType.singleClick,child: const Icon(Icons
//     .more_vert, color: Colors.white),
// )
// ,