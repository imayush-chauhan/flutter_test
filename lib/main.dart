import 'package:flutter/material.dart';
import 'package:test_ayu/screen/RoundPlayer.dart';
import 'package:test_ayu/screen/animatedProgressBar.dart';
import 'package:test_ayu/screen/audioPlayer.dart';
import 'package:test_ayu/screen/musicPlayer.dart';
import 'package:test_ayu/screen/play.dart';

void main() async{

  runApp( MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    home: AudioPlayerFF(
      url: 'https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba-online-audio-converter.com_-1.wav',
      image: "https://source.unsplash.com/random/1920x1080/?wallpaper,landscape",
      stop: false,
    ),
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
