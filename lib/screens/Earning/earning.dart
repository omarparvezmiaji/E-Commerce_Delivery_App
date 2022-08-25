import 'package:delivery_app/common_widgets/app_banner.dart';
import 'package:delivery_app/common_widgets/app_text.dart';
import 'package:delivery_app/common_widgets/buildContainer.dart';
import 'package:delivery_app/common_widgets/dropDownList.dart';
import 'package:delivery_app/modelClass/model.dart';
import 'package:delivery_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter/src/widgets/framework.dart';

class Earning extends StatefulWidget {
  Earning({Key? key}) : super(key: key);

  @override
  State<Earning> createState() => _EarningState();
}

class _EarningState extends State<Earning> {
  // var size,height,width;
  // size = MediaQuery.of(context).size;
  // height = size.height;
  // width = size.width;
  String earningIconPath = "assets/icons/money_collection.svg";
  String deliveredIconPath = "assets/icons/delivered.svg";
  //bool isPortrait = true;
  // EarningSum() {
  //   var sum = 0;
  //   demototalCollectionModel;
  //
  //   for (var i = 0; i < demototalCollectionModel.length; i++) {
  //     print(i);
  //     sum += demototalCollectionModel[i].price!;
  //   }
  //
  //   print("Sum.... : ${sum}");
  //   return sum;
  // }

  deliveredCounter() {
    var deliveredCount;
    demototalCollectionModel;
    deliveredCount = demototalCollectionModel.length;
    return deliveredCount;
  }
  @override
  void initState() {
    screen_orientation() {
      var hight;
      var width;
      var ratio;
      if (MediaQuery
          .of(context)
          .orientation == Orientation.portrait) {
        hight= MediaQuery.of(context).size.height / 9;
        width = MediaQuery.of(context).size.width/2.2;
        ratio = hight/width;
        print("Hello::::::::: $ratio");
        return ratio;
      }
      else
      {
        hight = MediaQuery.of(context).size.height/5;
        width = MediaQuery.of(context).size.width/2.2;
        ratio = hight/width;
        print("Hello::::::::: $ratio");
        return ratio;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBanner(
                titel_text: "Earning",
              ),
              padded(Row(
                children: [
                  AppText(
                    text: "Last Week Earning",
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkColor,
                  ),
                  Spacer(),
                  DropdownDemo(),
                  // Material(
                  //   elevation: 3,
                  //   borderRadius: BorderRadius.circular(8.0),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child:
                  //     Row(
                  //       children: [
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
                      contanierSum: (deliveredCounter()*19).toString(),
                      iconPath: earningIconPath,
                      contanierTitle: "Earning",
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
                      margin: EdgeInsets.all(8),
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
                                  AppText(
                                    text: "Order Code",
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkColor,
                                  ),
                                  AppText(
                                      text:
                                      "${demototalCollectionModel[index].orderCode}",
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor),
                                ],
                              ),
                              Spacer(),
                              AppText(text: '${demototalCollectionModel[index].price}',fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,fontSize: 22.0,)
                            ],
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Row(
                            children: [
                              AppText(text: '${demototalCollectionModel[index].time}',fontSize: 16.0,),
                              Spacer(),
                              AppText(text: 'Quantity: ${demototalCollectionModel[index].items}',fontSize: 16.0,)
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
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: widget,
    );
  }
}
