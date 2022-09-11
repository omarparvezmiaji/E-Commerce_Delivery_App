import 'package:delivery_app/modelClass/api_request/api.dart';
import 'package:delivery_app/screens/Pending_Delivery/view_details.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../common_widgets/app_text.dart';
import '../../common_widgets/my_app_bar.dart';
import '../../styles/colors.dart';

class PendingDelivery2 extends StatefulWidget {
  const PendingDelivery2({Key? key}) : super(key: key);

  @override
  State<PendingDelivery2> createState() => _PendingDelivery2State();
}

class _PendingDelivery2State extends State<PendingDelivery2> {
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
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.connectionState ==
                            ConnectionState.active ||
                        snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text(' Please Retry',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16)));
                      } else if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            // physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              var data = snapshot.data[index];

                              return Container(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12.0, bottom: 12.0),
                                margin: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                      color: AppColors.darkColor, width: 0.5),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.person,
                                                  color: AppColors.greyColor,
                                                ),
                                                Text(
                                                  data.orderCustomerInfo.name,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () {
                                                launch(
                                                    'tel:${data.orderCustomerInfo.phone}');
                                              },
                                              child: Row(
                                                children: [
                                                  const Icon(Icons.phone,
                                                      color: Colors.blue),
                                                  Text(
                                                    data.orderCustomerInfo
                                                        .phone,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.location_on,
                                                  color: AppColors.greyColor,
                                                ),
                                                Text(
                                                  data.orderCustomerInfo
                                                      .address,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ]),
                                    ),
                                    const Divider(),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                                text: "Order No",
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.darkColor),
                                            AppText(
                                                text: data.id ?? " ",
                                               // text: data.orderNo ?? " ",
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.primaryColor),
                                          ],
                                        ),
                                        const Spacer(),
                                        AppText(
                                            text:
                                                "৳ ${double.parse(data.subtotal).toStringAsFixed(2)}",
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primaryColor),
                                      ],
                                    ),
                                    const Divider(
                                      thickness: 1,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText(
                                            text: DateTime.parse(
                                                    data.createdAt.toString())
                                                .toLocal(),
                                            fontSize: 16.0),
                                        // Spacer(),
                                        AppText(
                                            text:
                                                "Products: ${double.parse(data.totalQuantity).toStringAsFixed(0)}",
                                            fontSize: 16.0)
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText(
                                            text: "Payment Type :",
                                            fontSize: 16.0),
                                        // Spacer(),
                                        AppText(
                                            fontWeight: FontWeight.w700,
                                            text: data.paymentType,
                                            color: AppColors.redColor,
                                            fontSize: 20.0)
                                      ],
                                    ),
                                    const Divider(
                                      thickness: 1,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // ElevatedButton(
                                        //     style: ElevatedButton.styleFrom(
                                        //         // elevation: 0,
                                        //         shape: RoundedRectangleBorder(
                                        //             borderRadius:
                                        //                 BorderRadius.circular(
                                        //                     5)),
                                        //         primary:
                                        //             const Color(0xffffe2db)),
                                        //     onPressed: () {},
                                        //     child: Row(
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment.spaceEvenly,
                                        //       children: const [
                                        //         Icon(
                                        //           Icons.location_on_outlined,
                                        //           // Icons.location_on_outlined,
                                        //           color: Colors.red,
                                        //         ),
                                        //         Text(
                                        //           ' View Map',
                                        //           style: TextStyle(
                                        //             fontSize: 16,
                                        //             color: Colors.red,
                                        //             fontWeight: FontWeight.w900,
                                        //           ),
                                        //         )
                                        //       ],
                                        //     )),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                // elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                primary:
                                                    const Color(0xffffe2db)),
                                            onPressed: () {},
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: const [
                                                Icon(
                                                  Icons.location_on_outlined,
                                                  // Icons.location_on_outlined,
                                                  color: Colors.red,
                                                ),
                                                Text(
                                                  'Delivered',
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
                                              side: const BorderSide(
                                                  width: 0.5,
                                                  style: BorderStyle.solid),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              primary: Colors.white),

                                          ///----------------------
                                          onPressed: () {
                                            // Navigator.of(context).push(
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             ViewDetailsOrder(
                                            //               orderData:
                                            //                   data.orderDetails,
                                            //             )));
/// ----------------------------------------calling api -----------
                                            sendStatus(
                                              orderId:data.id,
                                                context: context,
                                               // wireHouseId: data.orderId,
                                                statusId: 5);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: const [
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
      ),
    );
  }
}
