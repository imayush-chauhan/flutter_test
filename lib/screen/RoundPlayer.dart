// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';
//
// class RoundPlayer extends StatefulWidget {
//
//   final double? width;
//   final double? height;
//   final bool? play;
//   final int? sec;
//   final int? addSec;
//   final Color? mainColor;
//   final Color? innerColor;
//
//   RoundPlayer(
//       {
//         this.innerColor,
//         this.mainColor,
//         this.height,
//         this.play,
//         this.sec,
//         this.addSec,
//         this.width,
//       });
//
//   @override
//   State<RoundPlayer> createState() => _RoundPlayerState();
// }
//
// class _RoundPlayerState extends State<RoundPlayer> {
//
//
//
//   int count = 0;
//
//   Timer? timer;
//
//   @override
//   void initState() {
//     super.initState();
//     isPlay = widget.play ?? true;
//     count = widget.sec ?? 20;
//     add();
//     count += widget.addSec ?? 0;
//   }
//
//   bool isPlay = false;
//
//   add(){
//     timer = Timer.periodic(
//         Duration(
//             milliseconds: 1000), (timer) {
//       setState(() {
//         if(isPlay == true){
//           if(count > 0){
//             count -= 1;
//           }else{
//             setState((){
//               isPlay = false;
//               count = widget.sec ?? 20;
//             });
//           }
//         }
//
//       });
//     });
//   }
//
//   Widget _getThirdProgressBar() {
//     return SizedBox(
//       height: 100,
//       width: 100,
//       child: SfRadialGauge(axes: <RadialAxis>[
//         RadialAxis(
//             showLabels: false,
//             showTicks: false,
//             startAngle: 270,
//             endAngle: 270,
//             radiusFactor: 0.8,
//             axisLineStyle: const AxisLineStyle(
//               thickness: 0.05,
//               thicknessUnit: GaugeSizeUnit.factor,
//             ),
//             pointers: <GaugePointer>[
//               RangePointer(
//                   value: (100*count)/widget.sec!,
//                   width: 0.15,
//                   sizeUnit: GaugeSizeUnit.factor,
//                   enableAnimation: true,
//                   color: widget.mainColor ?? Colors.black,
//                   animationDuration: 20,
//                   animationType: AnimationType.linear)
//             ],
//             annotations: <GaugeAnnotation>[
//
//               GaugeAnnotation(positionFactor: 0.05,
//               widget: Text(count.toString(),
//                 style: TextStyle(
//                   color: widget.innerColor ?? Colors.black,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 20,
//               ),),
//               //     widget: isPlay == true  ?
//               //
//               //  Icon(Icons.pause,color: widget.innerColor ?? Colors.black,) :
//               //
//               // Icon(Icons.play_arrow,color: widget.innerColor ?? Colors.black,)
//               )
//             ])
//       ]),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // AnimatedSwitcher(
//               //   duration: Duration(milliseconds: 300),
//               //   child: Text(count.toString(),style: TextStyle(
//               //     fontSize: MediaQuery.of(context).size.width*0.25,
//               //     color: Colors.white
//               //   ),
//               //     key: ValueKey(count),
//               //   ),
//               //   transitionBuilder: (child,animation){
//               //     return ScaleTransition(scale: animation,child: child,);
//               //   },
//               // ),
//               _getThirdProgressBar(),
//               SizedBox(
//                 height: 5,
//               ),
//               GestureDetector(
//                 onTap: (){
//                   if(isPlay == false){
//                     setState((){
//                       isPlay = true;
//                     });
//                   }else{
//                     setState((){
//                       isPlay = false;
//                     });
//                   }
//                 },
//                 child: Container(
//                   height: 35,
//                   width: 80,
//                   decoration: BoxDecoration(
//                     color: widget.mainColor ?? Colors.black,
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   alignment: Alignment.center,
//                   child: Text(
//                   isPlay == false ? "Start" : "Pause",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16,
//                     ),),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
