import 'package:bloc/bloc.dart';
import 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  // Stream<int> mapEventToState(CounterEvent event) async* {
  //   switch (event) {
  //     case CounterEvent.add:
  //       yield state + 1;
  //       break;
  //     case CounterEvent.remove:
  //       yield state - 1;
  //       break;
  //   }
  // }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    super.onTransition(transition);
    print(transition);
  }

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
