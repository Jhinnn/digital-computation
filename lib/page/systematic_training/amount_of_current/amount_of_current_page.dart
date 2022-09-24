import 'dart:math';
import 'package:digital_computation/model/amout_of_current_model.dart';
import 'package:digital_computation/model/average_annual_growth_rate_model.dart';
import 'package:digital_computation/page/systematic_training/average_annual_growth_rate/decimals_power_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AmountOfCurrentPage extends StatefulWidget {
  const AmountOfCurrentPage({Key? key}) : super(key: key);

  @override
  State<AmountOfCurrentPage> createState() => _AmountOfCurrentPageState();
}

class _AmountOfCurrentPageState extends State<AmountOfCurrentPage> {
  final List<AmoutOfCurrentModel> _amoutOfCurrentModelList = [];

  @override
  void initState() {
    super.initState();

    _createData();
  }

  _createData() {
    for (var i = 0; i < 10; i++) {
      int basePeriodYear = Random().nextInt(2) + 2019;
      int currentYear = basePeriodYear + 1;

      double basePeriodValue = Random().nextDouble() * 4000 + 1000;
      double growthRate = Random().nextDouble();
      double currentValue = basePeriodValue * (1 + growthRate);

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
                '问题：某个地方,某2021年，某种东西为数量为a，2022年同比增长x%，问2022年有这种东西数量为多少？',
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
            '${index + 1},   在${amoutOfCurrentModel.basePeriodYear}, 值为${amoutOfCurrentModel.basePeriodValue.toStringAsFixed(2)}, ${amoutOfCurrentModel.currentYear}年同比增长${(amoutOfCurrentModel.growthRate * 100).toStringAsFixed(3)}%, 则${amoutOfCurrentModel.currentYear}值为：${amoutOfCurrentModel.currentValue.toStringAsFixed(2)}',
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
                      const Text('a年 某种东西数量为A，到b(b=a+1)年同比增加x%,问b年这种东西为多少'),
                      const SizedBox(height: 10),
                      const Text('A(1+x%)=B，因次 B = A * (1 + x%)'),
                      const SizedBox(height: 10),
                      Text(
                        'example',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                          '2021年某地方财政收入为1000亿,2022年同比增长20%,则2022财政收入为1200亿'),
                      const SizedBox(height: 10),
                      const Text('1000(1+20%) = 1200'),
                    ],
                  ),
                )),
          );
        },
      );
}
