// import 'package:delivery_app/common_widgets/app_button.dart';
// import 'package:delivery_app/common_widgets/app_text.dart';
// import 'package:delivery_app/screens/login.dart';
// import 'package:delivery_app/styles/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
//
//
// class WelcomeScreen extends StatelessWidget {
//   final String imagePath = "assets/welcome_image.jpg";
//
//
//   @override
//
//
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       padding: EdgeInsets.symmetric(horizontal: 30.0),
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(imagePath),
//           fit: BoxFit.fitWidth,
//         ),
//       ),
//       child: Center(
//         child: Column(
//           //mainAxisSize: MainAxisSize.max,
//           children: [
//             Spacer(),
//             welcomeTextWidget(),
//             SizedBox(
//               height: 10,
//             ),
//             // sloganText(),
//             // SizedBox(
//             //   height: 40,
//             // ),
//             getButton(context),
//             SizedBox(
//               height: 40,
//             )
//           ],
//         ),
//       ),
//     ),
//     );
//   }
//
//   // Widget icon() {
//   //   String iconPath = "assets/icons/app_icon.svg";
//   //   return SvgPicture.asset(
//   //     iconPath,
//   //     width: 48,
//   //     height: 56,
//   //   );
//   // }
//
//   Widget welcomeTextWidget() {
//     return AppText(
//           text: "Welcome",
//           fontSize: 48.0,
//           fontWeight: FontWeight.w600,
//           color: AppColors.darkColor,
//     );
//   }
//
//   // Widget sloganText() {
//   //   return AppText(
//   //     text: "Get your grecories as fast as in 30 mins",
//   //     fontSize: 16,
//   //     fontWeight: FontWeight.w600,
//   //     color: Colors.black87.withOpacity(0.7),
//   //   );
//   // }
//
//   Widget getButton(BuildContext context) {
//     return AppButton(
//       label: "Start",
//       fontWeight: FontWeight.w700,
//       padding: EdgeInsets.symmetric(vertical: 25.0),
//       onPressed: () {
//         onGetStartedClicked(context);
//       },
//     );
//   }
//   void onGetStartedClicked(BuildContext context) {
//     Navigator.of(context).pushReplacement(MaterialPageRoute(
//       builder: (BuildContext context) {
//         return LoginPage();
//       },
//     ));
//   }
// }
