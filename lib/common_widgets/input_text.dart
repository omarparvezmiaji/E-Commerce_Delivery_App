import 'package:flutter/material.dart';

import '../styles/my_app_size.dart';

inputField(BuildContext context,
    {controller, hintText,height, keyboardType, icon, autofillHints}) {
  return Container(
    //decoration
      padding: const EdgeInsets.all(10),
      // height:60 ,
      decoration: BoxDecoration(
        border:Border.all() ,

        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSize.borderRadiusSize),
        // boxShadow: const [
        //   BoxShadow(
        //     color: Colors.black12,
        //     offset: Offset(1, 1),
        //     blurRadius: 10,
        //   ),
        //   BoxShadow(
        //     color: Colors.transparent,
        //     offset: Offset(-1, -1),
        //     blurRadius: 10,
        //   )
        // ]
        //
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //for search
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  autofillHints: [autofillHints ],
                  decoration: InputDecoration(
                    hintText: hintText,
                    isCollapsed: true,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    // contentPadding:
                    //     const EdgeInsets.only(top: 8, bottom: 8, left: 12),
                  ),
                ),
              ),
              icon != null
                  ? Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      // color: Colors.grey,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 2,
                            spreadRadius: 1.5,
                            offset: const Offset(0, 2.5))
                      ]
                  ),
                  child: icon)
                  : Container(),
            ],
          ),
        ],
      ));
}