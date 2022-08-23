import 'package:flutter/cupertino.dart';
//
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:delivery_app/screens/Pending_Delivery/pending_delivery_main.dart';
import 'package:delivery_app/styles/my_app_size.dart';

import '../../common_widgets/app_text.dart';
import '../../styles/colors.dart';


class CompletedDeliveryItems extends StatefulWidget {
  const CompletedDeliveryItems({Key? key}) : super(key: key);

  @override
  State<CompletedDeliveryItems> createState() => _CompletedDeliveryItemsState();
}

class _CompletedDeliveryItemsState extends State<CompletedDeliveryItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: collectCard(),
      ),
    );
  }
}




//



collectCard({context,color}){

  return   Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(


          color: const Color(0xfffff4f2),
          // color: const Color(0xfffff4f2),
          borderRadius: BorderRadius.circular(AppSize.borderRadiusSize),
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
      child:
      Row(
        children: [


          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children:  [
                    AppText(text: 'Delivered Order:',color: Colors.grey,fontSize: 16,),
                    // Text('Delivered Order',style: TextStyle(
                    //   fontSize: 16,
                    // ),),
                    SizedBox(width: 5,),
                    Container(
                      //margin: EdgeInsets.all(15.0),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color:Colors.red),
                          shape: BoxShape.circle,),

                        child: Center(child: AppText(text: '45',color: Colors.red,)))
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children:  [
                    AppText(text: 'Return Order:',color: Colors.grey,fontSize: 16,),

                    const SizedBox(width: 5,),
                    Container(
                      //margin: EdgeInsets.all(15.0),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color:Colors.red),
                          shape: BoxShape.circle,),

                        child: Center(child: AppText(text: '12',color: Colors.red,)))
                  ],
                ),
              ],
            ),
          ),

          const Divider(thickness: .5,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                AppText(text: 'Collect',color: Colors.black,fontSize: 16,),
                // Text('Collect',style: TextStyle(fontSize: 16),),
                const SizedBox(height: 10,),
                AppText(text: '\$2345',color: Colors.black,fontSize: 16,)
              ],
            ),
          ),

        ],
      )

  );



}
