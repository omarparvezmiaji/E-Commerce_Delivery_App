import 'package:flutter/material.dart';

import '../../modelClass/api_request/order_model.dart';
import '../../modelClass/details_order_card.dart';
import '../../services.dart';

class AssignedScreen extends StatefulWidget {
  const AssignedScreen({Key? key}) : super(key: key);

  @override
  State<AssignedScreen> createState() => _AssignedScreenState();
}

class _AssignedScreenState extends State<AssignedScreen> {
   OrderResponse? orderData;

  @override
  initState() {
    super.initState();

    ///  fetching data
    getData();
    print("orderData length -------- ${orderData?.data.length}    ");
  }

  getData() async {
    orderData = await RemoteService().getOrder();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: ListView.builder(
            physics: const BouncingScrollPhysics(),
         // itemCount: 5,
       itemCount: orderData?.data.length,

            itemBuilder: (context, index) {
              print('length: ${orderData?.data.length}');
              return detailsOrderCard();
            }));
  }
}
