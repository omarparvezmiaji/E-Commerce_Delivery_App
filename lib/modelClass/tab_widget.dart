import 'package:flutter/material.dart';

import '../styles/my_app_size.dart';

tabWidget({text, String? imagePath,font_Size}) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(10),
         //margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(

          //color: Colors.white,
          // color: const Color(0xfffff4f2),
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
          //   ),
          // ],
        ),
        child: Column(
          children: [
            ClipRRect(

                borderRadius: BorderRadius.circular(AppSize.borderRadiusSize),
                child: Image.asset(
                  imagePath ?? 'assets/images/burger1.jpg',
                  height: 60,
                  width: 60,
                  fit: BoxFit.fill,
                )),



          ],
        ),
      ),
       Text(text),
    ],
  );
}
