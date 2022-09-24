import 'dart:math';

import 'package:digital_computation/model/indirect_growth_rate_model.dart';
import 'package:digital_computation/widget/pow_widget.dart';
import 'package:digital_computation/widget/tips_widget.dart';
import 'package:flutter/cupertino.dart';
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
  int difficultyLevel = 0;
  List<String> difficultyLevelList = [
    'moderation',
    'Somewhat difficult',
    'difficult'
  ];
  bool isShowMenu = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('IndirectGrowthRateExample'),
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemBuilder: _itemBuilder,
              itemCount: 10,
            ),
            // _diffWidget(),
          ],
        ));
  }

  Widget _itemBuilder(BuildContext context, int index) {
    double firstRate = Random().nextDouble() * 100;
    double secondRate = Random().nextDouble() * 100;
    double result = firstRate + secondRate + (firstRate * secondRate);
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('${firstRate.toStringAsFixed(2)}%'),
            const Text('+'),
            Text('${secondRate.toStringAsFixed(2)}%'),
            const Text('+'),
            Text('${firstRate.toStringAsFixed(2)}%'),
            const Text('x'),
            Text('${secondRate.toStringAsFixed(2)}%'),
            const Text('='),
            Text('${result.toStringAsFixed(2)}%')
          ],
        ),
      ),
    );
  }

  void showDifficultyMenu() {
    setState(() {
      isShowMenu = !isShowMenu;
    });
  }

  void difficultyChange(int index) {
    difficultyLevel = index;
    isShowMenu = false;
    setState(() {});
  }

  Widget _diffWidget() {
    return Positioned(
        right: 20,
        bottom: 40,
        child: Column(
          children: [
            Visibility(
              visible: isShowMenu,
              child: Column(
                children: [
                  TipsWidget(
                    onTap: () {
                      difficultyChange(0);
                    },
                    words: 'moderation',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TipsWidget(
                    onTap: () {
                      difficultyChange(1);
                    },
                    words: 'Somewhat difficult',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TipsWidget(
                    onTap: () {
                      difficultyChange(2);
                    },
                    words: 'difficult',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            TipsWidget(
              onTap: showDifficultyMenu,
              words: difficultyLevelList[difficultyLevel],
            ),
          ],
        ));
  }
}
