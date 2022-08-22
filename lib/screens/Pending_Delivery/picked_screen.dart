import 'package:flutter/material.dart';

import '../../modelClass/details_order_card.dart';

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
      body:  ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
            return detailsOrderCard();
          })
    );
  }
}
