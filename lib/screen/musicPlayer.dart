import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicPlayer extends StatefulWidget {

  final double? width;
  final double? height;
  final String url;
  final double? volume;
  final bool? play;
  final Color? main;
  final Color? inner;

  const MusicPlayer({Key? key,required this.url, this.height, this.width, this.main, this.play,this.inner,this.volume}) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> with WidgetsBindingObserver{

  AudioPlayer audioPlayer = AudioPlayer(playerId: "0");
  String s = "";

  @override
  void initState() {

    s = widget.url.toString();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState((){
        Data.isPlaying = state.index;
      });
    });

    if(widget.play == null || widget.play == true){
      audioPlayer.play(s);
    }else{
      Data.isPlaying = 2;
    }

    audioPlayer.setVolume(widget.volume ?? 1);

    super.initState();
  }

  pause(){
    setState((){
      audioPlayer.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    double mediaQW = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: ()async{
          if(Data.isPlaying == 1){
            await audioPlayer.pause();
          }else{
            await audioPlayer.play(s);
            audioPlayer.setVolume(widget.volume ?? 1);
          }
        },
        child: Container(
          height: widget.width ?? mediaQW*0.075,
          width: widget.width ?? mediaQW*0.075,
          decoration: BoxDecoration(
            color: widget.main ?? Colors.white,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Data.isPlaying == 1 ?
          Icon(Icons.volume_up,color: widget.inner ?? Colors.black,size: widget.width ?? mediaQW*0.06,)
              : Icon(Icons.volume_off,color: widget.inner ?? Colors.black,size: widget.width ?? mediaQW*0.06,),
        ),
      ),
    );
  }

}

class Data {
  static int isPlaying = 1;
}
