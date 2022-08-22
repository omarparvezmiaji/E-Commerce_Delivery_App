import 'package:flutter/material.dart';

class AssignedScreen extends StatefulWidget {
  const AssignedScreen({Key? key}) : super(key: key);

  @override
  State<AssignedScreen> createState() => _AssignedScreenState();
}

class _AssignedScreenState extends State<AssignedScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text('AssignedScreen'),
      ),
    );
  }
}
