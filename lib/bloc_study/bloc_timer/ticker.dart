class Ticker {
  Stream<int> tick({required int ticks}) => Stream.periodic(Duration(seconds: 1), (i) {
        return ticks - i - 1;
      }).take(ticks);
}
