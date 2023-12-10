import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:monumen_submission/flutter_ui/widgets/calculator_button.dart';

class FlutterCalculator extends StatefulWidget {
  const FlutterCalculator({super.key});

  @override
  State<FlutterCalculator> createState() => _FlutterCalculatorState();
}

class _FlutterCalculatorState extends State<FlutterCalculator> {
  String currentOperation = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Calculator App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    currentOperation,
                    style: const TextStyle(color: Colors.white, fontSize: 64),
                  ),
                ),
              ),
            ),
          ),
          GridView.count(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            crossAxisCount: 4,
            children: [
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: 'C',
                onTap: () {
                  setState(() {
                    currentOperation = '0';
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '+/-',
                onTap: () {},
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '%',
                onTap: () {},
              ),
              CalculatorButton.icon(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: 'Backspace',
                icon: Icons.backspace,
                onTap: () {
                  setState(() {
                    currentOperation = _removeLastChar();
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '7',
                onTap: () {
                  setState(() {
                    if (currentOperation == '0') {
                      currentOperation = '7';
                    } else {
                      currentOperation += '7';
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '8',
                onTap: () {
                  setState(() {
                    if (currentOperation == '0') {
                      currentOperation = '8';
                    } else {
                      currentOperation += '8';
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '9',
                onTap: () {
                  setState(() {
                    if (currentOperation == '0') {
                      currentOperation = '9';
                    } else {
                      currentOperation += '9';
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: '/',
                onTap: () {
                  setState(() {
                    if (currentOperation != '0') {
                      currentOperation += '/';
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '4',
                onTap: () {
                  setState(() {
                    if (currentOperation == '0') {
                      currentOperation = '4';
                    } else {
                      currentOperation += '4';
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '5',
                onTap: () {
                  setState(() {
                    if (currentOperation == '0') {
                      currentOperation = '5';
                    } else {
                      currentOperation += '5';
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '6',
                onTap: () {
                  setState(() {
                    if (currentOperation == '0') {
                      currentOperation = '6';
                    } else {
                      currentOperation += '6';
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: '*',
                onTap: () {
                  setState(() {
                    if (currentOperation != '0') {
                      currentOperation += '*';
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '3',
                onTap: () {
                  setState(() {
                    if (currentOperation == '0') {
                      currentOperation = '3';
                    } else {
                      currentOperation += '3';
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '2',
                onTap: () {
                  setState(() {
                    if (currentOperation == '0') {
                      currentOperation = '2';
                    } else {
                      currentOperation += '2';
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '1',
                onTap: () {
                  setState(() {
                    if (currentOperation == '0') {
                      currentOperation = '1';
                    } else {
                      currentOperation += '1';
                    }
                  });
                },
              ),
              CalculatorButton.icon(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: '-',
                icon: Icons.minimize,
                onTap: () {
                  setState(() {
                    if (currentOperation == '0') {
                      currentOperation = '-';
                    } else {
                      if (!currentOperation.endsWith('-')) {
                        currentOperation += '-';
                      }
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '0',
                onTap: () {
                  setState(() {
                    if (currentOperation == '0') {
                      currentOperation = '0';
                    } else {
                      currentOperation += '0';
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '.',
                onTap: () {
                  setState(() {
                    if (!currentOperation.contains('.')) {
                      currentOperation += '.';
                    }
                  });
                },
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '=',
                onTap: () {
                  _calulate(currentOperation);
                },
              ),
              CalculatorButton.icon(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Theme.of(context).primaryColorLight,
                text: '-',
                icon: Icons.add,
                onTap: () {
                  setState(() {
                    if (currentOperation != '0') {
                      if (!currentOperation.endsWith('+')) {
                        currentOperation += '+';
                      }
                    }
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _removeLastChar() {
    if (currentOperation.length > 1) {
      return currentOperation.substring(0, currentOperation.length - 1);
    }
    return currentOperation;
  }

  void _calulate(String expression) {
    Parser expressionParser = Parser();
    try {
      Expression exp = expressionParser.parse(expression);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);
      setState(() {
        currentOperation =
            result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1);
      });
    } on RangeError catch (_) {
      String fixedExpression = _removeLastChar();
      _calulate(fixedExpression);
    }
  }
}
