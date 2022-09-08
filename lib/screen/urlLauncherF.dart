import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherF extends StatefulWidget {
  const UrlLauncherF({Key? key}) : super(key: key);

  @override
  State<UrlLauncherF> createState() => _UrlLauncherFState();
}

class _UrlLauncherFState extends State<UrlLauncherF> {

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () async{
            _makePhoneCall("9818599939");
          },
          child: Container(
            height: 50,
            width: 100,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}
