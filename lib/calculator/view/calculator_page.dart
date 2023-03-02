import 'package:calculator_app/calculator/bloc/calculator_bloc.dart';
import 'package:calculator_app/calculator/bloc/calculator_event.dart';
import 'package:calculator_app/calculator/bloc/calculator_state.dart';
import 'package:calculator_app/calculator/model/calculator_model.dart';
import 'package:flutter/material.dart';
import 'package:spannable_grid/spannable_grid.dart';

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
              Expanded(
                flex: 1,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  height: 200,
                  width: double.infinity,
                  alignment: Alignment.bottomRight,
                  child: const Text(
                    '0',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 76,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Expanded(flex: 2, child: _GridView())
            ],
          ),
        )
    );
  }
}

class _GridView extends StatelessWidget {
  _GridView({
    super.key,
  });

  var calculatorBloc = CalculatorBloc();

  List<CalculatorModel> listCalculatorModel = const [
    CalculatorModel.thirdCalculator(
        text: 'AC', column: 1, row: 1, columnSpan: 1, rowSpan: 1),
    CalculatorModel.thirdCalculator(
        text: '+/-', column: 2, row: 1, columnSpan: 1, rowSpan: 1),
    CalculatorModel.thirdCalculator(
        text: '%', column: 3, row: 1, columnSpan: 1, rowSpan: 1),
    CalculatorModel.secondCalculator(
        text: ':', column: 4, row: 1, columnSpan: 1, rowSpan: 1),
    CalculatorModel.defaultCalculator(
        text: '7', column: 1, row: 2, columnSpan: 1, rowSpan: 1),
    CalculatorModel.defaultCalculator(
        text: '8', column: 2, row: 2, columnSpan: 1, rowSpan: 1),
    CalculatorModel.defaultCalculator(
        text: '9', column: 3, row: 2, columnSpan: 1, rowSpan: 1),
    CalculatorModel.secondCalculator(
        text: 'x', column: 4, row: 2, columnSpan: 1, rowSpan: 1),
    CalculatorModel.defaultCalculator(
        text: '4', column: 1, row: 3, columnSpan: 1, rowSpan: 1),
    CalculatorModel.defaultCalculator(
        text: '5', column: 2, row: 3, columnSpan: 1, rowSpan: 1),
    CalculatorModel.defaultCalculator(
        text: '6', column: 3, row: 3, columnSpan: 1, rowSpan: 1),
    CalculatorModel.secondCalculator(
        text: '-', column: 4, row: 3, columnSpan: 1, rowSpan: 1),
    CalculatorModel.defaultCalculator(
        text: '1', column: 1, row: 4, columnSpan: 1, rowSpan: 1),
    CalculatorModel.defaultCalculator(
        text: '2', column: 2, row: 4, columnSpan: 1, rowSpan: 1),
    CalculatorModel.defaultCalculator(
        text: '3', column: 3, row: 4, columnSpan: 1, rowSpan: 1),
    CalculatorModel.secondCalculator(
        text: '+', column: 4, row: 4, columnSpan: 1, rowSpan: 1),
    CalculatorModel.defaultCalculator(
        text: '0', column: 1, row: 5, columnSpan: 2, rowSpan: 1),
    CalculatorModel.defaultCalculator(
        text: ',', column: 3, row: 5, columnSpan: 1, rowSpan: 1),
    CalculatorModel.secondCalculator(
        text: '=', column: 4, row: 5, columnSpan: 1, rowSpan: 1),
  ];

  List<SpannableGridCellData> _getCells() {
    var result = <SpannableGridCellData>[];
    listCalculatorModel.forEach((element) {
      result.add(SpannableGridCellData(
          column: element.column,
          row: element.row,
          columnSpan: element.columnSpan,
          rowSpan: element.rowSpan,
          id: element,
          child: renderCell(element)));
    });

    return result;
  }

  Widget renderCell(CalculatorModel calculatorModel) {
    final bool isNumberOfZero = calculatorModel.text == '0' ? true : false;
    return GestureDetector(
      onTap: () => {
        calculatorBloc.sendInputValue(CalculatorEvent.inputEvent, calculatorModel.text)
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: 8, vertical: isNumberOfZero ? 8 : 6),
        decoration: BoxDecoration(
          shape: isNumberOfZero ? BoxShape.rectangle : BoxShape.circle,
          borderRadius: isNumberOfZero
              ? const BorderRadius.all(Radius.elliptical(60, 55))
              : null,
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: CalculatorState.initialState(),
      stream: calculatorBloc.state,
      builder: (ctx, snapshot) => Container(
        width: double.infinity,
        child: SpannableGrid(
            columns: 4,
            rows: 5,
            cells: _getCells(),
            onCellChanged: (cell) {
              print('Cell changed');
            }),
      ));
  }
}
