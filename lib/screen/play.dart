// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// class Play extends StatefulWidget {
//   final double width;
//   final double height;
//   final int? sec;
//   final int? addSec;
//   final bool? play;
//   final Color? mainColor;
//   final Color? innerColor;
//
//   Play({
//     required this.height,
//     this.mainColor,
//     this.play,
//     this.innerColor,
//     this.sec,
//     required this.width,
//     this.addSec,
//   });
//
//   @override
//   State<Play> createState() => _PlayState();
// }
//
// class _PlayState extends State<Play> {
//   int count = 0;
//
//   Timer? timer;
//
//   @override
//   void initState() {
//     super.initState();
//     allow = widget.play ?? false;
//     count = widget.sec!;
//     add();
//     count += widget.addSec ?? 0;
//   }
//
//   bool allow = false;
//
//   add() {
//     timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
//       setState(() {
//         if(allow == true){
//           if (count > 0) {
//             count -= 1;
//           }else{
//             count = widget.sec!;
//             allow = false;
//           }
//         }
//       });
//     });
//   }
//
//   static get(int count){
//     return count;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double mediaQH =  MediaQuery.of(context).size.height;
//     double mediaQW = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Container(
//         height: mediaQH,
//         width: mediaQW,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               AnimatedSwitcher(
//                 duration: Duration(milliseconds: 300),
//                 child: Text(
//                   count.toString(),
//                   style: TextStyle(
//                     fontSize: mediaQW * 0.25,
//                     color: widget.mainColor ?? Colors.black,
//                   ),
//                   key: ValueKey(count),
//                 ),
//                 transitionBuilder: (child, animation) {
//                   return ScaleTransition(
//                     scale: animation,
//                     child: child,
//                   );
//                 },
//               ),
//
//               SizedBox(
//                 height: 5,
//               ),
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//
//                   GestureDetector(
//                     onTap: (){
//                       setState((){
//                         allow = !allow;
//                         if(allow == false){
//                           get(count);
//                         }
//                       });
//                     },
//                     child: Container(
//                       height: mediaQH*0.05,
//                       width: mediaQW*0.3,
//                       decoration: BoxDecoration(
//                         color: widget.mainColor ?? Colors.black,
//                         borderRadius: BorderRadius.circular(mediaQH*0.025),
//                       ),
//                       alignment: Alignment.center,
//                       child: Text(
//                         allow == false ? "Play" : "Stop",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: mediaQW*0.0425,
//                           color: widget.innerColor ?? Colors.white,
//                       ),),
//                     ),
//                   ),
//
//                 ],
//               )
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
