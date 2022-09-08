import 'package:flutter/material.dart';
import 'package:test_ayu/audio/audioPlayff.dart';
import 'package:test_ayu/bluetooth.dart';
import 'package:test_ayu/screen/bluetoothSerial.dart';
import 'package:test_ayu/screen/pay.dart';
import 'package:test_ayu/screen/pdfPicker.dart';
import 'package:test_ayu/screen/pdfViewer.dart';
import 'package:test_ayu/screen/urlLauncherF.dart';
import 'package:test_ayu/screen/videoPlayerFF.dart';
import 'package:test_ayu/screen/videoplayer.dart';
import 'package:test_ayu/screen/youtube_video.dart';


void main() async{

  runApp( MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<String> s = [
    "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba-online-audio-converter.com_-1.wav",
    "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba-online-audio-converter.com_-1.wav",
    "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba-online-audio-converter.com_-1.wav",
    "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba-online-audio-converter.com_-1.wav",
    "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba-online-audio-converter.com_-1.wav",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lamp Bluetooth',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UrlLauncherF(),
      // home: VPYoutube(videoUrl: "https://www.youtube.com/watch?v=BBAyRBTfsOU",),
      // home: BlueSerial(),
    // home: TrainingVideo(videoUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
    // home: ChewieDemo(s: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    // height: 100,
    // width: 100,),
    // home: BlueFlutter(),
    // home: GetImage(),
    // home: BlueFlutter(),
    // home: AudioPlayerFF(
    //   width: 0.0,
    //   height: 0.0,
    //   url: "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba-online-audio-converter.com_-1.wav",
    //   image: "https://source.unsplash.com/random/1920x1080/?wallpaper,landscape",
    // ),

    // home: AudioPlayerFF(
    //   url: s,
    //   image: "https://source.unsplash.com/random/1920x1080/?wallpaper,landscape",
    //   stop: false,
    // ),
    //   home: MusicPlayer(url: "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba-online-audio-converter.com_-1.wav",),
      // home: AnimatedProgress(sec: 20),
      // home: Play(
      //   sec: 20,
      //   play: false,
      //   mainColor: Colors.black,
      //   innerColor: Colors.white,
      // ),
      // home: PdfPicker(
      //   s: "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf",
      // ),
      // home: RoundPlayer(
      //   sec: 20,
      //   play: false,
      //   // innerColor: Colors.white,
      //   // mainColor: Colors.white,
      // ),
    );
  }
}
