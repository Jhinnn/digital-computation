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
    for (var i = 0; i < 20; i++) {
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
                '?????????????????????2022????????????????????????A???????????????(??????)a%,??????(????????????)?????????????????????B(B < A,B??????A???????????????)?????????(??????)??????b%,???2022???B???A?????????????????????',
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () {
                          showBottonView();
                        },
                        child: const Text('analysis')),
                    InkWell(
                        onTap: () {
                          showAnswerBottonView(
                              _twoPeriodSpecificGravityDifferenceModelList);
                        },
                        child: const Text('answer')),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget _itemBuilder(BuildContext context, int index) {
    TwoPeriodSpecificGravityDifferenceModel indirectGrowthRateModel =
        _twoPeriodSpecificGravityDifferenceModelList[index];
    String symbol = '??????';
    if (indirectGrowthRateModel.specificGravityValue > 0) {
      symbol = '??????';
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${index + 1},  ${indirectGrowthRateModel.currentYear}??????????????????????????????:${indirectGrowthRateModel.totalValue.toStringAsFixed(2)},????????????${(indirectGrowthRateModel.totalValueGrowthRate * 100).toStringAsFixed(1)}%, ???????????????????????????${indirectGrowthRateModel.targetValue.toStringAsFixed(2)},????????????${(indirectGrowthRateModel.targetValueGrowthRate * 100).toStringAsFixed(1)}%, ???${indirectGrowthRateModel.currentYear}???B???A?????????',
          ),
          const SizedBox(
            height: 10,
          ),
          // Text(
          //   '?????????${annualGrowthRateModel.currentValue.toStringAsFixed(0)}/${annualGrowthRateModel.basePeriodValue.toStringAsFixed(0)}=${avg.toStringAsFixed(2)},???$year??????,??????:${pow(avg, 1 / year).toStringAsFixed(3)},?????????????????????${(pow(avg, 1 / year) * 100 % 100).toStringAsFixed(1)}%',
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
                          'a????????????????????????A????????????x%????????????????????????B????????????y%??????a??????a-1?????????B???A???????????????????????????????????????'),
                      const SizedBox(height: 10),
                      const Text(
                          'a???????????? B/A???a-1??????????????? A/(1+x%) a-1??????????????????????????????B/(1+y%),????????? B/(1+y%) / A/(1+x%) ,?????????  B/A -  B/(1+y%) / A/(1+x%) = (y% - x%)(B/A)/(1+y%)'),
                      const SizedBox(height: 10),
                      Text(
                        'example',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                          '2022??????????????????????????????1100??????,????????????10%,????????????????????????220?????????????????????20%??????2022?????????????????????????????????????????????????????????????????????'),
                      const SizedBox(height: 10),
                      const Text(
                          '2022?????????????????????????????? 220/1100 = 20%, 2021??????????????????1000(1 + 10%) = 1100, ???????????????183.3(1+20%) = 220,?????? 183.3/1000 = 18.3%,???????????????0%'),
                    ],
                  ),
                )),
          );
        },
      );
      
  void showAnswerBottonView(
      List<TwoPeriodSpecificGravityDifferenceModel>
          twoPeriodSpecificGravityDifferenceModelList) {
    showDialog(
      context: context,
      builder: (context) {
        return Material(
          type: MaterialType.transparency,
          child: Center(
            child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4, childAspectRatio: 2),
                        itemCount:
                            twoPeriodSpecificGravityDifferenceModelList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                            child: Text(
                                '${index + 1}.${(twoPeriodSpecificGravityDifferenceModelList[index].specificGravityValue * 100).toStringAsFixed(1)}%'),
                          );
                        }))),
          ),
        );
      },
    );
  }
}
