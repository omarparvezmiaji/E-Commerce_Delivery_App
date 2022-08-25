// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: const Center(
//           child: MyStatefulWidget(),
//         ),
//       ),
//     );
//   }
// }
//
// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);
//
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }
//
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   String dropdownValue = 'Today';
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.deepPurple),
//       underline: Container(
//         height: 2,
//         color: Colors.deepPurpleAccent,
//       ),
//       onChanged: (String? newValue) {
//         setState(() {
//           dropdownValue = newValue!;
//         });
//       },
//       items: <String>['Today', 'Last Day', 'Last Week', 'Last Month']
//           .map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }


import 'package:delivery_app/common_widgets/app_text.dart';
import 'package:delivery_app/styles/colors.dart';
import 'package:flutter/material.dart';
class DropdownDemo extends StatefulWidget {
  const DropdownDemo({Key? key}) : super(key: key);
  @override
  State<DropdownDemo> createState() => _DropdownDemoState();
}
class _DropdownDemoState extends State<DropdownDemo> {
  String dropdownValue = 'Today';
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            // SizedBox(
            //   height: 50,
            // ),
            // Step 2.
            DropdownButton<String>(
              // Step 3.


              value: dropdownValue,
              // Step 4.
              items: <String>['Today', 'Last Day', 'Last Week', 'Last Month']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: AppText(text: value,fontSize:  18.0,color:  AppColors.darkColor)
                );
              }).toList(),
              // Step 5.

              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // Text(
            //   'Selected Value: $dropdownValue',
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // )
          ],
        ),
      );
  }
}