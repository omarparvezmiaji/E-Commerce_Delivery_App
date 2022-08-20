import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/notification.dart';
import '../styles/colors.dart';
import 'app_text.dart';

myAppBar({context, title, page}) {
  return Container(

    decoration: const BoxDecoration(
      //borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            image: AssetImage(
              "assets/banner.jpg",
            ),
            fit: BoxFit.cover)),
    child: Padding(
      padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
      child: ListTile(
        iconColor: AppColors.lightColor,

        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,size: 30,
              color: Colors.white,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),

          ),
        ),
        title: AppText(text: title,color: AppColors.lightColor,fontWeight: FontWeight.bold),
        // trailing: Icon(trailing, size: 30),
        trailing:  IconButton(
            onPressed: () {
              page == 'Notifications'
                  ? null
                  : Navigator.push(
                  context,
                  PageTransition(
                      child: const NotificationScreen(),
                      type: PageTransitionType.rightToLeft));
              page == 'Notifications'
                  ? null
                  : Navigator.push(
                  context,
                  PageTransition(
                      child: const NotificationScreen(),
                      type: PageTransitionType.leftToRight));
            },
            icon: const Icon(Icons.notifications,size: 30, color: Colors.white)),
      ),
    ),
  );
}