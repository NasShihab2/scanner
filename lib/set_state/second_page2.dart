import 'package:flutter/material.dart';

class SecondPage2 extends StatelessWidget {
  const SecondPage2({super.key, required this.barCodeScans});

  final String barCodeScans;

  @override
  Widget build(BuildContext context) {
    //
    var name = extractValue2(barCodeScans, 'name');
    var pin = extractValue2(barCodeScans, 'pin');
    var dob = extractValue2(barCodeScans, 'DOB');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              TextField(
                controller: TextEditingController(
                  text: 'Name : $name',
                ),
              ),
              TextField(
                controller: TextEditingController(
                  text: 'Pin : $pin',
                ),
              ),
              TextField(
                controller: TextEditingController(
                  text: 'Date of Birth :$dob',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String extractValue2(String data, String tag) {
  RegExp exp = RegExp('<$tag>(.*?)</$tag>');
  String? match = exp.firstMatch(data)?.group(1);
  return match ?? "Scan Your BarCode";
}
