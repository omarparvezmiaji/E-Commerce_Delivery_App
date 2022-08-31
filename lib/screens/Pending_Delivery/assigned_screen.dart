import 'package:delivery_app/modelClass/api_request/api.dart';
import 'package:delivery_app/styles/my_app_size.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/my_app_bar.dart';
import '../../modelClass/CardWithoutImage.dart';
import '../../modelClass/api_request/order_model.dart';
import '../../modelClass/details_order_card.dart';
import '../../services.dart';
/// Pending order----
class AssignedScreen extends StatefulWidget {
  const AssignedScreen({Key? key}) : super(key: key);

  @override
  State<AssignedScreen> createState() => _AssignedScreenState();
}

class _AssignedScreenState extends State<AssignedScreen> {
  // bool isLoaded = false;

  // @override
  // initState() {
  //   super.initState();
  //
  //   ///  fetching orderData
  //   getData();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(


            children: [
              myAppBar(
                context: context,
                title: 'Pending Delivery',
                page: 'Pending Delivery',
              ),
              Expanded(
                child: FutureBuilder(
                  future: getOrder(),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot snapshot
                  ) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.connectionState == ConnectionState.active ||
                        snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text('Error Occurs',
                                style: TextStyle(color: Colors.red, fontSize: 36)));
                      } else if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            shrinkWrap: true,
                            //  physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              //   var data = snapshot.data[index]["orderDetails"][index].product.name;
                              //  var data = snapshot.data[index]["orderDetails"][index]['product'];
                              var data = snapshot.data[index];
                              // print('Order -------- ${data.orderNo}');
                              var orderNo = data.orderNo;
                              var totalQuantity = data.totalQuantity;
                              var subtotal = data.subtotal;
                              var createdAt = data.createdAt;
                              DateTime localDate =
                                  DateTime.parse(createdAt.toString()).toLocal();
                              // return Text(orderNo.toString());
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  itemCount: 1,
                                  //  itemCount: data.orderDetails.length,
                                  itemBuilder: (BuildContext context, int i) {
                                    var orderData = data.orderDetails[i];
                                    // return detailsOrderCard(
                                    //   context: context,
                                    //   orderData: orderData,
                                    //   orderNo: orderNo,
                                    //   totalQuantity: totalQuantity,
                                    //   createdAt: localDate.toString(),
                                    //   subtotal: subtotal,
                                    // );

                                    return cardWithoutImage(
                                      context: context,
                                      orderData: orderData,
                                      orderNo: orderNo,
                                      totalQuantity: totalQuantity,
                                      createdAt: localDate.toString(),
                                      subtotal: subtotal,
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
              ),
            ],
          ),
        ),

        // FutureBuilder(
        //     future: getOrder(),
        //     builder: (BuildContext context, AsyncSnapshot snapshot,) {
        //       if (snapshot.connectionState == ConnectionState.done) {
        //         return const Center(child: CircularProgressIndicator());
        //       }
        //       return snapshot.hasData
        //             ? ListView.builder(
        //                 itemCount: snapshot.data.length,
        //                 shrinkWrap: true,
        //                 //  physics: NeverScrollableScrollPhysics(),
        //                 itemBuilder: (BuildContext context, int index) {
        //                   //   var data = snapshot.data[index]["orderDetails"][index].product.name;
        //                   //  var data = snapshot.data[index]["orderDetails"][index]['product'];
        //                   var data = snapshot.data[index];
        //                   // print('Order -------- ${data.orderNo}');
        //                   var orderNo = data.orderNo;
        //                   var totalQuantity = data.totalQuantity;
        //                   var subtotal = data.subtotal;
        //                   var createdAt = data.createdAt;
        //                   DateTime localDate = DateTime.parse(createdAt.toString()).toLocal();
        //                   // return Text(orderNo.toString());
        //                   return ListView.builder(
        //                       shrinkWrap: true,
        //                       physics: ClampingScrollPhysics(),
        //                       itemCount: 1,
        //                     //  itemCount: data.orderDetails.length,
        //                       itemBuilder: (BuildContext context, int i) {
        //                         var orderData = data.orderDetails[i];
        //                         return detailsOrderCard(
        //                           context: context,
        //                           orderData: orderData,
        //                           orderNo: orderNo,
        //                           totalQuantity: totalQuantity,
        //                           createdAt: localDate.toString(),
        //
        //                           subtotal: subtotal,
        //                         );
        //                       });
        //                 })
        //             : Text('');
        //
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
    );
  }
}
