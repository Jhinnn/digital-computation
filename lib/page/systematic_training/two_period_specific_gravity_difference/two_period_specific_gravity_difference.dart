import 'dart:math';
import 'package:digital_computation/model/two_period_specific_gravity_difference_model.dart';
import 'package:digital_computation/page/systematic_training/two_period_specific_gravity_difference/two_period_specific_gravity_difference_example.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 100 20%  120 60%  192  92%

/// 0.6 + 0.2 + (0.12) = 0.92

class TwoPeriodSpecificGravityDifference extends StatefulWidget {
  const TwoPeriodSpecificGravityDifference({Key? key}) : super(key: key);

  @override
  State<TwoPeriodSpecificGravityDifference> createState() =>
      _TwoPeriodSpecificGravityDifferenceState();
}

class _TwoPeriodSpecificGravityDifferenceState
    extends State<TwoPeriodSpecificGravityDifference> {
  final List<TwoPeriodSpecificGravityDifferenceModel>
      _twoPeriodSpecificGravityDifferenceModelList = [];

  @override
  void initState() {
    super.initState();

    _createData();
  }

  _createData() {
    for (var i = 0; i < 10; i++) {
      int currentYear = Random().nextInt(2) + 2021;
      int basePeriodYear = currentYear - 1;

      double totalValue = Random().nextDouble() * 1000;
      double totalValueGrowthRate = Random().nextDouble();

      double targetValue = totalValue * (1 - Random().nextDouble());
      double targetValueGrowthRate = Random().nextDouble();

      double periodRate0 = targetValue / (1 + targetValueGrowthRate);
      double periodRate1 = totalValue / (1 + totalValueGrowthRate);

      double periodRate = periodRate0 / periodRate1;

      double currentRate = targetValue / totalValue;

      double totalGrowthRate = currentRate - periodRate;

      TwoPeriodSpecificGravityDifferenceModel
          twoPeriodSpecificGravityDifferenceModel =
          TwoPeriodSpecificGravityDifferenceModel(
              basePeriodYear,
              currentYear,
              totalValue,
              targetValue,
              totalValueGrowthRate,
              targetValueGrowthRate,
              periodRate,
              currentRate,
              totalGrowthRate);

      _twoPeriodSpecificGravityDifferenceModelList
          .add(twoPeriodSpecificGravityDifferenceModel);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('two period specific gravity difference'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) =>
                          const TwoPeriodSpecificGravityDifferenceExample()));
                },
                icon: const Icon(Icons.money_rounded))
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '问题：某个地方2022年一种东西总量为A，同比增长(下降)a%,其中(某种东西)一种东西总量为B(B < A,B属于A中的一小类)，同比(下降)增长b%,问2022，B占A中的比例比上年',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: _itemBuilder,
                itemCount: _twoPeriodSpecificGravityDifferenceModelList.length,
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
    TwoPeriodSpecificGravityDifferenceModel indirectGrowthRateModel =
        _twoPeriodSpecificGravityDifferenceModelList[index];
    String symbol = '下降';
    if (indirectGrowthRateModel.specificGravityValue > 0) {
      symbol = '上升';
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${index + 1},  ${indirectGrowthRateModel.currentYear}某地方一种东西总量为:${indirectGrowthRateModel.totalValue.toStringAsFixed(2)},同比增长${(indirectGrowthRateModel.totalValueGrowthRate * 100).toStringAsFixed(1)}%, 其中一种东西总量为${indirectGrowthRateModel.targetValue.toStringAsFixed(2)},同比增长${(indirectGrowthRateModel.targetValueGrowthRate * 100).toStringAsFixed(1)}%, 则${indirectGrowthRateModel.currentYear}到B占A的比重$symbol${(indirectGrowthRateModel.specificGravityValue * 100).toStringAsFixed(1)}%',
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
                      const Text(
                          'a年某种东西数量为A同比增长x%，其中东西数量为B同比增长y%，问a年比a-1年东西B占A的比重增加多少或者减少多少'),
                      const SizedBox(height: 10),
                      const Text(
                          'a年比重为 B/A，a-1年总数量为 A/(1+x%) a-1年其中一种东西数量为B/(1+y%),比重为 B/(1+y%) / A/(1+x%) ,求为：  B/A -  B/(1+y%) / A/(1+x%) = (y% - x%)(B/A)/(1+y%)'),
                      const SizedBox(height: 10),
                      Text(
                        'example',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                          '2022年某地方财政总收入为1100万亿,同比增加10%,其中企业所得税为220万亿，同比增加20%，问2022年企业所得税占财政收入比重增加多少或者减少多少'),
                      const SizedBox(height: 10),
                      const Text(
                          '2022年企业所得税占比重为 220/1100 = 20%, 2021年财政收入：1000(1 + 10%) = 1100, 企业所得税183.3(1+20%) = 220,占比 183.3/1000 = 18.3%,则比重增加0%'),
                    ],
                  ),
                )),
          );
        },
      );
}
