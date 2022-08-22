import 'package:flutter/material.dart';

import '../../modelClass/details_order_card.dart';

class AssignedScreen extends StatefulWidget {
  const AssignedScreen({Key? key}) : super(key: key);

  @override
  State<AssignedScreen> createState() => _AssignedScreenState();
}

class _AssignedScreenState extends State<AssignedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return detailsOrderCard();
          })
    );
  }
}
