import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:study_test/sq_lite/Models/course.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper.internal();
  factory DBHelper() => _instance;
  DBHelper.internal();
  static Database? _db;

  Future<Database?> createDatabase() async {
    if (_db != null) return _db;

    try {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'school.db');
      // await deleteDatabase(path);
      _db = await openDatabase(path, version: 1, onCreate: (db, v) async {
        //create tables
        await db.execute(
            'CREATE TABLE courses(id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR(50), content VARCHAR(255), hours INTEGER)');
      }, onUpgrade: (db, oldVer, newVer) async {
        await db.execute('alter table courses add column level varchar(50)');
      });
      return _db;
    } catch (e) {
      print(e);
    }
  }

  Future<int> createCourse(Course course) async {
    Database? db = await createDatabase();
    return db!.insert('courses', course.toMap());
  }

  Future<List> allCourses() async {
    Database? db = await createDatabase();
    return db!.query('courses');
  }

  Future<int> deleteCourse(int id) async {
    Database? db = await createDatabase();
    return db!.delete('courses', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateCourse(Course course) async {
    Database? db = await createDatabase();
    return await db!.update('courses', course.toMap(), where: 'id = ?', whereArgs: [course.id]);
  }
}
