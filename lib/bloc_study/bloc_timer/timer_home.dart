import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_test/bloc_study/bloc_timer/bloc.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class TimerHome extends StatelessWidget {
  const TimerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer App'),
      ),
      body: Stack(
        children: [
          WaveWidget(
            config: CustomConfig(
              gradients: [
                [Color.fromRGBO(72, 74, 126, 1), Color.fromRGBO(125, 170, 206, 1), Color.fromRGBO(184, 189, 245, 0.7)],
                [Color.fromRGBO(72, 74, 126, 1), Color.fromRGBO(72, 74, 126, 1), Color.fromRGBO(172, 182, 219, 0.7)],
                [Color.fromRGBO(72, 73, 126, 1), Color.fromRGBO(72, 74, 126, 1), Color.fromRGBO(190, 238, 246, 0.7)],
              ],
              durations: [19440, 10000, 6000],
              heightPercentages: [0.30, 0.01, 0.02],
              gradientBegin: Alignment.bottomCenter,
              gradientEnd: Alignment.topCenter,
            ),
            size: Size(double.infinity, double.infinity),
            backgroundColor: Colors.blue.shade50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 100),
                  child: BlocBuilder<TimerBloc, TimerState>(
                    builder: (context, state) {
                      final String minutesSection = (state.duration / 60).floor().toString().padLeft(2, '0');
                      final String secondsSection = (state.duration % 60).toString().padLeft(2, '0');
                      return Text(
                        '$minutesSection:$secondsSection',
                        style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white),
                      );
                    },
                  ),
                ),
              ),
              BlocBuilder<TimerBloc, TimerState>(
                  buildWhen: (previousState, currentState) => currentState.runtimeType != previousState.runtimeType,
                  builder: (context, state) => Actions()),
            ],
          ),
        ],
      ),
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _mapStateToActionButtons(context, timerBloc: BlocProvider.of<TimerBloc>(context)),
    );
  }

  List<Widget> _mapStateToActionButtons(BuildContext context, {TimerBloc? timerBloc}) {
    final TimerState currentState = timerBloc!.state;
    if (currentState is Ready) {
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          // onPressed: () => timerBloc.add(Start(duration: currentState.duration)),
          onPressed: () => context.read<TimerBloc>().running(),
        ),
      ];
    }
    if (currentState is Running) {
      return [
        FloatingActionButton(
          child: Icon(Icons.pause),
          onPressed: () => timerBloc.add(Pause()),
        ),
        FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () => timerBloc.add(Reset()),
        ),
      ];
    }
    if (currentState is Pause) {
      return [
        FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () => timerBloc.add(Resume()),
        ),
        FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () => timerBloc.add(Reset()),
        ),
      ];
    }
    if (currentState is Finished) {
      return [
        FloatingActionButton(
          child: Icon(Icons.replay),
          onPressed: () => timerBloc.add(Reset()),
        ),
      ];
    }
    return [];
  }
}
