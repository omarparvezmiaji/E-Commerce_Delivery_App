import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:page_transition/page_transition.dart';

import 'package:delivery_app/screens/dashboard/dashboard_screen.dart';
import '../screens/ProfilePage.dart';
import '../screens/login.dart';
import '../styles/colors.dart';

myDrawer(BuildContext context) {
  return SafeArea(
    child: Drawer(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            InkWell(
              onTap: () => Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: const Dashboard(),
                      type: PageTransitionType.rightToLeft)),
              child: drawerItems(icon: Iconsax.category5, title: 'Dashboard'),
            ),

            InkWell(
              onTap: () => Navigator.push(
                  context,
                  PageTransition(
                      child:  ProfilePage(),
                      type: PageTransitionType.rightToLeft)),
              child: drawerItems(icon: Iconsax.man, title: 'Profile'),
            ),


          //  drawerItems(icon: Iconsax.note5, title: ''),




            Padding(
              padding:
              const EdgeInsets.only(left: 15, right: 150, top: 20, bottom: 20),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: LoginPage(),
                            type: PageTransitionType.rightToLeft));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.buttonColor,
                  //  primary: Colors.red[900],
                      elevation: 5.0,
                      shape: const StadiumBorder(),
                      fixedSize: const Size(100, 40)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Iconsax.logout,
                        color: Colors.white,
                      ),
                      Text(
                        '  Logout',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )),
            ),
          ],
        )),
  );
}

//for drawer items
drawerItems({IconData? icon, String? title}) {
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: AppColors.blueDark,
      child: Icon(
        icon!,
        color: AppColors.dashboardIconColor,
      ),
    ),
    title: Text(
      title!,
      style: const TextStyle(fontSize: 16),
    ),
  );
}