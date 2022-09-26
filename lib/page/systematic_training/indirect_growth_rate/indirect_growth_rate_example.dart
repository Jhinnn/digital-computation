import 'dart:math';
import 'package:digital_computation/widget/tips_widget.dart';
import 'package:flutter/material.dart';

/// 100 20%  120 60%  192  92%

/// 0.6 + 0.2 + (0.12) = 0.92

class IndirectGrowthRateExample extends StatefulWidget {
  const IndirectGrowthRateExample({
    Key? key,
  }) : super(key: key);

  @override
  State<IndirectGrowthRateExample> createState() =>
      _IndirectGrowthRateExamplePageState();
}

class _IndirectGrowthRateExamplePageState
    extends State<IndirectGrowthRateExample> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('IndirectGrowthRateExample'),
          
        ),
        body: ListView.builder(
          itemBuilder: _itemBuilder,
          itemCount: 10,
        ));
  }

  Widget _itemBuilder(BuildContext context, int index) {
    double firstRate = Random().nextDouble();
    double secondRate = Random().nextDouble();
    double result = firstRate + secondRate + (firstRate * secondRate);
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('${(firstRate * 100).toStringAsFixed(1)}%'),
            const Text('+'),
            Text('${(secondRate * 100).toStringAsFixed(1)}%'),
            const Text('+'),
            Text('${(firstRate * 100).toStringAsFixed(1)}%'),
            const Text('x'),
            Text('${(secondRate * 100).toStringAsFixed(1)}%'),
            const Text('='),
            Text('${(result * 100).toStringAsFixed(1)}%')
          ],
        ),
      ),
    );
  }
  
  
}
