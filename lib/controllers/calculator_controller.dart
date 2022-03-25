import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var firstNumber = ''.obs;
  var secondNumber = ''.obs;
  var mathResult = '0'.obs;
  var operation = ''.obs;

  resetAll() {
    firstNumber.value = '';
    secondNumber.value = '';
    mathResult.value = '0';
    operation.value = '';
  }

  changeNegativePositive() {
    isInfinity();
    if (mathResult.startsWith('-')) {
      mathResult.value = mathResult.value.replaceAll('-', '');
    } else {
      mathResult.value = '-' + mathResult.value;
    }
  }

  addNumber(String number) {
    isInfinity();
    if (mathResult.value == '0') return mathResult.value = number;

    if (mathResult.value == '-0') return mathResult.value = '-' + number;

    mathResult.value = mathResult.value + number;
  }

  addDecimalPoint() {
    isInfinity();
    if (mathResult.contains('.')) return;
    if (mathResult.startsWith('0'))
      mathResult.value = '0.';
    else
      mathResult.value = mathResult.value + '.';
  }

  selectOperator(String newOperation) {
    isInfinity();
    operation.value = newOperation;
    firstNumber.value = mathResult.value;
    mathResult.value = '0';
  }

  delete() {
    isInfinity();
    if (mathResult.value.replaceAll('-', '').length > 1)
      mathResult.value =
          mathResult.value.substring(0, mathResult.value.length - 1);
    else
      mathResult.value = '0';
  }

  calculateResult() {
    isInfinity();
    if (firstNumber.value != '' && mathResult.value != '') {
      double num1 = double.parse(firstNumber.value);
      double num2 = double.parse(mathResult.value);

      secondNumber.value = mathResult.value;

      switch (operation.value) {
        case '+':
          mathResult.value = (num1 + num2).toString();
          break;
        case '-':
          mathResult.value = (num1 - num2).toString();
          break;
        case '*':
          mathResult.value = (num1 * num2).toString();
          break;
        case '/':
          mathResult.value = (num1 / num2).toString();
          break;
      }

      if (mathResult.value.endsWith('.0'))
        mathResult.value =
            mathResult.value.substring(0, mathResult.value.length - 2);
    }
  }

  isInfinity() {
    if (mathResult.value.contains('Infinity')) resetAll();
  }
}
