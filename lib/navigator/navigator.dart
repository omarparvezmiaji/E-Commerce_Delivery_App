import 'package:delivery_app/navigator/navigator_item.dart';
import 'package:delivery_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Navigator_Page extends StatefulWidget {
  const Navigator_Page({Key? key}) : super(key: key);

  @override
  State<Navigator_Page> createState() => _Navigator_PageState();
}

class _Navigator_PageState extends State<Navigator_Page> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: navigatorItems[currentIndex].screen,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black38.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 37,
                  offset: Offset(0, -12)),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primaryColor,
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
              unselectedItemColor: Colors.black,
              items: navigatorItems.map((e) {
                return getNavigationBarItem(
                    label: e.label, index: e.index, iconPath: e.iconPath);
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
    BottomNavigationBarItem getNavigationBarItem(
        {String ? label, String ? iconPath, int ? index}) {
      Color iconColor =
      index == currentIndex ? AppColors.primaryColor : Colors.black;
      return BottomNavigationBarItem(
        label: label,
        icon: SvgPicture.asset(
          iconPath!,
          color: iconColor,
          height: 30,
          width: 30,
        ),
      );
    }

}
