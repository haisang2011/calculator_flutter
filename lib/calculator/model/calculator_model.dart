import 'package:flutter/material.dart';

class CalculatorModel {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const CalculatorModel({
    required this.text,
    required this.textColor,
    required this.backgroundColor
  });

  const CalculatorModel.defaultCalculator({
    required this.text
  }): backgroundColor = const Color(0xff393b3d),
      textColor = Colors.white;

  const CalculatorModel.secondCalculator({
    required this.text
  }): backgroundColor = const Color(0xffF66B0E),
      textColor = Colors.white;

  const CalculatorModel.thirdCalculator({
    required this.text
  }): backgroundColor = const Color(0xffe3e3e4),
      textColor = Colors.black;
}