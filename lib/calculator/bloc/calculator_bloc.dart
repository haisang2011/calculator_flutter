import 'dart:async';

import 'package:calculator_app/calculator/bloc/calculator_event.dart';
import 'package:calculator_app/calculator/bloc/calculator_state.dart';

class CalculatorBloc {
  final _stateController = StreamController<CalculatorState>();
  Stream<CalculatorState> get state => _stateController.stream;

  void sendInputValue(CalculatorEvent event, String input) {
    print('sendInputValue start');
    if (event == CalculatorEvent.inputEvent) {
      CalculatorState.inputValue(input);
    } else {
      print('sendInputValue failed');
    }
  }

  void dispose() {
    _stateController.close();
  }
}