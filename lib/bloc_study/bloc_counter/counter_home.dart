import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_test/bloc_study/bloc_counter/counter_bloc.dart';

class CounterHome extends StatelessWidget {
  const CounterHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bloc Counter')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => context.read<CounterBloc>().decrement(),
              icon: Icon(Icons.remove, size: 30),
            ),
            BlocBuilder<CounterBloc, int>(
                builder: (context, state) => Text(
                      '$state',
                      style: TextStyle(fontSize: 20),
                    )),
            IconButton(
              onPressed: () => context.read<CounterBloc>().increment(),
              icon: Icon(Icons.add, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
