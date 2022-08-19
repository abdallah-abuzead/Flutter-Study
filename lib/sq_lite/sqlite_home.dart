import 'package:flutter/material.dart';
import 'package:study_test/sq_lite/Models/course.dart';
import 'package:study_test/sq_lite/db_helper.dart';
import 'package:study_test/sq_lite/new_course.dart';

class SQLiteHome extends StatefulWidget {
  const SQLiteHome({Key? key}) : super(key: key);

  @override
  _SQLiteHomeState createState() => _SQLiteHomeState();
}

class _SQLiteHomeState extends State<SQLiteHome> {
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
        title: Text('SQLite Database'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewCourse()),
              );
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: helper.allCourses(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, i) {
                Course course = Course.fromMap(snapshot.data[i]);
                return ListTile(
                  title: Text('${course.name} - ${course.hours} hour'),
                  subtitle: Text(course.content),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        helper.deleteCourse(course.id);
                      });
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
