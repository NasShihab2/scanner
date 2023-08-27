

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {

  Rx<String> barCodeScans = ''.obs;

  Future<void> scanNormal() async {
    try {
      barCodeScans.value = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      debugPrint(barCodeScans.value);

    } on PlatformException {
      barCodeScans.value = 'Failed';
    }
  }

}