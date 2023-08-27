import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scanner/homepage_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('B C'),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              controller.scanNormal();
            },
            child: const Text('Normal Bar Code'),
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
