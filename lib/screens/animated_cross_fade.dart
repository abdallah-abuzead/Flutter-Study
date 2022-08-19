import 'package:flutter/material.dart';

class AnimatedCrossFadeStudy extends StatefulWidget {
  const AnimatedCrossFadeStudy({Key? key}) : super(key: key);

  @override
  State<AnimatedCrossFadeStudy> createState() => _AnimatedCrossFadeStudyState();
}

class _AnimatedCrossFadeStudyState extends State<AnimatedCrossFadeStudy> {
  bool showFirst = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Cross Fade'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              firstChild: Container(width: 200, height: 200, color: Colors.red),
              secondChild: Container(width: 200, height: 200, color: Colors.blue),
              crossFadeState: showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: Duration(seconds: 1),
            ),
            // Container(
            //   width: 400,
            //   height: 400,
            //   color: Colors.red,
            //   child: Stack(
            //     children: [
            //       AnimatedPositioned(
            //           child: Container(
            //             color: Colors.blue,
            //             width: 100,
            //             height: 100,
            //           ),
            //           duration: Duration(seconds: 1))
            //     ],
            //   ),
            // ),
            // AnimatedDefaultTextStyle(child: Text('Abdallah'), style: TextStyle(), duration: Duration(seconds: 1)),
            // Container(child: AnimatedPadding(duration: Duration(seconds: 1), padding: EdgeInsets.all(10))),
            // AnimatedOpacity(opacity: 0.5, duration: Duration(seconds: 1)),
            // AnimatedPhysicalModel(
            //   child: Container(),
            //   shape: BoxShape.rectangle,
            //   elevation: 10,
            //   color: Colors.red,
            //   shadowColor: Colors.red,
            //   duration: Duration(seconds: 1),
            // ),
            SizedBox(height: 30),
            ElevatedButton(
              child: Text('Toggle Animation'),
              onPressed: () {
                setState(() {
                  showFirst = !showFirst;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
