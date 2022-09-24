import 'dart:math';
import 'package:digital_computation/model/indirect_growth_rate_model.dart';
import 'package:digital_computation/page/systematic_training/average_annual_growth_rate/average_annual_growth_rate_example.dart';
import 'package:digital_computation/page/systematic_training/indirect_growth_rate/indirect_growth_rate_example.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 100 20%  120 60%  192  92%

/// 0.6 + 0.2 + (0.12) = 0.92

class IndirectGrowthRate extends StatefulWidget {
  const IndirectGrowthRate({Key? key}) : super(key: key);

  @override
  State<IndirectGrowthRate> createState() => _IndirectGrowthRateState();
}

class _IndirectGrowthRateState extends State<IndirectGrowthRate> {
  final List<IndirectGrowthRateModel> _indirectGrowthRateModel = [];

  @override
  void initState() {
    super.initState();

    _createData();
  }

  _createData() {
    for (var i = 0; i < 10; i++) {
      int currentYear = Random().nextInt(2) + 2021;
      int firstYear = currentYear - 2;
      int secondYear = currentYear - 1;

      double firstGrowthRate = Random().nextDouble();
      double secondGrowthRate = Random().nextDouble();

      double totalGrowthRate = firstGrowthRate +
          secondGrowthRate +
          (secondGrowthRate * firstGrowthRate);

      IndirectGrowthRateModel indirectGrowthRateModel = IndirectGrowthRateModel(
          firstYear,
          secondYear,
          currentYear,
          firstGrowthRate,
          secondGrowthRate,
          totalGrowthRate);

      _indirectGrowthRateModel.add(indirectGrowthRateModel);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('indirect growth rate'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const IndirectGrowthRateExample()));
                },
                icon: const Icon(Icons.money_rounded))
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '问题：某个地方2020年某种东西数量同比增长x%，2019年同比增长x%，问2021年比2019增长率是多少？',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: _itemBuilder,
                itemCount: _indirectGrowthRateModel.length,
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
    IndirectGrowthRateModel indirectGrowthRateModel =
        _indirectGrowthRateModel[index];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${index + 1},  ${indirectGrowthRateModel.secondYear}增长率为${(indirectGrowthRateModel.firstGrowthRate * 100).toStringAsFixed(1)}%, ${indirectGrowthRateModel.currentYear}年增长率${(indirectGrowthRateModel.secondGrowthRate * 100).toStringAsFixed(1)}%, 则${indirectGrowthRateModel.firstYear}到${indirectGrowthRateModel.currentYear}增长率为：${(indirectGrowthRateModel.totalGrowthRate * 100).toStringAsFixed(1)}%',
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
                      const Text('a年某种东西数量同比增长x%，a+1年同比增长y%，问a+1年比a-1增长率是多少'),
                      const SizedBox(height: 10),
                      const Text(
                          't1(1+x%)(1+y%)=t2，求 (t2 - t1) / t1,结果为： t2/t1 - 1 ,已知 t2/t1 = (1+x%)(1+y%) = 1+ x% + y% + xy%,所以 t2 / t1 = x% + y% + xy%'),
                      const SizedBox(height: 10),
                      Text(
                        'example',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                          '2020年某地方财政收入为1000亿,2021年同比增长10%,2022同比增长20%吗，那么2021年1100亿，2022年为1320亿，增长率为32% = 10% + 20% + 10% * 20%'),
                      const SizedBox(height: 10),
                      const Text(
                          '1000(1+10%)(1+20%) = 1320, 1000(1 + 32%) = 1320,   10% + 20% + 10% x 20% = 32%'),
                    ],
                  ),
                )),
          );
        },
      );
}
