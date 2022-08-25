import 'package:flutter/material.dart';

import '../../modelClass/details_order_card.dart';
import '../complete_delivery/completed_delivery_items.dart';

class PickedScreen extends StatefulWidget {
  const PickedScreen({Key? key}) : super(key: key);

  @override
  State<PickedScreen> createState() => _PickedScreenState();
}

class _PickedScreenState extends State<PickedScreen> {
  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
       body: ListView.builder(
           shrinkWrap: true,
           physics: const BouncingScrollPhysics(),
           itemCount: 4,
           itemBuilder: (context, index) {
             return detailsOrderCard();
           }),
    );
  }
}
