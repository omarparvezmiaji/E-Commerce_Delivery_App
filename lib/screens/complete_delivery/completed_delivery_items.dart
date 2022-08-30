import 'package:delivery_app/modelClass/card2.dart';
import 'package:flutter/cupertino.dart';

//
import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';
//
// import 'package:delivery_app/screens/Pending_Delivery/pending_delivery_main.dart';
// import 'package:delivery_app/styles/my_app_size.dart';

import '../../common_widgets/Drawer.dart';
import '../../common_widgets/app_text.dart';
import '../../common_widgets/dropDownList.dart';
import '../../common_widgets/my_app_bar.dart';
import '../../modelClass/details_order_card.dart';
// import '../../modelClass/order_card.dart';
import '../../styles/colors.dart';

class CompletedDeliveryItems extends StatefulWidget {
  const CompletedDeliveryItems({Key? key}) : super(key: key);

  @override
  State<CompletedDeliveryItems> createState() => _CompletedDeliveryItemsState();
}

class _CompletedDeliveryItemsState extends State<CompletedDeliveryItems> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            drawer: myDrawer(context),
            body: Column(children: [
              myAppBar(
                  context: context,
                  title: 'Completed Delivery',
                  page: 'Completed Delivery',
                  fontSize: 20.0),
              collectCard(context: context),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    AppText(
                      text: "All Delivery",
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkColor,
                      fontSize: 16.0,
                    ),
                    Spacer(),
                    DropdownDemo(),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return detailsOrderCard2();
                    }),
              ),
            ])));
  }
}

//

collectCard({context, color}) {
  return Container(
      padding: const EdgeInsets.all(10),
      //  margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(color: const Color(0xfffff4f2),
          // color:  Colors.blue,
          // borderRadius: BorderRadius.circular(AppSize.borderRadiusSize),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(1, 1),
              blurRadius: 10,
            ),
            BoxShadow(
              color: Colors.transparent,
              offset: Offset(-1, -1),
              blurRadius: 10,
            ),
          ]),
      child: Row(
        //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppText(
                        text: 'Delivered Order:',
                        color: Colors.black,
                        fontSize: 16.0),

                    // Text('Delivered Order',style: TextStyle(
                    //   fontSize: 16,
                    // ),),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        //margin: EdgeInsets.all(15.0),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFB71C1C)),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: AppText(
                          text: '45',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.red,
                        )))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    AppText(
                        text: 'Return Order:',
                        color: Colors.black,
                        fontSize: 16.0),
                    const SizedBox(
                      width: 25,
                    ),
                    Container(
                        //margin: EdgeInsets.all(15.0),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFB71C1C)),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: AppText(
                                text: '12',
                                fontSize: 18.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.red)))
                  ],
                ),
              ],
            ),
          ),
          //  const VerticalDivider(width: 2,color: Colors.indigo,),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Column(
              children: [
                AppText(text: 'Collect', color: Colors.black, fontSize: 16.0),
                // Text('Collect',style: TextStyle(fontSize: 16),),
                const SizedBox(
                  height: 10,
                ),
                AppText(
                    text: '\$2345',
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 18.0)
              ],
            ),
          ),
        ],
      ));
}
