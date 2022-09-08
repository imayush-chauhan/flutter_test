import 'package:flutter/material.dart';
import 'package:test_ayu/video/video_player.dart';

class TrainingVideo extends StatefulWidget {

  final double? height;
  final double? width;
  final String? videoUrl;
  TrainingVideo({
    this.videoUrl,
    this.height,
    this.width,
  });

  @override
  _TrainingVideoState createState() => _TrainingVideoState();
}

class _TrainingVideoState extends State<TrainingVideo> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl!)
      ..addListener(() {
        setState(() {
        });
      })..setLooping(true)
      ..initialize().then((value) => _controller!.play());
  }

  bool show = false;


  forwardOr(Duration duration){
    _controller!.seekTo(duration);
  }

  skipNext(int i){
    _controller!.pause();
    _controller = VideoPlayerController.network(widget.videoUrl!)
      ..addListener(() {
        setState(() {
        });
      })..setLooping(true)
      ..initialize().then((value) => _controller!.play());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:
        _controller!.value.isInitialized
            ? Column(
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      show = true;
                    });
                    Future.delayed(Duration(milliseconds: 1500),(){
                      setState(() {
                        show = false;
                      });
                    });
                  },
                  child: Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: VideoPlayer(_controller!),
                      ),
                      _controller!.value.isPlaying == false || show == true ?
                      AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    _controller!.value.isPlaying
                                        ? _controller!.pause()
                                        : _controller!.play();
                                  });
                                },
                                child: Icon(
                                  _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                ),
                              ),

                              Slider(
                                min: 0,
                                inactiveColor: Colors.grey,
                                activeColor: Colors.blue,
                                thumbColor: Colors.blue,
                                max: _controller!.value.duration.inSeconds.toDouble(),
                                value: _controller!.value.position.inSeconds.toDouble(),
                                onChanged: (_)async{
                                  final position = Duration(seconds: _.toInt());
                                  await _controller!.seekTo(position);
                                },
                              ),
                            ],
                          ),
                        ),
                      ) : Container(),
                    ],
                  ),
                ),


                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     FloatingActionButton(
                //       onPressed: () {
                //         setState(() {
                //         });
                //       },
                //       child: Icon(
                //         Icons.skip_previous,color: Colors.white,
                //       ),
                //     ),
                //     FloatingActionButton(
                //       onPressed: () {
                //         skipNext(1);
                //       },
                //       child: Icon(
                //         Icons.skip_next,color: Colors.white,
                //       ),
                //     ),
                //   ],
                // )


                // LinearProgressIndicator(
                //   color: Colors.blue,
                //   backgroundColor: Colors.grey,
                //   value: _controller!.value.position.inSeconds/total,
                // ),

                // Text(total.toString()),
                // Text(_controller!.value.position.inSeconds.toString()),
                // Text((total/_controller!.value.position.inSeconds).toString()),
              ],
            )
            :
        Center(child: CircularProgressIndicator()),
      ),
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller!.dispose();
  // }
}
