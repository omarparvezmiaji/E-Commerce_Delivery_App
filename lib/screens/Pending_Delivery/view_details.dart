import 'package:delivery_app/common_widgets/Drawer.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/my_app_bar.dart';
import '../../modelClass/api_request/api.dart';
import '../../modelClass/details_order_card.dart';
import '../../styles/my_app_size.dart';

class ViewDetailsOrder extends StatefulWidget {
  var orderData;

  ViewDetailsOrder({Key? key, required orderData}) : super(key: key);

  //const ViewDetailsOrder({Key? key}) : super(key: key);

  @override
  State<ViewDetailsOrder> createState() => _ViewDetailsOrderState();
}

class _ViewDetailsOrderState extends State<ViewDetailsOrder> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: myDrawer(context),
        body: Column(
          // mainAxisAlignment:MainAxisAlignment.center ,
          children: [
            myAppBar(
              context: context,
              title: 'View Details Order',
              page: 'View Details Order',
            ),

            Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    // color: color ?? Colors.white,
                    // color: const Color(0xfffff4f2),
                    // borderRadius: BorderRadius.circular(AppSize.borderRadiusSize),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(AppSize.borderRadiusSize),
                        bottomLeft: Radius.circular(AppSize.borderRadiusSize)),
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
                    // Row(
                    //   children: [
                    //     ClipRRect(
                    //         borderRadius:
                    //         BorderRadius.circular(AppSize.borderRadiusSize),
                    //         child:
                    //
                    //         Image.asset('assets/images/burger1.jpg',height: 80,width: 80,fit: BoxFit.fill,)
                    //     ),
                    //     const SizedBox(
                    //       width: 8,
                    //     ),
                    //     Expanded(
                    //       child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: const [
                    //             Text(
                    //               'Pizza Into Bite-Sized Pieces',
                    //               style: TextStyle(
                    //                   fontWeight: FontWeight.bold, fontSize: 16),
                    //             ),
                    //             Text(
                    //               'The Five Fields',
                    //               style: TextStyle(
                    //                   fontWeight: FontWeight.w500,
                    //                   color: Colors.grey),
                    //             ),
                    //             //  time ??
                    //             Text(
                    //               '13 Dec, 2021 at 8:00 PM ',
                    //               style: TextStyle(
                    //                   fontWeight: FontWeight.w500, color: Colors.grey),
                    //             ),
                    //
                    //           ]
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // Divider(),
                    // Padding(
                    //   padding:
                    //   const EdgeInsets.only(right: 10.0, top: 10, bottom: 2),
                    //   child: Row(
                    //     children: const [
                    //       Text(
                    //         'Order Code',
                    //         style: TextStyle(
                    //             fontSize: 16,
                    //             fontWeight: FontWeight.w900, color: Colors.black),
                    //       ),
                    //       Spacer(),
                    //       // appCustomButton(context,
                    //       //     height: 40.0,
                    //       //     width: 150.0,
                    //       //     text: "Botton",
                    //       //      color: Color(0xff0ce0ff)),
                    //       Text(
                    //         '\$234',
                    //
                    //         style: TextStyle(
                    //
                    //             fontSize: 16,
                    //             fontWeight: FontWeight.w900, color: Colors.red),
                    //       ),
                    //
                    //     ],
                    //   ),
                    // ),
                    // const Divider(),
                    // Padding(
                    //   padding:
                    //   const EdgeInsets.only(right: 10.0, top: 10, bottom: 2),
                    //   child: Row(
                    //     children: const [
                    //       Text(
                    //         '#43677-223656',
                    //         style: TextStyle(
                    //             fontSize: 16,
                    //             fontWeight: FontWeight.w900, color: Colors.red),
                    //       ),
                    //       Spacer(),
                    //       // appCustomButton(context,
                    //       //     height: 40.0,
                    //       //     width: 150.0,
                    //       //     text: "Botton",
                    //       //      color: Color(0xff0ce0ff)),
                    //       Text(
                    //         'Quantity:3',
                    //
                    //         style: TextStyle(
                    //
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.w500, color: Colors.grey),
                    //       ),
                    //
                    //     ],
                    //   ),
                    // ),
                    // const Divider(),
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
                                  'Return Order',
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
                              side: BorderSide(
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(
                                Icons.check_box,
                                color: Colors.green,
                              ),
                              Text(
                                ' Completed',
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
                )),

            // ListView.builder(
            //     shrinkWrap: true,
            //     //physics: ClampingScrollPhysics(),
            //     //itemCount: widget.orderData.length,
            //   itemCount:3,
            //     //  itemCount: data.orderDetails.length,
            //     itemBuilder: (BuildContext context, int i) {
            //       //  var orderData = data.orderDetails[i];
            //       DateTime localDate = DateTime.parse(widget.orderData.createdAt.toString()).toLocal();
            //       return detailsOrderCard(
            //         orderData: widget.orderData,
            //         orderNo:widget.orderData.product.id,
            //         totalQuantity: widget.orderData.product.measurementTitle,
            //         createdAt: localDate.toString(),
            //         subtotal: widget.orderData.product.salePrice,
            //         context: context,
            //       );
            //     }),

            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: FutureBuilder(
                    future: getOrder(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Padding(
                          padding: EdgeInsets.all(28.0),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      } else if (snapshot.connectionState ==
                              ConnectionState.active ||
                          snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return const Center(
                              child: Text('Error Occurs',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 18)));
                        } else if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                //   var data = snapshot.data[index]["orderDetails"][index].product.name;
                                //  var data = snapshot.data[index]["orderDetails"][index]['product'];
                                var data = snapshot.data[index];
                                // print('Order -------- ${data.orderNo}');
                                var orderNo = data.orderNo;
                                var totalQuantity = data.totalQuantity;
                                var subtotal = data.subtotal;
                                // var createdAt = data.createdAt;
                                DateTime localDate =
                                    DateTime.parse(data.createdAt.toString())
                                        .toLocal();

                                return ListView.builder(
                                    shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    // itemCount:1 ,
                                    itemCount: data.orderDetails.length,
                                    itemBuilder: (BuildContext context, int i) {
                                      var orderData = data.orderDetails[i];
                                      return detailsOrderCard(
                                        context: context,
                                        orderData: orderData,
                                        orderNo:
                                            orderData.product.id.toString(),
                                        totalQuantity: orderData.quantity,
                                        createdAt: localDate.toString(),
                                        subtotal: orderData.totalAmount,
                                        productOrQuantity: "Quantity",
                                      );
                                    });
                              });
                        } else {
                          return const Text('Empty data');
                        }
                      } else {
                        return Text('State: ${snapshot.connectionState}');
                      }
                    },
                  ),

                  // FutureBuilder(
                  //     future: getOrder(),
                  //     builder: (
                  //       BuildContext context,
                  //       AsyncSnapshot snapshot,
                  //     ) {
                  //       if (snapshot.connectionState == ConnectionState.waiting) {
                  //         return const Center(child: CircularProgressIndicator());
                  //       } else {
                  //         return snapshot.hasData
                  //             ? ListView.builder(
                  //                 itemCount: snapshot.data.length,
                  //                 shrinkWrap: true,
                  //                  physics: NeverScrollableScrollPhysics(),
                  //                 itemBuilder: (BuildContext context, int index) {
                  //                   //   var data = snapshot.data[index]["orderDetails"][index].product.name;
                  //                   //  var data = snapshot.data[index]["orderDetails"][index]['product'];
                  //                   var data = snapshot.data[index];
                  //                   // print('Order -------- ${data.orderNo}');
                  //                   var orderNo = data.orderNo;
                  //                   var totalQuantity = data.totalQuantity;
                  //                   var subtotal = data.subtotal;
                  //                   // var createdAt = data.createdAt;
                  //                   DateTime localDate =
                  //                       DateTime.parse(data.createdAt.toString())
                  //                           .toLocal();
                  //
                  //                   return ListView.builder(
                  //                       shrinkWrap: true,
                  //                       physics: ClampingScrollPhysics(),
                  //                       // itemCount:1 ,
                  //                       itemCount: data.orderDetails.length,
                  //                       itemBuilder: (BuildContext context, int i) {
                  //                         var orderData = data.orderDetails[i];
                  //                         return detailsOrderCard(
                  //                           context: context,
                  //                           orderData: orderData,
                  //                           orderNo: orderData.product.id.toString(),
                  //                           totalQuantity:orderData.quantity,
                  //                           createdAt: localDate.toString(),
                  //                           subtotal: orderData.totalAmount,
                  //                            productOrQuantity: "Quantity",
                  //
                  //                         );
                  //                       });
                  //                 })
                  //             : Text('');
                  //       }
                  //       // else if (snapshot.connectionState == ConnectionState.active
                  //       //     || snapshot.connectionState == ConnectionState.done) {
                  //       //   return const Text('Empty data');
                  //       // }
                  //
                  //       // Visibility(
                  //       //   visible: isLoaded,
                  //       //   replacement: const Center(
                  //       //     child: CircularProgressIndicator(),
                  //       //   ),
                  //       //   child: ListView.builder(
                  //       //       physics: const BouncingScrollPhysics(),
                  //       //       shrinkWrap: true,
                  //       //       // itemCount: 5,
                  //       //       itemCount: orderData?.data.length,
                  //       //       itemBuilder: (context, index) {
                  //       //         final order = orderData?.data[index];
                  //       //
                  //       //         return Center(
                  //       //             child:
                  //       //                 Text("Status Code is ${order!.orderDetails[]}"));
                  //       //         // return detailsOrderCard();
                  //       //       }),
                  //       // ),
                  //     }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
