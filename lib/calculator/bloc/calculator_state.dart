import 'package:calculator_app/calculator/enum/operator_enum.dart';

class CalculatorState {
  final String inputValue;
  final OperatorEnum operator;

  const CalculatorState({ required this.inputValue, required this.operator });

  factory CalculatorState.initialState() {
    return const CalculatorState(inputValue: '0', operator: OperatorEnum.none);
  }

  factory CalculatorState.inputValue(String input) {
    return CalculatorState(inputValue: input, operator: OperatorEnum.none);
  }
}