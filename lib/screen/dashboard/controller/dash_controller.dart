// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:get/get.dart';
// import 'package:selfa/utils/colors.dart';
//
// class DashboardController extends GetxController {
//   String scannedQrCode = '';
//
//   Future<void> scanQR() async {
//     try {
//       scannedQrCode = await FlutterBarcodeScanner.scanBarcode(
//           '#0575E6', 'Cancel', false, ScanMode.QR);
//       Get.snackbar('Result', 'Qr Code' + scannedQrCode,
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colorsax.lightBlue,
//           colorText: Colorsax.blue);
//     } on PlatformException {}
//   }
// }
