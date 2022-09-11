import 'package:delivery_app/common_widgets/invoice.dart';
import 'package:delivery_app/modelClass/card2.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:delivery_app/screens/Pending_Delivery/pdf_viewer_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
//
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:page_transition/page_transition.dart';
//
// import 'package:delivery_app/screens/Pending_Delivery/pending_delivery_main.dart';
// import 'package:delivery_app/styles/my_app_size.dart';

import '../../common_widgets/Drawer.dart';
import '../../common_widgets/app_text.dart';
import '../../common_widgets/dropDownList.dart';
import '../../common_widgets/my_app_bar.dart';
import '../../modelClass/api_request/api.dart';
import '../../modelClass/details_order_card.dart';

// import '../../modelClass/order_card.dart';
import '../../styles/colors.dart';

class CompletedDeliveryItems extends StatefulWidget {
  const CompletedDeliveryItems({Key? key}) : super(key: key);

  @override
  State<CompletedDeliveryItems> createState() => _CompletedDeliveryItemsState();
}

class _CompletedDeliveryItemsState extends State<CompletedDeliveryItems> {
  var totalDelivered;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: myDrawer(context),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          myAppBar(
              context: context,
              title: 'Completed Delivery',
              page: 'Completed Delivery',
              fontSize: 20.0),

          // collectCard(context: context, totalDelivered: totalDelivered),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     children: [
          //       AppText(
          //         text: "All Delivery",
          //         fontWeight: FontWeight.w700,
          //         color: AppColors.darkColor,
          //         fontSize: 16.0,
          //       ),
          //       Spacer(),
          //       DropdownDemo(),
          //     ],
          //   ),
          // ),
          // ListView.builder(
          //     shrinkWrap: true,
          //     physics: const BouncingScrollPhysics(),
          //     itemCount: 12,
          //     itemBuilder: (context, index) {
          //       return detailsOrderCard2();
          //     }),
          Expanded(
            child: FutureBuilder(
              future: getOrder(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.connectionState == ConnectionState.active ||
                    snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Center(
                        child: Text(' Please Retry',
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)));
                  } else if (snapshot.hasData) {
                    print("Length------------${snapshot.data.length}");
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        // physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var data = snapshot.data[index];
                          var count = 0;
                          if (data.currentStatus == 4) {
                            count++;
                            return Container(
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12.0, bottom: 12.0),
                              margin: const EdgeInsets.only(
                                  top: 8.0,
                                  left: 8.0,
                                  right: 8.0,
                                  bottom: 20.0),
                              decoration: BoxDecoration(
                                color: const Color(0xfffff4f2),
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
                                                    fontWeight: FontWeight.w600,
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
                                                  data.orderCustomerInfo.phone,
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
                                                data.orderCustomerInfo.address,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
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
                                              //text: data.id ?? " ",
                                              text: data.orderNo ?? " ",
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ///--------------

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
                                        onPressed: () async {
                                          const url =
                                              "http://www.africau.edu/images/default/sample.pdf";
                                          final file =
                                              await loadPdfFromNetwork(url);
                                          openPdf(context, file, url);
                                          // Navigator.of(context).push(
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             ViewDetailsOrder(
                                          //               orderData:
                                          //                   data.orderDetails,
                                          //             )));
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
                          } else {
                            return Container();
                          }
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
        ]),
      ),
    );
  }
}

Future<File> loadPdfFromNetwork(String url) async {
  final response = await http.get(Uri.parse(url));
  final bytes = response.bodyBytes;
  return _storeFile(url, bytes);
}

Future<File> _storeFile(String url, List<int> bytes) async {
  final filename = basename(url);
  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/$filename');
  await file.writeAsBytes(bytes, flush: true);
  if (kDebugMode) {
    print('$file');
  }
  return file;
}

void openPdf(BuildContext context, File file, String url) =>
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PdfViewerPage(
          file: file,
          url: url,
        ),
      ),
    );

//

collectCard({context, color, totalDelivered}) {
  return Container(
      padding: const EdgeInsets.all(10),
      //  margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(color: const Color(0xfffff4f2),
          // color:  Colors.blue,
          // borderRadius: BorderRadius.circular(AppSize.borderRadiusSize),
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
      child: Row(
        //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppText(
                        text: "Delivered Order",
                        color: Colors.black,
                        fontSize: 16.0),

                    // Text('Delivered Order',style: TextStyle(
                    //   fontSize: 16,
                    // ),),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        //margin: EdgeInsets.all(15.0),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFB71C1C)),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                            child: AppText(
                          text: totalDelivered.toString(),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.red,
                        )))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                // Row(
                //   children: [
                //     AppText(
                //         text: 'Return Order:',
                //         color: Colors.black,
                //         fontSize: 16.0),
                //     const SizedBox(
                //       width: 25,
                //     ),
                //     Container(
                //         //margin: EdgeInsets.all(15.0),
                //         height: 40,
                //         width: 40,
                //         decoration: BoxDecoration(
                //           border: Border.all(color: const Color(0xFFB71C1C)),
                //           shape: BoxShape.circle,
                //         ),
                //         child: Center(
                //             child: AppText(
                //                 text: '12',
                //                 fontSize: 18.0,
                //                 fontWeight: FontWeight.w900,
                //                 color: Colors.red)))
                //   ],
                // ),
              ],
            ),
          ),
          //  const VerticalDivider(width: 2,color: Colors.indigo,),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Column(
              children: [
                AppText(text: 'Collect', color: Colors.black, fontSize: 16.0),
                // Text('Collect',style: TextStyle(fontSize: 16),),
                const SizedBox(
                  height: 10,
                ),
                AppText(
                    text: '\$2345',
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 18.0)
              ],
            ),
          ),
        ],
      ));
}
