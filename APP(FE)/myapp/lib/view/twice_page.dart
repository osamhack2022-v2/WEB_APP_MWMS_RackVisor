import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:myapp/screen/qrScannerOverlay.dart';
 
 
class TwicePage extends StatefulWidget {
  TwicePage({Key? key}) : super(key: key);
 
  @override
  State<TwicePage> createState() => _TwicePageState();
}
 
class _TwicePageState extends State<TwicePage> {
  MobileScannerController cameraController = MobileScannerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: (){
              cameraController.switchCamera();
            }, icon: const Icon(Icons.camera_rear_outlined))
        ],
      ),
        body: Stack(
          children: [
            MobileScanner(
            allowDuplicates: false,
            controller: cameraController,
            onDetect: (barcode, args) {
            Get.toNamed("/qrSearchResultPage", arguments: barcode.rawValue);
          },
      ),
      QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5)),
      ],
        ),
    );
  }
}
