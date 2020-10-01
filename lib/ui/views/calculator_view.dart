import 'package:buku_pesak/core/services/calculator/scientific_calculator.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kalkulator"),
      ),
      body: ScientificCalculator(),
    );
  }
}
