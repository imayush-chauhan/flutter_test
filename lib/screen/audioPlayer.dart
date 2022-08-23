import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerFF extends StatefulWidget {
  final double? width;
  final double? height;
  final List<String> url;
  final String? image;
  final bool? stop;

  AudioPlayerFF(
      {this.image,
        required this.url,
        this.height,
        this.stop,
        this.width});

  @override
  State<AudioPlayerFF> createState() => _AudioPlayerFFState();
}

class _AudioPlayerFFState extends State<AudioPlayerFF> {

  AudioPlayer audioPlayer = AudioPlayer(playerId: "1");

  late AnimationController controller;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String s = "";

  int inx = 0;

  bool loop = false;

  @override
  void initState() {

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState((){
        Data.isPlaying = state.index;
      });
      if(loop == true && state.name == "COMPLETED"){
        play();
      }
      print(state.name);
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState((){
        duration = newDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newDuration) {
      setState((){
        position = newDuration;
      });
    });

    // audioPlayer.setUrl(widget.url[inx]);

    s = widget.image ?? "https://source.unsplash.com/random/1920x1080/?wallpaper,landscape";

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
      audioPlayer.pause();
      // Navigator.of(context).pop();
    });
  }

  stop(){
    setState((){
      audioPlayer.stop();
      // Navigator.of(context).pop();
    });
  }

  play(){
    stop();
    Future.delayed(Duration(milliseconds: 100),(){
      setState((){
        audioPlayer.play(widget.url[inx]).then((value) {
          s = "https://source.unsplash.com/random/1920x1080/?wallpaper,landscape";
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double mediaQH = MediaQuery.of(context).size.height;
    double mediaQW = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: mediaQH,
        width: mediaQW,
        color: Color(0xffffebf3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            image(mediaQW),

            name(mediaQW),

            musicBar(mediaQW),

            bottomIcons(mediaQW),

          ],
        ),
      ),
    );
  }

  name(double mediaQW){
    return Column(
      children: [

        Text("Let me Love you",
          style: TextStyle(
            color: Colors.black.withOpacity(0.75),
            fontWeight: FontWeight.bold,
            fontSize: mediaQW*0.0525,
          ),),
        SizedBox(
          height: 5,
        ),
        Text("Justin Bieber",
          style: TextStyle(
            color: Colors.black.withOpacity(0.25),
            fontWeight: FontWeight.w600,
            fontSize: mediaQW*0.045,
          ),),
      ],
    );
  }

  image(double mediaQW){
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: mediaQW*0.57,
          width: mediaQW*0.57,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          // child: Image.network(widget.image!,fit: BoxFit.cover,),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(mediaQW*0.5),
          child: Container(
            height: mediaQW*0.5,
            width: mediaQW*0.5,
            child: Image.network(widget.image!,fit: BoxFit.cover,),
          ),
        ),

        Container(
          height: mediaQW*0.05,
          width: mediaQW*0.05,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }

  musicBar(double mediaQW){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Text(formatTime(position),style: TextStyle(
          color: Colors.black.withOpacity(0.75),
          fontWeight: FontWeight.w600,
          fontSize: mediaQW*0.04,
        ),),

        Container(
          width: mediaQW*0.7,
          child: Slider(
            min: 0,
            inactiveColor: Colors.grey.shade300,
            activeColor: Colors.orange,
            thumbColor: Colors.orange,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds.toDouble(),
            onChanged: (_)async{
              final position =Duration(seconds: _.toInt());
              await audioPlayer.seek(position);
              await audioPlayer.resume();
            },
          ),
        ),

        Text(formatTime(duration),style: TextStyle(
          color: Colors.black.withOpacity(0.75),
          fontWeight: FontWeight.w600,
          fontSize: mediaQW*0.04,
        ),),

      ],
    );
  }

  topIcons(double mediaQW){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.subdirectory_arrow_right_sharp,
            color: Colors.orange,
            size: mediaQW*0.065,
          ),
        ),

        IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.add,
            color: Colors.orange,
            size: mediaQW*0.07,
          ),
        ),

        IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.arrow_downward,
            color: Colors.orange,
            size: mediaQW*0.07,
          ),
        ),


        IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.favorite_border,
            color: Colors.orange,
            size: mediaQW*0.065,
          ),
        ),
      ],
    );
  }

  bottomIcons(double mediaQW){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        IconButton(
          onPressed: (){
            setState((){
              loop = !loop;
            });
          },
          icon: Icon(
            Icons.loop,
            color: loop == false ? Colors.black.withOpacity(0.3) : Colors.orange,
            size: mediaQW*0.065,
          ),
        ),

        IconButton(
          onPressed: (){
            setState((){
              if(inx > 0){
                inx--;
                play();
              }
            });
          },
          icon: Icon(
            Icons.skip_previous,
            color: inx > 0 ? Colors.orange : Colors.black.withOpacity(0.3),
            size: mediaQW*0.07,
          ),
        ),

        InkWell(
          onTap: () async{
            if(Data.isPlaying == 1){
              await audioPlayer.pause();
            }else{
              await audioPlayer.play(widget.url[inx]);
            }
            print(Data.isPlaying);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: mediaQW*0.135,
                width: mediaQW*0.135,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                // child: Image.network(widget.image!,fit: BoxFit.cover,),
              ),

              Container(
                height: mediaQW*0.12,
                width: mediaQW*0.12,
                decoration: BoxDecoration(
                  color: Color(0xffffebf3),
                  shape: BoxShape.circle,
                ),
                // child: Image.network(widget.image!,fit: BoxFit.cover,),
              ),

              Data.isPlaying == 1 ?
              Icon(Icons.pause,color: Colors.orange,size: mediaQW*0.065,) :
              Icon(Icons.play_arrow,color: Colors.orange,size: mediaQW*0.065,),

              // AnimatedIcon(
              //   color: Colors.orange,
              //   icon: AnimatedIcons.play_pause,
              //   progress: controller,
              //   size: mediaQW*0.065,
              // ),



            ],
          ),
        ),

        IconButton(
          onPressed: (){
            print("hmm");
            setState((){
              if(inx < widget.url.length - 1){
                inx++;
                play();
              }
            });
          },
          icon: Icon(
            Icons.skip_next,
            color: inx < widget.url.length - 1 ? Colors.orange : Colors.black.withOpacity(0.3),
            size: mediaQW*0.07,
          ),
        ),

        IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.shuffle,
            color: Colors.orange,
            size: mediaQW*0.065,
          ),
        ),
      ],
    );
  }

}

class Data {
  static int isPlaying = 0;
}
