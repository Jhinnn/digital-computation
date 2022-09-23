import 'dart:math' as math;

import 'package:flutter/material.dart';

class PowWidget extends StatelessWidget {
  final num value;
  final int pow;

  const PowWidget({Key? key, required this.value, required this.pow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var result = math
        .pow(value, pow)
        .toStringAsFixed(2);

    return Row(
      children: [
        Text('$value'),
        Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 2),
          child: Text(
            '$pow',
            style: const TextStyle(fontSize: 12),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 2),
          child: Text('='),
        ),
        Text(result),
      ],
    );
  }
}
