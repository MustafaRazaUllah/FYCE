import 'dart:io';
import 'package:biticonapp/Common/AppText/AppTextView.dart';
import 'package:biticonapp/Common/AppText/font_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../Common/Constant/AppConfig.dart';
import '../../../Common/Theme/colors.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? result;

  QRViewController? controller;

  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.resumeCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Container(
        height: AppConfig(context).height,
        width: AppConfig(context).width ,
        padding: const EdgeInsets.only(left: 20, right: 20,top: 50),
        child: Column(
      children: [
        Row(
          children: [
            Row(
              children: const[
                   CustomText(
                 title:  'Scan QR Code',
                 color: AppColor.white, size: 24,fontType: FontType.Avenir,),

                  SizedBox(
                  width: 14,
                ),
                   Image(
                  image: AssetImage('assets/icons/Scan.png'),
                  height: 18,
                  width: 22,
                  fit: BoxFit.cover,
                ),



              ],
            ),
            Spacer(),
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                width: 40,
                decoration:const  BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.greyText),
                child: const Padding(
                  padding:  EdgeInsets.all(15),
                  child:  Image(image:AssetImage("assets/icons/cancel.png"),height: 20,width: 20,),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 67,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black)),
          height: 339,
          width: 250,
          child: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),
        ),

      ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }
}
