import 'package:flutter/material.dart';

class AnimatedContainerStudy extends StatefulWidget {
  const AnimatedContainerStudy({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerStudy> createState() => _AnimatedContainerStudyState();
}

class _AnimatedContainerStudyState extends State<AnimatedContainerStudy> {
  double myWidth = 100;
  double myHeight = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              width: myWidth,
              height: myHeight,
              color: Colors.red,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              child: Text('Toggle Animation'),
              onPressed: () {
                setState(() {
                  if (myWidth == 100 && myHeight == 100) {
                    myWidth = 300;
                    myHeight = 300;
                  } else {
                    myWidth = 100;
                    myHeight = 100;
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
