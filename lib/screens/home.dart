import 'package:flutter/material.dart';
// import 'package:jiffy/jiffy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_test/screens/page_two.dart';
import 'package:study_test/services/animate_route.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> savePref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('name', 'Abdallah');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                await savePref();
              },
              child: Text(
                'Save Preferences',
                style: TextStyle(fontSize: 18),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(context, ScaleWithRotate(page: PageTwo()));
              },
              child: Text(
                'Go to Page Two',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
