import 'package:flutter/material.dart';
import 'package:study_test/sq_lite/Models/course.dart';
import 'package:study_test/sq_lite/db_helper.dart';
import 'package:study_test/sq_lite/sqlite_home.dart';

class NewCourse extends StatefulWidget {
  const NewCourse({Key? key}) : super(key: key);

  @override
  _NewCourseState createState() => _NewCourseState();
}

class _NewCourseState extends State<NewCourse> {
  var name, content, hours;
  late DBHelper helper;

  @override
  void initState() {
    super.initState();
    helper = DBHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'Enter Course Name'),
                onChanged: (value) {
                  name = value;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                maxLines: 10,
                decoration: InputDecoration(hintText: 'Enter Course Content'),
                onChanged: (value) {
                  content = value;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Enter Course Hours'),
                onChanged: (value) {
                  hours = int.parse(value);
                },
              ),
              SizedBox(height: 15),
              ElevatedButton(
                child: Text('Save'),
                onPressed: () async {
                  Course course = Course({'name': name, 'content': content, 'hours': hours});
                  int id = await helper.createCourse(course);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SQLiteHome()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
