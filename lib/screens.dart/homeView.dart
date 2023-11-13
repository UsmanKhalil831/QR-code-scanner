import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future _qrScanner() async{
    var cameraStatus = await Permission.camera.status;
    if(cameraStatus.isGranted){
      String? qrData = await scanner.scan(); //this will open the camera for you
    }
    else{
      var isGrant = await Permission.camera.request();
      if(isGrant.isGranted){
        String? qrData = await scanner.scan(); //this will open the camera for you
      }
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(
        onPressed: (){
          setState(() {
            _qrScanner();
          });
        }, child: const Text('Scan QR Code')),),
    );
  }
}