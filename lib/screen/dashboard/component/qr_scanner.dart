import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:selfa/utils/colors.dart';
import 'package:selfa/utils/text_widget.dart';
import 'package:sizer/sizer.dart';

class QRViewer extends StatefulWidget {
  const QRViewer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewerState();
}

class _QRViewerState extends State<QRViewer> {
  Barcode? barcode;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [buildQrView(context), Positioned(child: buidResult())],
      ),
    );
  }

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
            cutOutSize: 80.w,
            borderWidth: 10,
            borderLength: 20,
            borderRadius: 15,
            borderColor: Colorsax.blue),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);

    controller.scannedDataStream
        .listen((barcode) => setState(() => this.barcode = barcode));
    // controller.scannedDataStream.listen((barcode) => this.barcode= barcode);
  }

  // void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
  //   log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
  //   if (!p) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('no Permission')),
  //     );
  //   }
  // }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  buidResult() => Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colorsax.white, borderRadius: BorderRadius.circular(15)),
      child: Textsax(
        text: barcode != null ? 'QR:${barcode!.code}' : '',
        color: Colorsax.black,
        fontSize: 12,
      ));
}
