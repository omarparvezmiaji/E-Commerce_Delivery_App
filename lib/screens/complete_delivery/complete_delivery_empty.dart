import 'package:delivery_app/common_widgets/app_banner.dart';
import 'package:delivery_app/common_widgets/app_button.dart';
import 'package:delivery_app/common_widgets/app_text.dart';
import 'package:delivery_app/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

class Complete_Delivery_Empty extends StatelessWidget {
  const Complete_Delivery_Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBanner(
              //leading: Icons.menu,
              titel_text: "Complete Delivery",
              //trailing: Icons.notifications, onPressed: ,
            ),
            SizedBox(height: 40,),
            Container(
              //margin: EdgeInsets.all(15.0),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Color(0xffffe9e3),
                shape: BoxShape.circle,
              ),
              child: Center(
                  child: Icon(
                    Icons.notifications,
                    size: 50,
                    color: Color(0xffa03a22),
                  )),
            ),
            SizedBox(height: 40,),
            AppText(
              text: "Don't have any item in the \n Complete Delivery list",
              fontSize: 22,
            ),
            SizedBox(height: 40,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 30),
              child: getButton(context),),

          ],
        ),
      ),
    );
  }
  Widget getButton(BuildContext context) {
    return AppButton(
      label: "Back to Dashboard",
      fontWeight: FontWeight.w700,
      padding: EdgeInsets.symmetric(vertical: 25),
      onPressed: () {
        onGetStartedClicked(context);
      },
    );
  }
  void onGetStartedClicked(BuildContext context) {
    Navigator.of(context).pushReplacement(new MaterialPageRoute(
      builder: (BuildContext context) {
        return Dashboard();
      },
    ));
  }

}