// import 'dart:async';
// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
//
// class BlueSerial extends StatefulWidget {
//   final double? height;
//   final double? width;
//   final bool? search;
//   final bool? onOff;
//   final bool? temp;
//
//   const BlueSerial({Key? key,this.search,this.width,this.height,this.temp,this.onOff}) : super(key: key);
//
//   @override
//   State<BlueSerial> createState() => _BlueSerialState();
// }
//
// class _BlueSerialState extends State<BlueSerial> {
//
//   BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
//
//   String _address = "...";
//   String _name = "...";
//
//   sendDataTo(bool t)async{
//     if(connection!.isConnected){
//       connection!.output.add(Uint8List.fromList(utf8.encode(widget.onOff == true ? "GLAMA" : "GLAMB")));
//       await connection!.output.allSent;
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     // Get current state
//     if(widget.search == true){
//       startDiscovery();
//     }
//     FlutterBluetoothSerial.instance.state.then((state) {
//       setState(() {
//         _bluetoothState = state;
//       });
//     });
//
//     Future.doWhile(() async {
//       // Wait if adapter not enabled
//       if (await FlutterBluetoothSerial.instance.isEnabled != null) {
//         return false;
//       }
//       await Future.delayed(Duration(milliseconds: 0xDD));
//       return true;
//     }).then((_) {
//       // Update the address field
//       FlutterBluetoothSerial.instance.address.then((address) {
//         setState(() {
//           _address = address!;
//           print("Address: $_address");
//         });
//       });
//     });
//
//     FlutterBluetoothSerial.instance.name.then((name) {
//       setState(() {
//         _name = name!;
//         print("name: $_name");
//       });
//     });
//
//     // Listen for futher state changes
//     FlutterBluetoothSerial.instance
//         .onStateChanged()
//         .listen((BluetoothState state) {
//       setState(() {
//         _bluetoothState = state;
//       });
//     });
//   }
//
//   BluetoothConnection? connection;
//
//   sendData(String s)async{
//     if(connection!.isConnected){
//       connection!.output.add(Uint8List.fromList(utf8.encode(s)));
//       await connection!.output.allSent;
//     }
//   }
//
//   connect(String address,String device)async{
//     try {
//       await BluetoothConnection.toAddress(address).then((value) {
//         connection = value;
//         print('Connected to the device');
//         setState(() {
//           ConnectionStatus.connect = true;
//           ConnectionStatus.device = device;
//         });
//
//         if(widget.onOff == true){
//           sendData("GLAMA");
//           setState(() {
//             ConnectionStatus.status = true;
//           });
//         }else{
//           sendData("GLAMB");
//           setState(() {
//             ConnectionStatus.status = false;
//           });
//         }
//
//       });
//
//
//     }
//     catch (exception) {
//       print('Cannot connect, exception occured');
//     }
//   }
//
//   @override
//   void dispose() {
//     FlutterBluetoothSerial.instance.setPairingRequestHandler(null);
//     super.dispose();
//   }
//
//   List<BluetoothDiscoveryResult> results = [];
//   List<BluetoothDevice> dev = [];
//   late StreamSubscription<BluetoothDiscoveryResult> _streamSubscription;
//
//   void startDiscovery() {
//     _streamSubscription = FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
//       setState(() {
//         results.add(r);
//         dev.add(r.device);
//         if(r.device.name!.startsWith("MyESP32-LE")){
//           connect(r.device.address,r.device.name ?? "");
//         }
//       });
//       print("Result ${r.device.name}");
//     });
//
//     _streamSubscription.onDone(() {
//       // print(results);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 25,
//               ),
//               Divider(),
//               ListTile(title: const Text('General')),
//               SwitchListTile(
//                 title: const Text('Enable Bluetooth'),
//                 value: _bluetoothState.isEnabled,
//                 onChanged: (bool value) {
//                   // Do the request and update with the true value then
//                   future() async {
//                     // async lambda seems to not working
//                     if (value)
//                       await FlutterBluetoothSerial.instance.requestEnable();
//                     else
//                       await FlutterBluetoothSerial.instance.requestDisable();
//                   }
//
//                   future().then((_) {
//                     setState(() {});
//                   });
//                 },
//               ),
//               ListTile(
//                 title: const Text('Bluetooth status'),
//                 subtitle: Text(_bluetoothState.toString()),
//                 trailing: RaisedButton(
//                   child: const Text('Settings'),
//                   onPressed: () {
//                     FlutterBluetoothSerial.instance.openSettings();
//                   },
//                 ),
//               ),
//
//               ListTile(
//                 title: const Text('Local adapter address'),
//                 subtitle: Text(_address),
//               ),
//               ListTile(
//                 title: const Text('Local adapter name'),
//                 subtitle: Text(_name),
//                 onLongPress: null,
//               ),
//               Divider(),
//
//               !ConnectionStatus.connect ?
//               ListView.builder(
//                 itemCount: results.length,
//                 shrinkWrap: true,
//                 itemBuilder: (context,index){
//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(results[index].device.name!),
//                       MaterialButton(
//                         onPressed: (){
//                           connect(dev[index].address, results[index].device.name ?? "");
//                         },
//                         color: Colors.blue,
//                         child: Text("connect",style: TextStyle(color: Colors.white),),
//                       ),
//                     ],
//                   );
//                 },
//               ) :
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text("Connected to ${ConnectionStatus.device}",style: TextStyle(color: Colors.white),),
//                   widget.temp == true ?
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       MaterialButton(
//                         onPressed: (){
//                           setState(() {
//                             ConnectionStatus.temperature = true;
//                           });
//                           sendData("GLAMH");
//                         },
//                         color: Colors.blue,
//                         child: Text("Send Data True",style: TextStyle(color: Colors.white),),
//                       ),
//                       MaterialButton(
//                         onPressed: (){
//                           setState(() {
//                             ConnectionStatus.temperature = false;
//                           });
//                           sendData("GLAMG");
//                         },
//                         color: Colors.blue,
//                         child: Text("Send Data False",style: TextStyle(color: Colors.white),),
//                       ),
//                     ],
//                   ) : Container(),
//                 ],
//               ),
//
//               MaterialButton(
//                 onPressed: (){
//                   startDiscovery();
//                 },
//                 color: Colors.blue,
//                 child: Text("Search",style: TextStyle(color: Colors.white),),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ConnectionStatus{
//   static bool connect = false;
//   static String device = "";
//   static bool temperature = false;
//   static bool status = false;
// }
