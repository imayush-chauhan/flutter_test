import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_camera/flutter_camera.dart';

class GetVideo extends StatefulWidget {
  final double height;
  final double width;

  const GetVideo({Key? key,required this.height, required this.width}) : super(key: key);

  @override
  State<GetVideo> createState() => _GetVideoState();
}

class _GetVideoState extends State<GetVideo> {

  static getVideo(){
    return File(Data.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: widget.height,
        width: widget.width,
        color: Colors.transparent,
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return TheVideo();
            }),);
          },
          child: Container(
              height: widget.width*0.8,
              width: widget.width*0.8,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Icon(Icons.camera,color: Colors.white,)
          ),
        ),
      ),
    );

  }
}

class Data {
  static String path = "";
}

class TheVideo extends StatefulWidget {
  @override
  State<TheVideo> createState() => _TheVideoState();
}

class _TheVideoState extends State<TheVideo> {
  @override
  Widget build(BuildContext context) {
    return FlutterCamera(
      color: Colors.blue,
      onVideoRecorded: (value) {
        setState(() {
          Data.path = value.path;
        });
      },
    );
  }
}
