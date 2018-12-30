import 'dart:async';

import 'package:counter_boc_app_part1/blocs/blocbase.dart';

class CounterBloc implements BlocBase {
  @override
  void dispose() {
    _buttonClickController.close();
    _counterController.close();
  }

  int _counter;
  // Streams to handle the click of the  counter
  StreamController<int> _buttonClickController = StreamController<int>();
  Sink<int> get inpress => _buttonClickController.sink;

  // Streams to handle the  value of the counter
  StreamController<int> _counterController = StreamController<int>();
  Sink<int> get _inCounter => _counterController.sink;
  Stream<int> get outCounter => _counterController.stream;

  CounterBloc() {
    _counter = 0;
    _buttonClickController.stream.listen(addvalue);
  }

  void addvalue(int event) {
    _counter += 1;
    _inCounter.add(_counter);
  }
}
