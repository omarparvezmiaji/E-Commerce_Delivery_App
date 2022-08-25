import 'package:delivery_app/common_widgets/app_text.dart';
import 'package:delivery_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildContanier extends StatelessWidget {
  final contanierColor;
  final iconPath;
  final contanierTitle;
  final contanierSum;
  var hight, width;

  BuildContanier({
    this.contanierColor,
    this.iconPath,
    this.contanierTitle,
    this.contanierSum,
    this.hight,this.width,
  })  ;


  @override
  // Widget build(BuildContext context) {
  //   return Container(
  //       height: MediaQuery.of(context).size.height/9,
  //       width: MediaQuery.of(context).size.width/2.2,
  //       padding: EdgeInsets.all(10.0),
  //       decoration: BoxDecoration(
  //         color: Color(contanierColor),
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //         children: [
  //           SvgPicture.asset(iconPath,color: AppColors.lightColor,height: 50,width: 50,),
  //           //Spacer(),
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               AppText(text: contanierTitle,fontSize: 20,color: AppColors.lightColor,),
  //               Spacer(),
  //               AppText(text: "\$ " + contanierSum,fontSize: 24,color: AppColors.lightColor,fontWeight: FontWeight.bold,),
  //
  //             ],
  //           )
  //         ],)
  //   );
  // }
  Widget build(BuildContext context) {



    var hight;
    var width;
    var ratio;
    if (MediaQuery
        .of(context)
        .orientation == Orientation.portrait) {
      hight= MediaQuery.of(context).size.height / 9;
      width = MediaQuery.of(context).size.width/2.2;
    }
    else
    {
      hight = MediaQuery.of(context).size.height/5;
      width = MediaQuery.of(context).size.width/2.2;
    }


    return Container(
        height: hight,
        width: width,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color(contanierColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(iconPath,color: AppColors.lightColor,height: 50,width: 50,),
            //Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppText(text: contanierTitle,fontSize:  20.0,color:  AppColors.lightColor),
                Spacer(),
                AppText(text: "\$ " + contanierSum,fontSize:  24.0,fontWeight:  FontWeight.bold,color:  AppColors.lightColor),

              ],
            )
          ],)
    );
  }

}
