import 'package:flutter/material.dart';

class PickedScreen extends StatefulWidget {
  const PickedScreen({Key? key}) : super(key: key);

  @override
  State<PickedScreen> createState() => _PickedScreenState();
}

class _PickedScreenState extends State<PickedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('PickedScreen'),
      ),
    );
  }
}
