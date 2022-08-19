import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_test/get_study/counter_controller.dart';
import 'package:study_test/get_study/page2.dart';

class Page1 extends StatelessWidget {
  Page1({Key? key}) : super(key: key);
  final CounterController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Go Back'),
              onPressed: () {
                Get.back(result: 'This data from Page1');
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Page 2'),
              onPressed: () {
                Get.toNamed('/page2?id=5&name=hossam');
              },
            ),
            Text('${c.count}'),
          ],
        ),
      ),
    );
  }
}
