import 'package:calculator_app/calculator/model/calculator_model.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: themeData.primaryColor,
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
            ),
            _GridView()
          ],
        ),
      ),
    );
  }
}

class _GridView extends StatelessWidget {
  _GridView({
    super.key,
  });

  List<CalculatorModel> listCalculatorModel = const [
    CalculatorModel.thirdCalculator(text: 'AC'),
    CalculatorModel.thirdCalculator(text: '+/-'),
    CalculatorModel.thirdCalculator(text: '%'),
    CalculatorModel.secondCalculator(text: ':'),
    CalculatorModel.defaultCalculator(text: '7'),
    CalculatorModel.defaultCalculator(text: '8'),
    CalculatorModel.defaultCalculator(text: '9'),
    CalculatorModel.secondCalculator(text: 'x'),
    CalculatorModel.defaultCalculator(text: '4'),
    CalculatorModel.defaultCalculator(text: '5'),
    CalculatorModel.defaultCalculator(text: '6'),
    CalculatorModel.secondCalculator(text: '-'),
    CalculatorModel.defaultCalculator(text: '1'),
    CalculatorModel.defaultCalculator(text: '2'),
    CalculatorModel.defaultCalculator(text: '3'),
    CalculatorModel.secondCalculator(text: '+'),
    CalculatorModel.defaultCalculator(text: '0'),
    CalculatorModel.defaultCalculator(text: ','),
    CalculatorModel.secondCalculator(text: '='),
  ];

  Widget renderCell(CalculatorModel calculatorModel) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: calculatorModel.backgroundColor,
      ),
      child: Center(
          child: Text(
        calculatorModel.text,
        style: TextStyle(
            color: calculatorModel.textColor,
            fontSize: 38,
            fontWeight: FontWeight.w400),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 459,
      child: GridView.count(
          padding: const EdgeInsets.all(16),
          crossAxisCount: 4,
          crossAxisSpacing: 23,
          mainAxisSpacing: 10,
          children: List.generate(listCalculatorModel.length,
              (index) {
                if (index == 16) {
                  return Container(color: Colors.blue, width: 500,);
                } else {
                  return renderCell(listCalculatorModel[index]);
                }
              })),
    );
  }
}
