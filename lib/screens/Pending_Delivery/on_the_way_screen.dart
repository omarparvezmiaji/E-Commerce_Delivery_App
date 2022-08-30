import 'package:delivery_app/modelClass/card2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modelClass/details_order_card.dart';

class OnTheWayScreen extends StatefulWidget {
  const OnTheWayScreen({Key? key}) : super(key: key);

  @override
  State<OnTheWayScreen> createState() => _OnTheWayScreenState();
}

class _OnTheWayScreenState extends State<OnTheWayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 12,
            itemBuilder: (context, index) {
              return detailsOrderCard2();
            })


        );
  }
}
