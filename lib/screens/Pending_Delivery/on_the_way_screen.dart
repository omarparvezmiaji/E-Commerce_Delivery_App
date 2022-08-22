import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnTheWayScreen extends StatefulWidget {
  const OnTheWayScreen({Key? key}) : super(key: key);

  @override
  State<OnTheWayScreen> createState() => _OnTheWayScreenState();
}

class _OnTheWayScreenState extends State<OnTheWayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('OnTheWayScreen'),
      ),
    );
  }
}
