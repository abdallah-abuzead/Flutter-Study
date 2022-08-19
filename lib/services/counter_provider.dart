import 'package:flutter/cupertino.dart';

class CounterProvider extends InheritedWidget {
  CounterProvider({
    // this.count = 0,
    required this.child,
  }) : super(child: child);

  int count = 0;
  final Widget child;

  static CounterProvider of(BuildContext context) {
    final CounterProvider? result = context.dependOnInheritedWidgetOfExactType<CounterProvider>();
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CounterProvider old) => count != old.count;
}
