import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  String name = '';
  Future<void> getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      name = (preferences.getString('name'))!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Page Two'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () async {
                await getPref();
              },
              child: Text(
                'get Name',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 30),
            Text(
              name,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
