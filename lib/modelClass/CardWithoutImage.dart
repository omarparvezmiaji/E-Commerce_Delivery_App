import 'package:flutter/material.dart';

import '../common_widgets/app_text.dart';
import '../screens/Pending_Delivery/view_details.dart';
import '../styles/colors.dart';
import '../styles/my_app_size.dart';

cardWithoutImage({
  required context,
  time,
  color,
  viewMapOrReturn,
  viewDetailsOrInvoice,
  orderData,
  orderNo,
  totalQuantity,
  subtotal,
  createdAt,
  productOrQuantity,
  mapOrReturn,
  viewOrInvoice,
}) {
  // print('${orderData.product.image}');
  // print("Name is ${orderData.product.name}");
  // print("Sku is ${orderData.product.slug}");
  // print("Sku is ${orderData.product.thumbnailImage}");

  return Container(
    padding: const EdgeInsets.only(left: 12.0,right: 12.0,bottom: 12.0),
    margin: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(color: AppColors.darkColor, width: 0),
    ),
    child: Column(
      children: [

        ElevatedButton(
          style: ElevatedButton.styleFrom(

fixedSize:const Size(140.0, 20.0) ,
            // padding: const EdgeInsets.only(top: 5, bottom: 5),
            elevation: 5.0,
              side: const BorderSide(
                  width: 0.5, style: BorderStyle.solid),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              primary: Colors.white),
          onPressed: () {
            //
            // prefs = await SharedPreferences.getInstance();
            // var TokenView = prefs!.getString("token");
            //
            // print('------>Token from view Details $TokenView');
          },
          child: InkWell(
            onTap: (){},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
                Text(
                  ' Delivered',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ],
            ),
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     ElevatedButton(
        //         style: ElevatedButton.styleFrom(
        //           // padding: const EdgeInsets.only(top: 5, bottom: 5),
        //           // elevation: 0,
        //             shape: RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(5)),
        //             primary: const Color(0xffffe2db)),
        //         onPressed: () {},
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: const [
        //             Icon(
        //               Icons.navigation,
        //               color: Colors.red,
        //             ),
        //             Text(
        //               'Return Order',
        //               style: TextStyle(
        //                 fontSize: 16,
        //                 color: Colors.red,
        //                 fontWeight: FontWeight.w900,
        //               ),
        //             )
        //           ],
        //         )),
        //     ElevatedButton(
        //       style: ElevatedButton.styleFrom(
        //         // padding: const EdgeInsets.only(top: 5, bottom: 5),
        //         // elevation: 0,
        //           side: BorderSide(
        //               width: 0.5, style: BorderStyle.solid),
        //           shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(5)),
        //           primary: Colors.white),
        //       onPressed: () {
        //         //
        //         // prefs = await SharedPreferences.getInstance();
        //         // var TokenView = prefs!.getString("token");
        //         //
        //         // print('------>Token from view Details $TokenView');
        //       },
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: const [
        //           Icon(
        //             Icons.check_box,
        //             color: Colors.green,
        //           ),
        //           Text(
        //             ' Completed',
        //             style: TextStyle(
        //               fontSize: 16,
        //               color: Colors.black,
        //               fontWeight: FontWeight.w900,
        //             ),
        //           )
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                    text: "Order No",
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkColor),
                AppText(

                    text: orderNo ?? " ",
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor),
              ],
            ),
            Spacer(),
            AppText(
                text:  "৳ ${double.parse(subtotal).toStringAsFixed(2)}",
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor),
          ],
        ),
        Divider(
          thickness: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              //  text:  double.parse(createdAt).toStringAsFixed(2),
                text:  createdAt,
                fontSize: 16.0),
            // Spacer(),
            AppText(

                text: "Products: ${double.parse(totalQuantity).toStringAsFixed(0)}",
               // text:"Total Product: $totalQuantity",
              //  text:productOrQuantity !=null? "${productOrQuantity}: $totalQuantity" :"Total Product: $totalQuantity",

                fontSize: 16.0)
          ],
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
                  children: const [
                    Icon(
                      Icons.location_on_outlined,
                      // Icons.location_on_outlined,
                      color: Colors.red,
                    ),
                    Text(
                      ' View Map',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                )),



            ElevatedButton(
              style: ElevatedButton.styleFrom(
                // padding: const EdgeInsets.only(top: 5, bottom: 5),
                // elevation: 0,
                  side: BorderSide(width: 0.5, style: BorderStyle.solid),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  primary: Colors.white),
              ///----------------------
              onPressed: ()  {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ViewDetailsOrder(orderData: orderData,)));

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const  [
                  Icon(
                    Icons.visibility,
                    color: Colors.black,
                  ),

                  Text(
                    ' View Invoice',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
