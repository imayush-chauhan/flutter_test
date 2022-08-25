import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class BlueFlutter extends StatefulWidget {
  const BlueFlutter({Key? key}) : super(key: key);

  @override
  State<BlueFlutter> createState() => _BlueFlutterState();
}

class _BlueFlutterState extends State<BlueFlutter> {

  bool searching = false;

  final flutterReactiveBle = FlutterReactiveBle();

  final Uuid serviceUuid = Uuid.parse("75C276C3-8F97-20BC-A143-B354244886D4");

  scan(){
    flutterReactiveBle.scanForDevices(withServices: [serviceUuid], scanMode: ScanMode.lowLatency).listen((device) {
      print(device.name);
    });
  }

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
                setState((){
                  if(searching == false){
                    searching = true;
                    scan();
                  }else{
                    searching = false;
                    flutterReactiveBle.deinitialize();
                  }
                });
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
