// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:android_path_provider/android_path_provider.dart';
// import 'package:dio/dio.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// // import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:syncfusion_flutter_pdf/pdf.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//
// class PdfPicker extends StatefulWidget {
//   final String? s;
//   final String? image;
//   const PdfPicker({Key? key, this.image,this.s}) : super(key: key);
//
//   @override
//   State<PdfPicker> createState() => _PdfPickerState();
// }
//
// class _PdfPickerState extends State<PdfPicker> {
//
//   // String s = "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf";
//
//   XFile? image;
//   ImagePicker picker = ImagePicker();
//
//   @override
//   void initState() {
//     super.initState();
//     _prepareSaveDir();
//   }
//
//   pickImage(PdfDocument pdf) async{
//
//     try{
//
//       image = await picker.pickImage(source: ImageSource.gallery);
//
//       final Uint8List imageData = File(image!.path).readAsBytesSync();
//
//       final PdfBitmap image2 = PdfBitmap(imageData);
//
//       pdf.pages
//           .add()
//           .graphics
//           .drawImage(image2, const Rect.fromLTWH(0, 0, 500, 200));
//
//       File(image!.path).writeAsBytes(await pdf.save()).then((value) {
//
//         setState((){
//           ss = value;
//         });
//
//       });
//
//       print("Success!!!!");
//
//     } catch (e){
//
//       print("Error: $e");
//
//     }
//
//   }
//
//   // downloadPdf({String? downloadLink, String? title}) async {
//   //
//   //   var dio;
//   //   if (await Permission.storage.request().isGranted) {
//   //
//   //     final downloadPath = await path.getExternalStorageDirectory();
//   //     var filePath = downloadPath!.path + '/$title.pdf';
//   //
//   //     dio = Dio();
//   //     await dio.download(downloadLink, filePath).then((value) {
//   //
//   //       dio.close();
//   //     }).catchError((Object e) {
//   //
//   //     });
//   //   } else {
//   //
//   //   }
//   // }
//
//
//
//   Future<void> downloadFile() async {
//     Dio dio = Dio();
//
//     if(await Permission.storage.request().isGranted){
//       try {
//         print(_localPath!);
//         // var dir = await getExternalStorageDirectory();
//         // print("path ${dir!.path}");
//         final taskId = await FlutterDownloader.enqueue(
//           url: widget.s!,
//           savedDir: _localPath!,
//           saveInPublicStorage: true,
//           showNotification: true, // show download progress in status bar (for Android)
//           openFileFromNotification: true, // click on notification to open downloaded file (for Android)
//         );
//         // var response = await dio.download(widget.s!, _localPath!,
//         //     onReceiveProgress: (rec, total) {
//         //       // print("Rec: $rec , Total: $total");
//         //
//         //       // setState(() {
//         //       //   downloading = true;
//         //       //   progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
//         //       // });
//         //     }).catchError((e){
//         //       print("Error: $e");
//         // });
//
//         print("Respons");
//
//       } catch (e) {
//         print(e);
//       }
//     }else{
//       print("Noooo");
//     }
//
//     print("Download completed");
//   }
//
//   String? _localPath;
//
//   Future<void> _prepareSaveDir() async {
//     _localPath = (await _findLocalPath())!;
//     final savedDir = Directory(_localPath!);
//     final hasExisted = savedDir.existsSync();
//     if (!hasExisted) {
//       await savedDir.create();
//     }
//   }
//
//   Future<String?> _findLocalPath() async {
//     String? externalStorageDirPath;
//     if (Platform.isAndroid) {
//       try {
//         externalStorageDirPath = await AndroidPathProvider.downloadsPath;
//       } catch (e) {
//         final directory = await getExternalStorageDirectory();
//         externalStorageDirPath = directory?.path;
//       }
//     } else if (Platform.isIOS) {
//       externalStorageDirPath =
//           (await getApplicationDocumentsDirectory()).absolute.path;
//     }
//     return externalStorageDirPath;
//   }
//
//   // download(Future<List<int>> sss) async{
//   //
//   //   // var status = await Permission.storage.isGranted;
//   //   // print(await Permission.storage.status);
//   //
//   //     try{
//   //
//   //       var tempDir = await getTemporaryDirectory();
//   //       String fullPath = tempDir.path + "/details.pdf";
//   //       print('full path ${fullPath}');
//   //
//   //       File(fullPath).writeAsBytes(await sss).then((value) {
//   //
//   //         setState((){
//   //           ss = value;
//   //         });
//   //
//   //       });
//   //       // File file = File(fullPath);
//   //       // var raf = file.openSync(mode: FileMode.write);
//   //       // // response.data is List<int> type
//   //       // raf.wri;
//   //
//   //     }catch (e){
//   //       print("ERROR: $e");
//   //     }
//   //
//   // }
//
//   PdfDocument? pdf;
//
//   File? ss;
//
//
//   @override
//   Widget build(BuildContext context) {
//     double mediaQH = MediaQuery.of(context).size.height;
//     double mediaQW = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Container(
//         height: mediaQH,
//         width: mediaQW,
//         child: Column(
//           children: [
//             Container(
//               height: mediaQH*0.9,
//               width: mediaQW,
//               // child: Expanded(
//               //   child: ss == null ?
//               //   SfPdfViewer.network(
//               //       widget.s!,
//               //       onDocumentLoaded: (_){
//               //         setState((){
//               //           pdf = _.document;
//               //         });
//               //         // print(_.document);
//               //   }) : SfPdfViewer.file(ss!),
//               // ),
//             ),
//             SizedBox(height: 10,),
//             MaterialButton(onPressed: (){
//               downloadFile();
//               // pickImage(pdf!);
//               // download(pdf!.save());
//             },
//               color: Colors.blue,
//             child: Text("download pdf",style: TextStyle(color: Colors.white),),)
//           ],
//         ),
//       ),
//     );
//   }
// }
