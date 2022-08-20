import 'package:delivery_app/common_widgets/app_text.dart';
import 'package:delivery_app/styles/colors.dart';
import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget {
  final String titel_text;
  var leading;
  var trailing;

 AppBanner({
    required this.titel_text,
    this.leading,
   this.trailing,
  });
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4,
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
            leading: Icon(leading, size: 30),
            title: AppText(text: titel_text,color: AppColors.lightColor,fontWeight: FontWeight.bold),
            trailing: Icon(trailing, size: 30),
          ),
        ),
      ),
    );
  }
}
