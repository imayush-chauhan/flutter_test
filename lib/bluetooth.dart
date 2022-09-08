import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BlueFlutter extends StatefulWidget {
  const BlueFlutter({Key? key}) : super(key: key);

  @override
  State<BlueFlutter> createState() => _BlueFlutterState();
}

class _BlueFlutterState extends State<BlueFlutter> {

  TextEditingController text = TextEditingController();

  Map<String, dynamic>? responseJson;
  
  getData()async{
    print("In");
    
    try{
      
      final response = await http.post(Uri.parse("https://api.deepai.org/api/text2img"),
        headers: {
          "api-key":"quickstart-QUdJIGlzIGNvbWluZy4uLi4K",
          // "api-key":"6f943885-df19-464e-97fd-3074c314be72",
        },
        body: {
          "text": "hulk playing pubg",
        }
      );

      setState(() {
        responseJson = json.decode(response.body);
      });

      print(responseJson);
      
    }catch(e){
      print("ERROR: $e");
    }
    print("Out");
    setState(() {

    });
    
  }

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

            responseJson != null ?
            Image.network(responseJson!["output_url"]) :
            GestureDetector(
              onTap: (){
                // getData();
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
            ),
          ],
        ),
      ),
    );
  }
}
