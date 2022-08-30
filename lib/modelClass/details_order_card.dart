import 'package:delivery_app/modelClass/api_request/api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/Pending_Delivery/view_details.dart';
import '../styles/my_app_size.dart';

SharedPreferences? prefs;

detailsOrderCard({ required context,time, color,viewMapOrReturn,viewDetailsOrInvoice, orderData,orderNo,totalQuantity,subtotal,createdAt,productOrQuantity}) {
  // print('${orderData.product.image}');
  // print("Name is ${orderData.product.name}");
  // print("Sku is ${orderData.product.slug}");
  // print("Sku is ${orderData.product.thumbnailImage}");

  return Container(
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
                  borderRadius: BorderRadius.circular(AppSize.borderRadiusSize),
                   child:
                  //      orderData.product.thumbnailImage != '' && orderData.product.thumbnailImage != null ?
                  //  Image.network(
                  //   '$imageBaseUrl/${orderData.product.thumbnailImage}',
                  //   height: 80,
                  //   width: 80,
                  //   fit: BoxFit.fill,
                  // ) :
                  Image.asset('assets/images/burger1.jpg',height: 80,width: 80,fit: BoxFit.fill,)
                  ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        orderData.product.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        orderData.product.category.name ?? " ",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.grey),
                      ),
                      //  time ??
                      Text(
                       createdAt,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.grey),
                      ),
                    ]),
              )
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 10, bottom: 2),
            child: Row(
              children:  [
                const Text(
                  'Order No',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
                Spacer(),
                // appCustomButton(context,
                //     height: 40.0,
                //     width: 150.0,
                //     text: "Botton",
                //      color: Color(0xff0ce0ff)),
                Text(
                 "\$ ${double.parse(subtotal).toStringAsFixed(2)}" ,softWrap: true,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.red),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 10, bottom: 2),
            child: Row(
              children:  [
                Text(
                  orderNo ?? " ",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.red),
                ),
                Spacer(),
              /// Total product or Quantity ---
                 Text(
                   productOrQuantity !=null? "${productOrQuantity}: $totalQuantity" :"Total Product: $totalQuantity",

                 // "$productOrQuantity" ?? "Total Product:" $totalQuantity",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
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
                    children: const [
                      Icon(
                        Icons.navigation,
                        color: Colors.red,
                      ),
                      Text(
                        'View Map',
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
                  children: const [
                    Icon(
                      Icons.visibility,
                      color: Colors.black,
                    ),
                    Text(
                      ' View Details',
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
          )
        ],
      ));
}
