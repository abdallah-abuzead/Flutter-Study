import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class StorageHome extends StatefulWidget {
  const StorageHome({Key? key}) : super(key: key);

  @override
  _StorageHomeState createState() => _StorageHomeState();
}

class _StorageHomeState extends State<StorageHome> {
  int counter = 0;

  Future<String> getLocalPath() async {
    var folder = await getApplicationDocumentsDirectory();
    return folder.path;
  }

  Future<File> getLocalFile() async {
    var path = await getLocalPath();
    return File('$path/counter.txt');
  }

  Future<File> writeCounter(int c) async {
    File file = await getLocalFile();
    return file.writeAsString('$c');
  }

  Future<int> readCounter() async {
    try {
      File file = await getLocalFile();
      String content = await file.readAsString();
      return int.parse(content);
    } catch (e) {
      return 0;
    }
  }

  @override
  void initState() {
    super.initState();
    readCounter().then((data) {
      setState(() {
        counter = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read/ Write Files'),
      ),
      body: Center(
        child: Text('$counter'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          setState(() {
            counter++;
          });
          await writeCounter(counter);
        },
      ),
    );
  }
}
