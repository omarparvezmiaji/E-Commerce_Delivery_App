
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../styles/my_app_size.dart';
SharedPreferences? prefs;


detailsOrderCard({ time,color,productName}){

  return   Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(


          color: color ?? Colors.white,
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
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                  borderRadius:
                  BorderRadius.circular(AppSize.borderRadiusSize),
                  child:

                  Image.asset('assets/images/burger1.jpg',height: 80,width: 80,fit: BoxFit.fill,)
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Pizza Into Bite-Sized Pieces',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      'The Five Fields',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  //  time ??
                    Text(
                       '13 Dec, 2021 at 8:00 PM ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.grey),
                    ),

                  ]
                ),
              )
            ],
          ),
          Divider(),
          Padding(
            padding:
            const EdgeInsets.only(right: 10.0, top: 10, bottom: 2),
            child: Row(
              children: const [
                Text(
                  'Order Code',
                  style: TextStyle(
                    fontSize: 16,
                      fontWeight: FontWeight.w900, color: Colors.black),
                ),
                Spacer(),
                // appCustomButton(context,
                //     height: 40.0,
                //     width: 150.0,
                //     text: "Botton",
                //      color: Color(0xff0ce0ff)),
                Text(
                  '\$234',

                  style: TextStyle(

                      fontSize: 16,
                      fontWeight: FontWeight.w900, color: Colors.red),
                ),

              ],
            ),
          ),
          const Divider(),
          Padding(
            padding:
            const EdgeInsets.only(right: 10.0, top: 10, bottom: 2),
            child: Row(
              children: const [
                Text(
                  '#43677-223656',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900, color: Colors.red),
                ),
                Spacer(),
                // appCustomButton(context,
                //     height: 40.0,
                //     width: 150.0,
                //     text: "Botton",
                //      color: Color(0xff0ce0ff)),
                Text(
                  'Quantity:3',

                  style: TextStyle(

                      fontSize: 14,
                      fontWeight: FontWeight.w500, color: Colors.grey),
                ),

              ],
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // padding: const EdgeInsets.only(top: 5, bottom: 5),
                    // elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      primary: const Color(0xffffe2db)),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.navigation,color: Colors.red,),
                      Text('View Map',style: TextStyle(
                        fontSize: 16,color: Colors.red,fontWeight: FontWeight.w900,
                      ),)

                    ],
                  )
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // padding: const EdgeInsets.only(top: 5, bottom: 5),
                    // elevation: 0,
                    side: BorderSide(
                      width: 0.5,

                        style: BorderStyle.solid),
                      shape: RoundedRectangleBorder(


                          borderRadius: BorderRadius.circular(5)),
                  primary: Colors.white


                  ),

                  onPressed: () async{
                    prefs = await SharedPreferences.getInstance();
                  var TokenView = prefs!.getString("token");

                  print('------>Token from view Details $TokenView');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.visibility,color: Colors.black,),
                      Text(' View Details',style: TextStyle(
                        fontSize: 16,color: Colors.black,fontWeight: FontWeight.w900,
                      ),)

                    ],
                  ),),
            ],
          )
        ],
      ));

}