import 'dart:math';
import 'package:digital_computation/model/average_annual_growth_rate_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AverageAnnualGrowthRatePage extends StatefulWidget {
  const AverageAnnualGrowthRatePage({Key? key}) : super(key: key);

  @override
  State<AverageAnnualGrowthRatePage> createState() =>
      _AverageAnnualGrowthRatePageState();
}

class _AverageAnnualGrowthRatePageState
    extends State<AverageAnnualGrowthRatePage> {
  List<AverageAnnualGrowthRateModel> _averageAnnualGrowthRateModelList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    createData();
  }

  createData() {
    for (var i = 0; i < 50; i++) {
      int basePeriodYear = Random().nextInt(8) + 2010;
      int currentYear = Random().nextInt(4) + 201;

      double basePeriodValue = Random().nextDouble() * 4000 + 1000;
      double currentValue = Random().nextDouble() * 5000 + 5000;

      if (currentYear - basePeriodYear <= 5 &&
          currentYear - basePeriodYear >= 2) {
        double avgValue = currentValue / basePeriodValue;
        double averageAnnualGrowthRate = sqrt(avgValue);
        AverageAnnualGrowthRateModel annualGrowthRateModel =
            AverageAnnualGrowthRateModel(basePeriodYear, currentYear,
                basePeriodValue, currentValue, averageAnnualGrowthRate);

        _averageAnnualGrowthRateModelList.add(annualGrowthRateModel);

        if (_averageAnnualGrowthRateModelList.length == 10) {
          break;
        }
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('average annual growth rate'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '问题：某个地方,某20xx年，某种东西为数量为a，到202x年，某种东西为数量为b,问202x年到20xx年，年平均增长率是多少？',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: _itemBuilder,
                itemCount: 10,
              ),
            ),
            InkWell(
              onTap: showBottonView,
              child: Container(
                height: 44,
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.grey, width: 0.5))),
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text('analysis'),
              ),
            )
          ],
        ));
  }

  Widget _itemBuilder(BuildContext context, int index) {
    AverageAnnualGrowthRateModel annualGrowthRateModel =
        _averageAnnualGrowthRateModelList[index];

    String averageAnnualGrowthRateStr =
        annualGrowthRateModel.averageAnnualGrowthRate.toStringAsFixed(3);

    double? averageAnnualGrowthRateDouble =
        double.tryParse(averageAnnualGrowthRateStr);
    if (averageAnnualGrowthRateDouble != null) {
      double averageAnnualGrowthRatePercent = averageAnnualGrowthRateDouble;
      averageAnnualGrowthRateStr = '$averageAnnualGrowthRatePercent%';
    } else {
      averageAnnualGrowthRateStr = '0%';
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '${index + 1},  在${annualGrowthRateModel.basePeriodYear}, 值为${annualGrowthRateModel.basePeriodValue.toStringAsFixed(2)},到${annualGrowthRateModel.currentYear},值为${annualGrowthRateModel.currentValue.toStringAsFixed(2)},增长率为$averageAnnualGrowthRateStr',
      ),
    );
  }

  void showBottonView() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return const Material(
          child: SizedBox(
              height: 400,
              width: double.infinity,
              child: Text('showBottomSheet')),
        );
      },
    );
  }
}
