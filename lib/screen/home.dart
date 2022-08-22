// import 'package:flutter/material.dart';
//
// class Home extends StatefulWidget {
//   const Home({Key key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//
//   List name = [
//     "Ayush",
//     "Ritsh",
//     "Varun",
//     "Lokesh",
//     "Del",
//     "sdsd",
//     "sdsd",
//     "dvfv",
//     "wewe",
//     "cxzcx",
//     "fbb",
//     "qwqw",
//     "ewe",
//     "sdsd",
//   ];
//
//   int select = 3;
//
//
//   @override
//   Widget build(BuildContext context) {
//     double mediaQH = MediaQuery.of(context).size.height;
//     double mediaQW = MediaQuery.of(context).size.width;
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: (value){
//           setState((){
//             select = value;
//           });
//         },
//
//
//         backgroundColor: Colors.blue,
//         items: [
//
//           BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",backgroundColor: Colors.blue),
//           BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: "Category",backgroundColor: Colors.blue),
//           BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search",backgroundColor: Colors.blue),
//           BottomNavigationBarItem(icon: Icon(Icons.person),label: "Person",backgroundColor: Colors.blue),
//
//
//         ],
//
//         currentIndex: select,
//
//       ),
//       appBar: AppBar(
//         title: Text("Ritesh"),
//       ),
//       body: Container(
//         height: mediaQH,
//         width: mediaQW,
//         child: Column(
//           children: [
//
//             // Container(
//             //   height: mediaQH - 80,
//             //   width: mediaQW,
//             //   child: ListView.builder(
//             //     itemCount: 20,
//             //     shrinkWrap: true,
//             //     scrollDirection: Axis.vertical,
//             //     itemBuilder: (context,index){
//             //       return Padding(
//             //         padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//             //         child: Row(
//             //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             //           children: [
//             //             Container(
//             //               height: 50,
//             //               width: 100,
//             //               color: Colors.black,
//             //               child: Center(
//             //                 child: Text("HEHE" + index.toString(),
//             //                 style: TextStyle(
//             //                   color: Colors.white
//             //                 ),),
//             //               ),
//             //             ),
//             //             Container(
//             //               height: 50,
//             //               width: 100,
//             //               color: Colors.black,
//             //               child: Center(
//             //                 child: Text("yoyo" + index.toString(),
//             //                   style: TextStyle(
//             //                       color: Colors.white
//             //                   ),),
//             //               ),
//             //             ),
//             //           ],
//             //         ),
//             //       );
//             //     },
//             //   ),
//             // ),
//
//             // Container(
//             //   height: mediaQH-80,
//             //   width: mediaQW*0.8,
//             //   child: GridView.builder(
//             //     itemCount: name.length,
//             //     shrinkWrap: true,
//             //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             //         crossAxisCount: 2),
//             //     itemBuilder: (BuildContext context, int index) {
//             //       return Padding(
//             //         padding: const EdgeInsets.all(8.0),
//             //         child: Container(
//             //           height: 100,
//             //           width: 100,
//             //           color: Colors.black,
//             //           child: Center(child: Text(name[index],
//             //           style: TextStyle(
//             //             color: Colors.white,
//             //           ),)),
//             //         ),
//             //       );
//             //     },
//             //   ),
//             // ),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
