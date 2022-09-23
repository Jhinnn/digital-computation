import 'dart:math';

import 'package:flutter/material.dart';

class AverageAnnualGrowthRatePage extends StatefulWidget {
  const AverageAnnualGrowthRatePage({Key? key}) : super(key: key);

  @override
  State<AverageAnnualGrowthRatePage> createState() =>
      _AverageAnnualGrowthRatePageState();
}

class _AverageAnnualGrowthRatePageState
    extends State<AverageAnnualGrowthRatePage> {
  List<int> basePeriodYearList = List.generate(8, (index) => 2010 + index);
  List<int> currentYearList = List.generate(4, (index) => 2018 + index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('average annual growth rate'),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('某个地方,某一年，有xxxx a，到202x年，有b个,问202x年到某一年，年平均增长率是多少？'),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: _itemBuilder,
                itemCount: 20,
              ),
            ),
          ],
        ));
  }

  Widget _itemBuilder(BuildContext context, int index) {
    int basePeriodIndex = Random().nextInt(8);
    int basePeriodYear = basePeriodYearList[basePeriodIndex];

    int currentIndex = Random().nextInt(4);
    int currentYear = currentYearList[currentIndex];

    int basePeriodValue = Random().nextInt(1000) + 100;
    int currentValue = Random().nextInt(9999) + 1000;

    if (currentValue > basePeriodValue && currentYear - basePeriodYear <= 5) {
      return Row(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              '在$basePeriodYear, 值为$basePeriodValue,在$currentYear,值为$currentValue'),
        )
      ]);
    } else {
      return Container();
    }
  }
}
