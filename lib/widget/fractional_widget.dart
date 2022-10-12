import 'dart:math' as math;

import 'package:flutter/material.dart';

class FractionalWidget extends StatelessWidget {
  final int numerator;
  final int denominator;

  const FractionalWidget(
      {Key? key, required this.numerator, required this.denominator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double result = numerator / denominator;
    return SizedBox(
      height: 60,
      width: 80,
      child: Stack(
        children: [
          Positioned(
            top: 12,
            left: 18,
            child: Container(
              width: 20,
              height: 20,
              alignment: Alignment.center,
              child: Text(
                '$numerator',
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 18,
            child: Container(
              width: 20,
              height: 20,
              alignment: Alignment.topCenter,
              child: const Text(
                '__',
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 18,
            child: Container(
              width: 20,
              height: 20,
              alignment: Alignment.center,
              child: Text(
                '$denominator',
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: 40,
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  child: const Text(
                    '=',
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  child: Text(
                    '$result',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
