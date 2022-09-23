import 'package:flutter/material.dart';

class MultiplicationWidget extends StatelessWidget {
  final num value;
  final num value1;

  const MultiplicationWidget({Key? key, required this.value, required this.value1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var result = (value * value1).toStringAsFixed(2);

    return Row(
      children: [
        Text('$value'),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
       const Text('X'),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
        Text('$value1'),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 2),
          child: Text('='),
        ),
        Text(result),
      ],
    );
  }
}
