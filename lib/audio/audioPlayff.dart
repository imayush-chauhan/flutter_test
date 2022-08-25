import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerFF extends StatefulWidget {
  final double width;
  final double height;
  final String url;
  final String? image;
  final bool? stop;

  AudioPlayerFF(
      {this.image,
        required this.url,
        required this.height,
        this.stop,
        required this.width});

  @override
  State<AudioPlayerFF> createState() => _AudioPlayerFFState();
}

class _AudioPlayerFFState extends State<AudioPlayerFF>{
  AudioPlayer audioPlayer = AudioPlayer(playerId: "0");

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  bool stop = true;

  @override
  void initState() {
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState((){
        Data.isPlaying = state.index;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState((){
        duration = newDuration;
      });
    });

    audioPlayer.setUrl(widget.url);

    audioPlayer.onAudioPositionChanged.listen((newDuration) {
      setState((){
        position = newDuration;
      });
    });

    super.initState();
  }


  String formatTime(Duration duration){
    String twoDigits(int n) => n.toString().padLeft(2,"0");
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if( duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(":");
  }

  pause(){
    setState((){
      audioPlayer.stop();
      // Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    double mediaQH = MediaQuery.of(context).size.height;
    double mediaQW = MediaQuery.of(context).size.width;
    if(widget.stop == true && stop == true){
      setState((){
        audioPlayer.stop();
        stop = false;
      });
    }
    return WillPopScope(
      onWillPop: (){
        return pause();
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            height: mediaQH*0.125,
            width: mediaQW*0.8,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: NetworkImage(widget.image!),fit: BoxFit.fitWidth),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(formatTime(position) + "/",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: mediaQW*0.04,
                            ),),
                            Text(formatTime(duration),style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: mediaQW*0.04,
                            ),),
                          ],
                        ),
                        GestureDetector(
                          onTap: ()async{
                            if(Data.isPlaying == 1){
                              await audioPlayer.pause();
                              print("pause");
                            }else{
                              await audioPlayer.play(widget.url);
                              print("play");
                            }
                          },
                          child: Container(
                            height: mediaQW*0.075,
                            width: mediaQW*0.075,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Data.isPlaying == 1 ? Icon(Icons.pause,color: Colors.black,size: 20,) : Icon(Icons.play_arrow,color: Colors.black,size: 20,),
                          ),
                        )
                      ],
                    ),
                  ),
                  Slider(
                    min: 0,
                    inactiveColor: Colors.white.withOpacity(0.9),
                    activeColor: Colors.white.withOpacity(0.4),
                    thumbColor: Colors.black.withOpacity(0.2),
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    onChanged: (_)async{
                      final position =Duration(seconds: _.toInt());
                      await audioPlayer.seek(position);
                      await audioPlayer.resume();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Data {
  static int isPlaying = 0;
}
