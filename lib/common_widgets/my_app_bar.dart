import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/Notifications/notification.dart';
import '../styles/colors.dart';
import 'app_text.dart';

myAppBar({context, title, fontSize, page}) {
  return Container(
    decoration: const BoxDecoration(

      image: DecorationImage(

          image: AssetImage(
            "assets/banner.jpg",

          ),

          fit: BoxFit.cover),
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: ListTile(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              size: 35,
              color: Colors.white,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
            // onPressed: (){
            //
            //   Navigator.push(
            //       context,
            //       PageTransition(
            //           child:  ProfilePage(),
            //           type: PageTransitionType.rightToLeft));
            // },
          ),
        ),
        title: AppText(
            text: title,
            fontSize: fontSize ?? 20.0,
            fontWeight: FontWeight.w500,
            color: AppColors.lightColor),

        trailing: IconButton(
            onPressed: () {
              page == 'Notifications'
                  ? null
                  : Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NotificationScreen()));
              // page == 'Notifications'
              //     ? null
              //     : Navigator.push(
              //     context,
              //     PageTransition(
              //         child: const NotificationScreen(),
              //         type: PageTransitionType.leftToRight));
            },
            icon: const Icon(Icons.notification_add,
                size: 30, color: AppColors.lightColor)),
      ),
    ),
  );
}
