import 'package:flutter/material.dart';
import 'package:study_test/services/animate_route.dart';

class MyTransform extends StatefulWidget {
  const MyTransform({Key? key}) : super(key: key);

  @override
  State<MyTransform> createState() => _MyTransformState();
}

class _MyTransformState extends State<MyTransform> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transform'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform(
              transform: Matrix4.rotationZ(3.14)
                ..scale(1.5)
                ..translate(-50.0),
              child: Column(
                children: [
                  Container(width: 100, height: 100, color: Colors.red),
                  Container(width: 100, height: 100, color: Colors.blue),
                ],
              ),
            ),
          ],
        ),

        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Transform.rotate(
        //       angle: angle,
        //       origin: Offset(0, -100),
        //       child: Column(
        //         children: [
        //           Container(width: 100, height: 100, color: Colors.red),
        //           Container(width: 100, height: 100, color: Colors.blue),
        //         ],
        //       ),
        //     ),
        //     SizedBox(height: 30),
        //     Slider(
        //       value: angle,
        //       max: 2 * 3.14,
        //       min: 0,
        //       onChanged: (double value) {
        //         setState(() {
        //           angle = value;
        //         });
        //       },
        //     ),
        //   ],
        // ),
        // child: Transform.translate(
        //   offset: Offset(100, 100),
        //   child: Container(width: 100, height: 100, color: Colors.red),
        // ),
        // child: Transform.scale(
        //   scale: 2,
        //   child: Container(width: 100, height: 100, color: Colors.red),
        // ),
      ),
    );
  }
}
