// import 'package:flutter/material.dart';
// import 'package:countdown_flutter/countdown_flutter.dart';
//
// class Countdownflutter extends StatefulWidget {
//   const Countdownflutter({
//     Key key,
//     this.width,
//     this.height,
//   }) : super(key: key);
//
//   final double width;
//   final double height;
//
//   @override
//   _CountdownflutterState createState() => _CountdownflutterState();
// }
//
// class _CountdownflutterState extends State<Countdownflutter> {
//   var _done = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(_done ? 'Finished!' : 'Counting...'),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: <Widget>[
//             Center(
//               child: CountdownFormatted(
//                 duration: Duration(hours: 1),
//                 builder: (BuildContext ctx, String remaining) {
//                   return Text(
//                     remaining,
//                     style: TextStyle(fontSize: 30),
//                   ); // 01:00:00
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
