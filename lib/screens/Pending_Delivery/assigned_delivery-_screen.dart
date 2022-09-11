import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:delivery_app/common_widgets/Drawer.dart';
import 'package:delivery_app/modelClass/api_request/api.dart';
import 'package:delivery_app/screens/Pending_Delivery/pdf_viewer_page.dart';
import 'package:delivery_app/screens/Pending_Delivery/view_details.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../common_widgets/app_text.dart';
import '../../common_widgets/invoice.dart';
import 'dart:io';
import 'package:delivery_app/screens/Pending_Delivery/pdf_viewer_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import '../../common_widgets/my_app_bar.dart';
import '../../styles/colors.dart';
import '../../styles/my_app_size.dart';
import '../complete_delivery/complete_delivery_empty.dart';

import 'package:flutter/foundation.dart';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

import '../location/current_location_screen.dart';

class AssignedDelivery extends StatefulWidget {
  const AssignedDelivery({Key? key}) : super(key: key);

  //var colorFlag = true;

  @override
  State<AssignedDelivery> createState() => _AssignedDeliveryState();
}

class _AssignedDeliveryState extends State<AssignedDelivery> {
  int? selectedIndex;

  late Future _getOrder;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getOrder = getOrder();
  }

  // changeFlagValue() {
  //   setState(() {
  //     //  colorFlag = !colorFlag;
  //     onTheWayFlag = !onTheWayFlag;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: myDrawer(context),
        body: Column(
          children: [
            myAppBar(
              context: context,
              title: 'Assigned Delivery',
              page: 'Assigned Delivery',
            ),
            Expanded(
              child: FutureBuilder(
                future: _getOrder,
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
                          itemBuilder: (BuildContext context, int index) {
                            var data = snapshot.data[index];

                            // if (data.currentStatus == 2 ||
                            //     data.currentStatus == 3 ||
                            //     data.currentStatus == 4) {

                            if (data.currentStatus == 5) {

                              return Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(

                                    // color: color ?? Colors.white,
                                    color: const Color(0xfffff4f2),
                                    border: Border.all(
                                        color: AppColors.darkColor, width: 0.5),
                                    borderRadius: BorderRadius.circular(
                                        AppSize.borderRadiusSize),
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
                                // padding: const EdgeInsets.only(
                                //     left: 12.0, right: 12.0, bottom: 12.0),
                                // margin: const EdgeInsets.only(
                                //     top: 8.0,
                                //     left: 8.0,
                                //     right: 8.0,
                                //     bottom: 20.0),
                                // decoration: BoxDecoration(
                                //   borderRadius: BorderRadius.circular(10.0),
                                //   border: Border.all(
                                //       color: AppColors.darkColor, width: 0.5),
                                // ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: selectedIndex != index
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      elevation: 2.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                      primary: const Color(
                                                          0xffffe2db)),
                                                  onPressed: () {
                                                    setState(() {
                                                      selectedIndex = index;
                                                    });
                                                  },
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: const [
                                                      Icon(
                                                          Icons
                                                              .motorcycle_rounded,
                                                          // color: Colors.red,
                                                          color: Colors.red),
                                                      Text(
                                                        '  On The Way',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Align(
                                              alignment: Alignment.topRight,
                                              child: CustomPopupMenu(
                                                verticalMargin: -10,
                                                horizontalMargin: 5,
                                                arrowSize: 20,
                                                arrowColor: Colors.white
                                                    .withOpacity(.95),
                                                menuBuilder: () => Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(.95),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: IntrinsicWidth(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        TextButton(
                                                            style: TextButton.styleFrom(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        25,
                                                                    vertical:
                                                                        0),
                                                                primary: Colors
                                                                    .black),

                                                            ///Api calling for sendStatus

                                                            onPressed: () {
                                                              sendStatus(
                                                                      context:
                                                                          context,
                                                                      orderId:
                                                                          data
                                                                              .id,
                                                                      statusId:
                                                                          4)
                                                                  .then(
                                                                      (value) {
                                                                setState(
                                                                  () {
                                                                    snapshot
                                                                        .data
                                                                        .removeAt(
                                                                            index);
                                                                  },
                                                                );
                                                              });

                                                              print(
                                                                  "orderNo----------- ${data.orderNo}");
                                                            },
                                                            child: const Text(
                                                              'Delivered',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            )),

                                                        ///

                                                        const Divider(
                                                          height: 0,
                                                        ),
                                                        TextButton(
                                                            style: TextButton.styleFrom(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        25,
                                                                    vertical:
                                                                        0),
                                                                primary: Colors
                                                                    .black),
                                                            onPressed: () {
                                                              sendStatus(
                                                                context:
                                                                    context,
                                                                orderId:
                                                                    data.id,
                                                                statusId: 5,
                                                              );

                                                              print(
                                                                  "orderNo----------- ${data.orderNo}");
                                                              setState(() {
                                                                snapshot.data
                                                                    .removeAt(
                                                                        index);
                                                              });
                                                            },
                                                            child: const Text(
                                                              'Cancelled',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                pressType:
                                                    PressType.singleClick,
                                                child: const Icon(
                                                    Icons.more_vert,
                                                    color: Colors.black),
                                              ),
                                            ),
                                    ),
                                    const Divider(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 0.0,
                                      ),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.person,
                                                      color:
                                                          AppColors.greyColor,
                                                    ),
                                                    Text(
                                                      data.orderCustomerInfo
                                                              .receiverName ??
                                                          data.orderCustomerInfo
                                                              .name,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    launch(
                                                        'tel:${data.orderCustomerInfo.receiverPhone ?? data.orderCustomerInfo.phone}');
                                                    //  data.orderCustomerInfo.phone
                                                  },
                                                  child: Row(
                                                    children: [
                                                      const Icon(Icons.phone,
                                                          color: Colors.blue),
                                                      Text(
                                                        data.orderCustomerInfo
                                                                .receiverPhone ??
                                                            data.orderCustomerInfo
                                                                .phone,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.location_on,
                                                      color:
                                                          AppColors.greyColor,
                                                    ),
                                                    Text(
                                                      data.orderCustomerInfo
                                                          .address,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            //const SizedBox(width: 25.0,),
                                            const Spacer(),
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
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        // Spacer(),
                                        AppText(
                                          text:
                                              "Products: ${double.parse(data.totalQuantity).toStringAsFixed(0)}",
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                        )
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText(
                                            text: "Payment Type :",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16.0),
                                        // Spacer(),
                                        AppText(
                                            fontWeight: FontWeight.w700,
                                            text: data.paymentType,
                                            color: AppColors.primaryColor,
                                            fontSize: 18.0)
                                      ],
                                    ),
                                    const Divider(
                                      thickness: 1,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              // elevation: 0,
                                              side: const BorderSide(
                                                  width: 0.5,
                                                  style: BorderStyle.solid),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              primary: Colors.white,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const CurrentLocationScreen()));

                                              /// ----------------------------------------calling sendStatus api -----------

                                              //  Navigator.of(context).pop();
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: const [
                                                Icon(
                                                  //  Icons.motorcycle_rounded,

                                                  //Icons.location_on_outlined,
                                                  Icons.location_on_outlined,
                                                  color: AppColors.darkColor,
                                                ),
                                                Text(
                                                  ' View Map',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: AppColors.darkColor,
                                                    fontWeight: FontWeight.w600,
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
                                                color: AppColors.darkColor,
                                              ),
                                              Text(
                                                ' View Invoice',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: AppColors.darkColor,
                                                  fontWeight: FontWeight.w600,
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
                              return Wrap();
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
          ],
        ),
      ),
    );
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
}
