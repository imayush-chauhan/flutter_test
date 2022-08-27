import 'package:flutter/material.dart';
import 'package:test_ayu/audio/audioPlayff.dart';

class BlueFlutter extends StatefulWidget {
  const BlueFlutter({Key? key}) : super(key: key);

  @override
  State<BlueFlutter> createState() => _BlueFlutterState();
}

class _BlueFlutterState extends State<BlueFlutter> {

  bool searching = false;

  @override
  Widget build(BuildContext context) {
    double mediaQH = MediaQuery.of(context).size.height;
    double mediaQW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: mediaQH,
        width: mediaQW,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return AudioPlayerFF(
                    url: "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba-online-audio-converter.com_-1.wav",
                    height: 200,
                    width: 200,
                    stop: false,
                  );
                }));
                // setState((){
                //   if(searching == false){
                //     searching = true;
                //   }else{
                //     searching = false;
                //   }
                // });
              },
              child: Container(
                height: mediaQW*0.125,
                width: mediaQW*0.125,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: searching == false ?
                Icon(Icons.bluetooth,color: Colors.white,) :
                Icon(Icons.search,color: Colors.white,),

              ),
            )

            // MaterialButton(shape: BoxShape.circle,
            //   height: mediaQW*0.1,
            //   color: Colors.blue,
            //   onPressed: (){},
            //   child: Icon(Icons.bluetooth,color: Colors.white,),
            // ),
          ],
        ),
      ),
    );
  }
}
