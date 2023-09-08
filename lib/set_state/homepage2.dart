import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:scanner/set_state/second_page2.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  String barCodeScans = '';

  Future<void> scanNormal() async {
    try {
      final scannedBarcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );
      debugPrint(scannedBarcode);

      setState(() {
        barCodeScans = scannedBarcode;
      });

      navigateToSecondPage(barCodeScans);
    } on PlatformException {
      setState(() {
        barCodeScans = 'Failed';
      });
    }
  }

  void navigateToSecondPage(String scannedBarcode) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondPage2(
          barCodeScans: barCodeScans,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('B C'),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: scanNormal,
            child: const Text('Normal Bar Code 2'),
          ),
        ),
      ),
    );
  }
}

// Widget extractValue(String data, String tag) {
//   RegExp exp = RegExp('<$tag>(.*?)</$tag>');
//   String? match = exp.firstMatch(data)?.group(1);
//   return Text(
//     '$tag: ${match ?? "Scan Your BarCode"}',
//     style: const TextStyle(fontSize: 16),
//   );
// }
