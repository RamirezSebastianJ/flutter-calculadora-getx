import 'package:calculadora/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'line_separator.dart';
import 'main_result.dart';

class MathResults extends StatelessWidget {
  final calculatorCtrl = Get.find<CalculatorController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            LineSeparator(),
            MainResultText(text: '${calculatorCtrl.mathResult}'),
          ],
        ));
  }
}
