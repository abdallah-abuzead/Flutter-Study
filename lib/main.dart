import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:study_test/bloc_study/bloc_counter/counter_bloc.dart';
import 'package:study_test/bloc_study/bloc_timer/bloc.dart';
import 'package:study_test/bloc_study/bloc_timer/timer_home.dart';
import 'package:study_test/facebook/user_profile.dart';
import 'package:study_test/get_study/page1.dart';
import 'package:study_test/get_study/page2.dart';
import 'package:study_test/screens/animated_container.dart';
import 'package:study_test/screens/animated_cross_fade.dart';
import 'package:study_test/screens/google_map.dart';
import 'package:study_test/screens/inhrited_widget_test.dart';
import 'package:study_test/screens/my_transform.dart';
import 'package:study_test/services/counter_provider.dart';
import 'package:study_test/sq_lite/sqlite_home.dart';
import 'package:study_test/storage/storage_home.dart';
import 'bloc_study/bloc_counter/counter_home.dart';
import 'bloc_study/bloc_timer/ticker.dart';
import 'facebook/facebook_home.dart';
import 'get_study/get_home.dart';
import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromRGBO(109, 234, 255, 1),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.deepPurple.shade900),
      ),
      defaultTransition: Transition.zoom,
      // home: GetHome(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => GetHome()),
        GetPage(name: '/page1/', page: () => Page1()),
        GetPage(name: '/page2', page: () => Page2(), transition: Transition.leftToRight),
      ],
      // unknownRoute: GetPage(name: '/notfound', page: () => UserProfile()),
    );
  }
}

/// Get Navigation
/// Get.to(() => Page1())         ===   push()
/// Get.back()                    ===   pop()
/// Get.off(() => Page1())        ===   pushReplacement()
/// Get.offAll(() => Page1())     ===   pushAndRemoveAllUntil()
