// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class GetImage extends StatefulWidget {
//   final double height;
//   final double width;
//
//   const GetImage({Key? key,required this.height, required this.width}) : super(key: key);
//
//   @override
//   State<GetImage> createState() => _GetImageState();
// }
//
// class _GetImageState extends State<GetImage> {
//
//   XFile? image;
//   ImagePicker picker = ImagePicker();
//
//
//   void pickImage() async {
//     image = await picker.pickImage(source: ImageSource.camera);
//     if(image != null){
//       getImage(image!);
//     }
//     setState((){});
//   }
//
//   static getImage(XFile image){
//     return image;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Container(
//         height: widget.height,
//         width: widget.width,
//         color: Colors.transparent,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(),
//             image != null ?
//             Container(
//                 height:widget.width*0.8,
//                 width: widget.width*0.8,
//                 child: Image.file(File(image!.path),fit: BoxFit.contain,)): Container(),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 20),
//               child: GestureDetector(
//                 onTap: (){
//                   pickImage();
//                 },
//                 child: Container(
//                   height: widget.width*0.125,
//                   width: widget.width*0.125,
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     shape: BoxShape.circle,
//                   ),
//                   alignment: Alignment.center,
//                   child: Icon(Icons.camera,color: Colors.white,)
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//
//   }
// }
