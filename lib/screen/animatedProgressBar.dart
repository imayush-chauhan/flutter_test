import 'dart:async';
import 'package:flutter/material.dart';

class AnimatedProgress extends StatefulWidget {
  final double? width;
  final double? height;
  final int sec;
  final bool? play;
  final Color? main;
  final Color? inner;

  const AnimatedProgress({Key? key,this.width,this.height,required this.sec,this.play,this.main,this.inner}) : super(key: key);

  @override
  State<AnimatedProgress> createState() => _AnimatedProgressState();
}

class _AnimatedProgressState extends State<AnimatedProgress> {

  int count = 0;

  Timer? timer;

  @override
  void initState() {
    super.initState();
    allow = widget.play ?? true;
    add();
  }

  bool allow = false;

  add() {
    timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        if(allow == true){
          if (count < widget.sec!) {
            count += 1;
          }else{
            // count = widget.sec;
            // allow = false;
          }
        }
      });
    });
  }

  static get(int count){
    return count;
  }

  @override
  Widget build(BuildContext context) {
    double mediaQH = MediaQuery.of(context).size.height;
    double mediaQW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: widget.height ?? mediaQH*0.005,
            width: widget.width ?? mediaQW*0.8,
            color: widget.inner ?? Colors.grey.shade300,
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.linear,
            height: widget.height ?? mediaQH*0.005,
            width: (widget.width ?? mediaQW*0.8/widget.sec!)*count,
            color: widget.main ?? Colors.orange,
          ),
        ],
      ),
    );
  }

}
