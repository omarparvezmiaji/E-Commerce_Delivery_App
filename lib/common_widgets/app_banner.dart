import 'package:delivery_app/common_widgets/app_text.dart';
import 'package:delivery_app/common_widgets/icon_button.dart';
import 'package:delivery_app/dashboard/dashboard_screen.dart';
import 'package:delivery_app/screens/notification.dart';
import 'package:delivery_app/styles/colors.dart';
import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget {
  final String titel_text;
  // var leading;
  // var trailing;

  AppBanner({
    required this.titel_text,
    // this.leading,
    // this.trailing,
  });
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 6,
        child: Container(
          //width: double.maxFinite,
            decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage(
                      "assets/banner.jpg",
                    ),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                iconColor: AppColors.lightColor,
                //textColor: AppColors.lightColor,
                leading: Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(
                      Icons.menu,size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer(),

                  ),
                ),
                title: AppText(text: titel_text,color: AppColors.lightColor,fontWeight: FontWeight.bold),
                trailing: IconButton(icon: Icon(Icons.notifications),iconSize: 30,onPressed: (){
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (BuildContext context) {
                        return Notifications_Empty();
                      },)

                    //getIconButton(context),
                  );}
                ),
              ),
            )
        ));
  }

// Widget getIconButton(BuildContext context) {
//   return AppIconButton(
//     icon: Icon(Icons.abc),
//     // fontWeight: FontWeight.w700,
//     // padding: EdgeInsets.symmetric(vertical: 25),
//     onPressed: () {
//       onGetStartedClicked(context);
//     },
//   );
// }
// void onGetStartedClicked(BuildContext context) {
//   Navigator.of(context).pushReplacement(new MaterialPageRoute(
//     builder: (BuildContext context) {
//       return Notifications_Page();
//     },
//   ));
// }

}
