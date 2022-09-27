import 'dart:math';
import 'package:flutter/material.dart';

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
  bool _isVisbleAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('IndirectGrowthRateExample'),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _isVisbleAnswer = !_isVisbleAnswer;
                  });
                },
                icon: const Icon(Icons.remove_red_eye))
          ],
        ),
        body: ListView.builder(
          itemBuilder: _itemBuilder,
          itemCount: 20,
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('${(firstRate * 100).toStringAsFixed(1)}%'),
            const Text('+'),
            Text('${(secondRate * 100).toStringAsFixed(1)}%'),
            const Text('+'),
            Text('${(firstRate * 100).toStringAsFixed(1)}%'),
            const Text('x'),
            Text('${(secondRate * 100).toStringAsFixed(1)}%'),
            const Text('='),
            Visibility(
                visible: _isVisbleAnswer,
                child: Text('${(result * 100).toStringAsFixed(1)}%'))
          ],
        ),
      ),
    );
  }
}
