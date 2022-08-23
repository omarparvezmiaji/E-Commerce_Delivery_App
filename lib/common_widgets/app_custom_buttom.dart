//
// import 'package:flutter/material.dart';
//
//  appCustomButton(BuildContext context,
//     {text, press, height, width, top, left, right, bottom, color, radius,textColor,elevation }) {
//   return Center(
//     child: Container(
//       width:width?? double.infinity,
//       height: height,
//       color: Colors.red,
//       margin: EdgeInsets.only(
//           top: top ?? 0,
//           left: left ?? 0,
//           right: right ?? 0,
//           bottom: bottom ?? 0),
//       child: ElevatedButton(
//
//           style: ElevatedButton.styleFrom(
//
//               padding: const EdgeInsets.only(top: 5, bottom: 5),
//               elevation:elevation ?? 0,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(radius ?? 5)),
//               primary: color ?? const Color(0xff0ce0ff)),
//           onPressed: press,
//           child: Text(
//
//             text,
//
//
//             style: const TextStyle(
//                 color:  Colors.white, fontWeight: FontWeight.w500, fontSize:16.0),
//           )),
//     ),
//   );
// }