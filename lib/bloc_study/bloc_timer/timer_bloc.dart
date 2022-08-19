import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:study_test/bloc_study/bloc_timer/ticker.dart';
import 'package:study_test/bloc_study/bloc_timer/timer_event.dart';
import 'package:study_test/bloc_study/bloc_timer/timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final int _duration;
  final Ticker _ticker;
  StreamSubscription<int>? _tickerSubscription;
  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        _duration = 60,
        super(Ready(60));

  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    if (event is Start) {
      Start start = event;
      yield Running(start.duration);
      _tickerSubscription?.cancel();
      _tickerSubscription = _ticker.tick(ticks: start.duration).listen((duration) {
        add(Tick(duration: duration));
      });
    } else if (event is Paused) {
      if (state is Running) {
        _tickerSubscription?.pause();
        yield Paused(state.duration);
      }
    } else if (event is Resume) {
      if (state is Paused) {
        _tickerSubscription?.resume();
        yield Running(state.duration);
      }
    } else if (event is Reset) {
      _tickerSubscription?.cancel();
      yield Ready(_duration);
    } else if (event is Tick) {
      Tick tick = event;
      yield tick.duration > 0 ? Running(tick.duration) : Finished();
    }
  }

  void running() {
    Running(state.duration);

    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick(ticks: state.duration).listen((duration) {
      Tick(duration: duration);
    });
  }

  void ticking() {
    state.duration > 0 ? emit(Running(state.duration)) : emit(Finished());
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }
}
