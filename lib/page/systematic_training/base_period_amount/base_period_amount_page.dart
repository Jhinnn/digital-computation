import 'dart:math';
import 'package:digital_computation/model/amout_of_current_model.dart';
import 'package:digital_computation/model/average_annual_growth_rate_model.dart';
import 'package:digital_computation/page/systematic_training/average_annual_growth_rate/decimals_power_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasePeriodAmountPage extends StatefulWidget {
  const BasePeriodAmountPage({Key? key}) : super(key: key);

  @override
  State<BasePeriodAmountPage> createState() => _BasePeriodAmountPageState();
}

class _BasePeriodAmountPageState extends State<BasePeriodAmountPage> {
  final List<AmoutOfCurrentModel> _amoutOfCurrentModelList = [];

  @override
  void initState() {
    super.initState();

    _createData();
  }

  _createData() {
    for (var i = 0; i < 10; i++) {
      int basePeriodYear = Random().nextInt(2) + 2020;
      int currentYear = basePeriodYear + 1;

      double currentValue = Random().nextDouble() * 4000 + 1000;
      double growthRate = Random().nextDouble();
      double basePeriodValue = currentValue / (1 + growthRate);

      AmoutOfCurrentModel amoutOfCurrentModel = AmoutOfCurrentModel(
          basePeriodYear,
          currentYear,
          basePeriodValue,
          currentValue,
          growthRate);

      _amoutOfCurrentModelList.add(amoutOfCurrentModel);

      // if (currentYear - basePeriodYear <= 5 &&
      //     currentYear - basePeriodYear >= 2) {
      //   double avgValue = currentValue / basePeriodValue;

      //   double averageAnnualGrowthRate =
      //       pow(avgValue, 1 / (currentYear - basePeriodYear)) - 1;
      //   AverageAnnualGrowthRateModel annualGrowthRateModel =
      //       AverageAnnualGrowthRateModel(basePeriodYear, currentYear,
      //           basePeriodValue, currentValue, averageAnnualGrowthRate);

      //   _averageAnnualGrowthRateModelList.add(annualGrowthRateModel);

      //   if (_averageAnnualGrowthRateModelList.length == 10) {
      //     break;
      //   }
      // }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Amount of current'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const DecimalsPowerPage(
                          baseNum: 1, powerList: [2, 3, 4, 5])));
                },
                icon: const Icon(Icons.money_rounded))
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '问题：某个地方2022年某种东西为数量为a，2022年同比增长x%，问2021年有这种东西数量为多少？',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: _itemBuilder,
                itemCount: _amoutOfCurrentModelList.length,
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
    AmoutOfCurrentModel amoutOfCurrentModel = _amoutOfCurrentModelList[index];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${index + 1},  ${amoutOfCurrentModel.currentYear}值为${amoutOfCurrentModel.currentValue.toStringAsFixed(2)}, ${amoutOfCurrentModel.currentYear}年同比增长${(amoutOfCurrentModel.growthRate * 100).toStringAsFixed(1)}%, 则${amoutOfCurrentModel.basePeriodYear}值为：${amoutOfCurrentModel.basePeriodValue.toStringAsFixed(2)}',
          ),
          const SizedBox(
            height: 10,
          ),
          // Text(
          //   '答案：${annualGrowthRateModel.currentValue.toStringAsFixed(0)}/${annualGrowthRateModel.basePeriodValue.toStringAsFixed(0)}=${avg.toStringAsFixed(2)},开$year次方,值为:${pow(avg, 1 / year).toStringAsFixed(3)},年均增长率为：${(pow(avg, 1 / year) * 100 % 100).toStringAsFixed(1)}%',
          //   style: Theme.of(context).textTheme.bodySmall,
          // )
        ],
      ),
    );
  }

  void showBottonView() => showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Material(
            child: SizedBox(
                height: 400,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'analysis',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      const Text('a年某种东西数量为A，同比增加x%,问b(b = a - 1)年这种东西为多少'),
                      const SizedBox(height: 10),
                      const Text('B(1+x%)=A，因次 B = A / (1 + x%)'),
                      const SizedBox(height: 10),
                      Text(
                        'example',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                          '2022年某地方财政收入为2200亿,2022年同比增长10%,则2021财政收入为2000亿'),
                      const SizedBox(height: 10),
                      const Text('2000(1+10%) = 2200'),
                    ],
                  ),
                )),
          );
        },
      );
}
