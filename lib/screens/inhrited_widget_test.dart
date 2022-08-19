import 'package:flutter/material.dart';
import 'package:study_test/services/counter_provider.dart';

class InheritedWidgetTest extends StatelessWidget {
  const InheritedWidgetTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inherited Widget Test')),
      body: StatefulBuilder(
        builder: (context, setState) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        CounterProvider.of(context).count--;
                      });
                    },
                    icon: Icon(Icons.remove, size: 30)),
                Text('${CounterProvider.of(context).count}', style: TextStyle(fontSize: 20)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        CounterProvider.of(context).count++;
                      });
                    },
                    icon: Icon(Icons.add, size: 30)),
              ],
            ),
          );
        },
      ),
    );
  }
}
