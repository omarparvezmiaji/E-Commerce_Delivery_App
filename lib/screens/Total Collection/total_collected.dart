import 'package:delivery_app/common_widgets/app_banner.dart';
import 'package:delivery_app/common_widgets/app_text.dart';
import 'package:delivery_app/common_widgets/buildContainer.dart';
import 'package:delivery_app/common_widgets/dropDownList.dart';
import 'package:delivery_app/common_widgets/my_app_bar.dart';
import 'package:delivery_app/modelClass/model.dart';
import 'package:delivery_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common_widgets/Drawer.dart';
// import 'package:flutter/src/widgets/framework.dart';

class Total_Collected extends StatefulWidget {
  Total_Collected({Key? key}) : super(key: key);

  @override
  State<Total_Collected> createState() => _Total_CollectedState();
}

class _Total_CollectedState extends State<Total_Collected> {
  // var size,height,width;
  // size = MediaQuery.of(context).size;
  // height = size.height;
  // width = size.width;
  String collectedIconPath = "assets/icons/money_collection.svg";
  String deliveredIconPath = "assets/icons/delivered.svg";
  //bool isPortrait = true;
  CollectedSum() {
    var sum = 0;
    demototalCollectionModel;

    for (var i = 0; i < demototalCollectionModel.length; i++) {
      print(i);
      sum += demototalCollectionModel[i].price!;
    }

    print("Sum.... : ${sum}");
    return sum;
  }

  deliveredCounter() {
    var deliveredCount;
    demototalCollectionModel;
    deliveredCount = demototalCollectionModel.length;
    return deliveredCount;
  }

  // screen_orientation() {
  //   var hight;
  //   var width;
  //   var ratio;
  //   if (MediaQuery
  //       .of(context)
  //       .orientation == Orientation.portrait) {
  //     hight= MediaQuery.of(context).size.height / 9;
  //     width = MediaQuery.of(context).size.width/2.2;
  //     ratio = hight/width;
  //     print("Hello::::::::: $ratio");
  //     return ratio;
  //   }
  //   else
  //   {
  //     hight = MediaQuery.of(context).size.height/5;
  //     width = MediaQuery.of(context).size.width/2.2;
  //     ratio = hight/width;
  //     print("Hello::::::::: $ratio");
  //     return ratio;
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        drawer: myDrawer(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // AppBanner(
              //   titel_text: "Total Collected",
              // ),
              myAppBar(
                  context: context,
                  title: 'Total Collected',
                  page: 'Total_Collected'),
              padded(Row(
                children: [
                  AppText(text: "Last Week Collected",fontSize:  18.0,fontWeight:  FontWeight.bold,color:  AppColors.darkColor),
                  Spacer(),
                  DropdownDemo(),
                  // Material(
                  //   elevation: 3,
                  //   borderRadius: BorderRadius.circular(8.0),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Row(
                  //       children: [
                  //         //DropdownDemo(),
                  //         AppText(
                  //           text: "Last 7 days",
                  //           fontSize: 16,
                  //         ),
                  //         Icon(
                  //           Icons.arrow_drop_down_sharp,
                  //           color: AppColors.darkColor,
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              )),
              SizedBox(
                height: 10,
              ),
              //buildContainer(context),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BuildContanier(
                      contanierColor: 0xfffb9401,
                      contanierSum: CollectedSum().toString(),
                      iconPath: collectedIconPath,
                      contanierTitle: "Collected",
                    ),
                    //Spacer(),
                    BuildContanier(
                      contanierColor: 0xff83b440,
                      contanierSum: deliveredCounter().toString(),
                      iconPath: deliveredIconPath,
                      contanierTitle: "Delivered",
                    ),
                  ],
                ),
              ),
              ListView.builder(

                shrinkWrap: true,
                  padding: EdgeInsets.all(8.0),
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: demototalCollectionModel.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(12.0),
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: AppColors.darkColor, width: 0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(text: "Order Code",fontSize:  18.0,fontWeight:  FontWeight.bold,color:  AppColors.darkColor),
                                  AppText(text: "${demototalCollectionModel[index].orderCode}",fontSize:  18.0,fontWeight:  FontWeight.bold,color:  AppColors.primaryColor),
                                ],
                              ),
                              Spacer(),
                              AppText(text: '\$${demototalCollectionModel[index].price}',fontSize: 22.0,fontWeight:  FontWeight.bold,color:  AppColors.primaryColor),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Row(
                            children: [
                              AppText(text: '${demototalCollectionModel[index].time}', fontSize: 16.0),
                              Spacer(),
                              AppText(text: 'Quantity: ${demototalCollectionModel[index].items}',fontSize: 16.0)
                            ],
                          )
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildContainer(BuildContext context) {
  //   var color;
  //   var iconPath;
  //   var contanierTitle;
  //   var contanierSum;
  //   return Container(
  //           height: MediaQuery.of(context).size.height/8,
  //           width: MediaQuery.of(context).size.height/4,
  //           padding: EdgeInsets.all(12.0),
  //           decoration: BoxDecoration(
  //             color: Color(0xfffb9401),
  //             borderRadius: BorderRadius.circular(15),
  //           ),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //             SvgPicture.asset("assets/icons/money_collection.svg",color: AppColors.lightColor,height: 60,width: 60,),
  //               //Spacer(),
  //               Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                 children: [
  //                   AppText(text: 'Collected',fontSize: 20,color: AppColors.lightColor,),
  //                   Spacer(),
  //                   AppText(text: "\$ " + CollectedSum().toString(),fontSize: 24,color: AppColors.lightColor,fontWeight: FontWeight.bold,),
  //
  //                 ],
  //               )
  //           ],)
  //         );
  // }
  Widget padded(Widget widget) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: widget,
    );
  }
}
