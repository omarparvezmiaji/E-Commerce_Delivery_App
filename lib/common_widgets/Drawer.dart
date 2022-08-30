import 'package:delivery_app/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/login.dart';
import '../screens/profile_details.dart';
import '../styles/colors.dart';
SharedPreferences? prefs;

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
                      child: const Navigator_Page(),
                      type: PageTransitionType.rightToLeft)),
              child: drawerItems(icon: Iconsax.category5, title: 'Dashboard'),
            ),

            InkWell(
              onTap: () => Navigator.push(
                  context,
                  PageTransition(
                    //  child:  ProfilePage(),
                      child:  ProfileDetails(),
                      type: PageTransitionType.rightToLeft)),
              child: drawerItems(icon: Iconsax.man, title: 'Profile'),
            ),


          //  drawerItems(icon: Iconsax.note5, title: ''),




            Padding(
              padding:
              const EdgeInsets.only(left: 15, right: 150, top: 20, bottom: 20),
              child: ElevatedButton(
                  onPressed: () async{
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.clear();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) {
                        return  LoginPage();
                      },
                    ));

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