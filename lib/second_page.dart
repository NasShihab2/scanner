import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'homepage_controller.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());

    var name = extractValue(controller.barCodeScans.value, 'name');
    var pin = extractValue(controller.barCodeScans.value, 'pin');
    var dob = extractValue(controller.barCodeScans.value, 'DOB');

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
                  text: 'Date of Birth : $dob',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String extractValue(String data, String tag) {
  RegExp exp = RegExp('<$tag>(.*?)</$tag>');
  String? match = exp.firstMatch(data)?.group(1);
  return match ?? "Scan Your BarCode";
}
