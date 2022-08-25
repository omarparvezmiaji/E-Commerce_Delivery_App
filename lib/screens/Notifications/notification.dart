import 'package:delivery_app/common_widgets/Drawer.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/my_app_bar.dart';
import '../../modelClass/details_order_card.dart';
import '../../modelClass/order_card.dart';
import '../complete_delivery/completed_delivery_items.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: myDrawer(context),
        body: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              myAppBar(
                   context: context,
                  title: 'Notifications',
                  page: 'Notifications'),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 15),
                child: Row(
                  children: const [
                    Text(
                      '  Today',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.grey),
                    ),
                    Spacer(),
                    Text(
                      'Mark as read',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xffe62e03)),
                    ),
                  ],
                ),
              ),
            //  collectCard(context: context),
            // detailsOrderCard(),
              orderCard( context:context,
                time: 'Now',
                color: const Color(0xfffff4f2),
              ),

              const Text(
                '     Yesterday',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.grey),
              ),

              //   <======== calling order Card ========>
              orderCard(
                context:context,
              ),
              orderCard( context:context,),
              const Text(
                '     Last 7 Days',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.grey),
              ),
              orderCard(),
              orderCard(),
              orderCard(),
              orderCard(),
              orderCard(),
              orderCard(),
              orderCard(),
              orderCard(),
            ]),
      ),
    );
  }
}
