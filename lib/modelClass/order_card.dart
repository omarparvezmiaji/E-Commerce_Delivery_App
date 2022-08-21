
import 'package:flutter/material.dart';

import '../styles/my_app_size.dart';

orderCard({ time,color}){

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
                      'The Burger Barn',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      'The Five Fields',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding:
            const EdgeInsets.only(right: 10.0, top: 10, bottom: 2),
            child: Row(
              children: [
                Text(
                  time ?? '13 Dec, 2021 at 8:00 PM ',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.grey),
                ),
                const Spacer(),
                // appCustomButton(context,
                //     height: 40.0,
                //     width: 150.0,
                //     text: "Botton",
                //      color: Color(0xff0ce0ff)),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // padding: const EdgeInsets.only(top: 5, bottom: 5),
                      // elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        primary: const Color(0xffffe2db)),
                    onPressed: () {},
                    child: const Text(
                      'See Order',
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ],
      ));

}