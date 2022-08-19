import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_test/get_study/counter_controller.dart';
import 'package:study_test/get_study/page1.dart';
import 'package:study_test/get_study/student.dart';
import 'package:study_test/get_study/student_controller.dart';

class GetHome extends StatelessWidget {
  GetHome({Key? key}) : super(key: key);
  final CounterController c = Get.put(CounterController());
  final studentController = Get.put(StudentController());
  // final student = Student();
  // final student = Student(name: 'Tom', age: 25).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Get Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('Counter is: ${c.count}')),
            SizedBox(height: 10),
            // Obx(() => Text('Student Name: : ${student.name}')),
            // Obx(() => Text('Student Name: : ${student.value.name}')),
            Obx(() => Text('Student Name: : ${studentController.student.value.name}')),
            SizedBox(height: 10),
            ElevatedButton(
              // child: Text('Page 1'),
              child: Text('To Upper'),
              onPressed: () async {
                // buildSnackBar();
                // buildDefaultDialog();
                // buildBottomSheet();
                // Get.toNamed('/page1');
                // student.name.value = student.name.value.toUpperCase();
                // student.update((student) {
                //   student?.name = student.name.toString().toUpperCase();
                // });
                studentController.convertToUpperCase();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => c.increment(),
        child: Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> buildBottomSheet() {
    return Get.bottomSheet(
      Container(
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.wb_sunny_outlined),
              title: Text('Light Theme'),
              onTap: () => Get.changeTheme(ThemeData.light()),
            ),
            ListTile(
              leading: Icon(Icons.wb_sunny),
              title: Text('Dark Theme'),
              onTap: () => Get.changeTheme(ThemeData.dark()),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
    );
  }

  Future<dynamic> buildDefaultDialog() {
    return Get.defaultDialog(
      title: 'Alert Title',
      content: Text('Hello World!'),
      // textCancel: 'Cancel',
      textConfirm: 'Confirm',
      buttonColor: Colors.red,
    );
  }

  SnackbarController buildSnackBar() {
    return Get.snackbar(
      'Snack Bar Title',
      'This will be snack bar message',
      snackPosition: SnackPosition.BOTTOM,
      // titleText: Text('Another Title'),
      // messageText: Text('This is another message'),
      colorText: Colors.red,
      backgroundColor: Colors.black,
      borderRadius: 30,
      backgroundGradient: LinearGradient(colors: [Colors.blue, Colors.green]),
    );
  }
}
