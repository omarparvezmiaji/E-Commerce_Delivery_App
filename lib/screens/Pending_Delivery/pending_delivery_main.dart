import 'package:delivery_app/screens/Pending_Delivery/assigned_screen.dart';
import 'package:delivery_app/screens/Pending_Delivery/on_the_way_screen.dart';
import 'package:delivery_app/screens/Pending_Delivery/picked_screen.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../../common_widgets/Drawer.dart';
import '../../common_widgets/my_app_bar.dart';
import '../../modelClass/api_request/order_model.dart';
import '../../modelClass/tab_widget.dart';
import '../../services.dart';


class PendingDelivery extends StatefulWidget {
  const PendingDelivery({Key? key}) : super(key: key);

  @override
  State<PendingDelivery> createState() => _PendingDeliveryState();
}

class _PendingDeliveryState extends State<PendingDelivery>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 3, vsync: this);
  // late OrderResponse orderData;
  //
  // @override
  // initState() {
  //   super.initState();
  //   var _baseUrl = 'https://appsafwahmart.hotelsetting.com/api/delivery-app';
  //
  //   Future getOrder() async {
  //     var client = http.Client();
  //     var uri = Uri.parse("$_baseUrl/get-orders-by-delivery-man/7");
  //     var response = await client.get(uri,headers: {'Authorization': "1146|IJzOJtaBBiObwn3ASoTEIHgQrZE9if3U6yShxuw0"});
  //     if (response.statusCode == 200) {
  //       var json = response.body;
  //      // return orderResponseFromJson(json);
  //       orderData= orderResponseFromJson(json);
  //     }
  //   }
  //   // getData();
  // }
  //
  // // getData() async {
  // //   orderData = await RemoteService().getOrder();
  // // }

  @override
  Widget build(BuildContext context) {
   // print("orderData length -------- ${orderData.data.length}    ");
    return SafeArea(
      child: Scaffold(
        drawer: myDrawer(context),
        body: Column(
          children: [

            myAppBar(
                context: context,
                title: 'Pending Delivery',
                page: 'Pending Delivery'),
            Card(
              //  margin: const EdgeInsets.all(10),
              //borderOnForeground: true,
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: TabBar(
                    labelStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w900),
                    labelColor: Colors.red,
                    indicatorWeight: 10,
                    controller: _tabController,
                    indicator: const BoxDecoration(

                        //  borderRadius: BorderRadius.circular(25),
                        // color: AppColors.greyColor,

                        ),
                    unselectedLabelColor: Colors.grey,
                    // isScrollable: true,
                    // indicatorColor: Colors.yellow,
                    tabs: [
                      // Icon(Icons.person_add,color: Colors.red,),
                      //
                      //  Text('\nOn The Way (12)'),
                      //
                      //  Text('\nPicked (2)'),
                      //  Text('\nAssigned (5)'),

                      // Text('On The Way (12)'),
                      //
                      // Text('Picked (2)'),
                      // Text('Assigned (5)'),
                      tabWidget(
                          text: 'Assigned\n     (5)',
                          imagePath: "assets/dashboard/complet.png"),
                      tabWidget(
                          text: 'Picked\n     (2)',
                          imagePath: "assets/dashboard/collection.png"),
                      tabWidget(
                          text: 'On The Way\n     (12)',
                          imagePath: 'assets/complete delivery.png'),
                    ]),
              ),
            ),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: const [
                AssignedScreen(),
                PickedScreen(),
                OnTheWayScreen(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
