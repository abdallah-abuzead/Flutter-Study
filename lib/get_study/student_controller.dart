import 'package:get/get.dart';
import 'package:study_test/get_study/student.dart';

class StudentController extends GetxController {
  // Student student = Student();

  // void convertToUpperCase() {
  //   student.name.value = student.name.value.toUpperCase();
  // }

  final student = Student(name: 'Tom', age: 25).obs;

  void convertToUpperCase() {
    student.update((student) {
      student?.name = student.name.toString().toUpperCase();
    });
    // student.name.value = student.name.value.toUpperCase();
  }
}
