import 'package:delivery_app/screens/Pending_Delivery/assigned_screen.dart';
import 'package:delivery_app/screens/Pending_Delivery/on_the_way_screen.dart';
import 'package:delivery_app/screens/Pending_Delivery/picked_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/my_app_bar.dart';
import '../../modelClass/tab_widget.dart';
import '../../styles/colors.dart';

class PendingDelivery extends StatefulWidget {
  const PendingDelivery({Key? key}) : super(key: key);

  @override
  State<PendingDelivery> createState() => _PendingDeliveryState();
}

class _PendingDeliveryState extends State<PendingDelivery>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            myAppBar(
                context: context,
                title: 'Pending Delivery',
                page: 'Pending Delivery'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                  labelStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w900),
                  labelColor: Colors.red,
                  indicatorWeight: 10,
                  controller: _tabController,
                  indicator: BoxDecoration(

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
                      text: 'On The Way (12)',
                      imagePath: 'assets/delivery_man_Login.png',

                    ),
                    tabWidget(text: 'Picked (2)'),
                    tabWidget(text: 'Assigned (5)'),
                  ]),
            ),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: const [
                OnTheWayScreen(),
                PickedScreen(),
                AssignedScreen()
              ],
            ))
          ],
        ),
      ),
    );
  }
}
