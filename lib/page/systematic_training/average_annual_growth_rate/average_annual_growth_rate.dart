import 'dart:math';
import 'package:digital_computation/model/average_annual_growth_rate_model.dart';
import 'package:digital_computation/page/systematic_training/average_annual_growth_rate/average_annual_growth_rate_example.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AverageAnnualGrowthRate extends StatefulWidget {
  const AverageAnnualGrowthRate({Key? key}) : super(key: key);

  @override
  State<AverageAnnualGrowthRate> createState() =>
      _AverageAnnualGrowthRateState();
}

class _AverageAnnualGrowthRateState extends State<AverageAnnualGrowthRate> {
  final List<AverageAnnualGrowthRateModel> _averageAnnualGrowthRateModelList =
      [];
  @override
  void initState() {
    super.initState();

    _createData();
  }

  _createData() {
    for (var i = 0; i < 20; i++) {
      int currentYear = Random().nextInt(3) + 2021;
      int basePeriodYear = currentYear - Random().nextInt(2) - 2;
      double basePeriodValue = Random().nextDouble() * 4000 + 1000;
      double currentValue = Random().nextDouble() * 5000 + 5000;

      double avgValue = currentValue / basePeriodValue;

      double averageAnnualGrowthRate =
          pow(avgValue, 1 / (currentYear - basePeriodYear)) - 1;
      AverageAnnualGrowthRateModel annualGrowthRateModel =
          AverageAnnualGrowthRateModel(basePeriodYear, currentYear,
              basePeriodValue, currentValue, averageAnnualGrowthRate);

      _averageAnnualGrowthRateModelList.add(annualGrowthRateModel);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Average annual growth rate'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const AverageAnnualGrowthRateExample(
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
                '?????????????????????,???20xx??????????????????????????????a??????202x??????????????????????????????b,???202x??????20xx????????????????????????????????????',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: _itemBuilder,
                itemCount: _averageAnnualGrowthRateModelList.length,
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
                                _averageAnnualGrowthRateModelList);
                          },
                          child: const Text('answer')),
                    ],
                  )
              ),
            )
          ],
        ));
  }

  Widget _itemBuilder(BuildContext context, int index) {
    AverageAnnualGrowthRateModel annualGrowthRateModel =
        _averageAnnualGrowthRateModelList[index];

    var averageAnnualGrowthRate =
        (annualGrowthRateModel.averageAnnualGrowthRate * 100)
            .toStringAsFixed(1);

    double avg = annualGrowthRateModel.currentValue /
        annualGrowthRateModel.basePeriodValue;

    int year = annualGrowthRateModel.currentYear -
        annualGrowthRateModel.basePeriodYear;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '${index + 1},???${annualGrowthRateModel.basePeriodYear}, ??????${annualGrowthRateModel.basePeriodValue.toStringAsFixed(2)},???${annualGrowthRateModel.currentYear},??????${annualGrowthRateModel.currentValue.toStringAsFixed(2)},${annualGrowthRateModel.currentYear}???${annualGrowthRateModel.basePeriodYear}??????????????????:',
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
                      const Text('a??? ?????????A??????b??? ?????????B,??????????????????????????????'),
                      const SizedBox(height: 10),
                      const Text(
                          'A(1+n%)(1+n%)...(1+n%) = B????????? (1+n%)???b-a????????????B/A???b-a?????? ??????1'),
                      const SizedBox(height: 10),
                      Text(
                        'example',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      const Text('2018????????????1000,???2022????????????1465,??????????????????10%.'),
                      const SizedBox(height: 10),
                      const Text(
                          '1000(1+10%)(1+10%)(1+10%)(1+10%) = 1464, ??????(1+10%)???4?????????1.464, 1.464???4?????????1.1, ??????1???0.1???10%'),
                    ],
                  ),
                )),
          );
        },
      );
      
  void showAnswerBottonView(
      List<AverageAnnualGrowthRateModel> averageAnnualGrowthRateModelList) {
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
                        itemCount: averageAnnualGrowthRateModelList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                            child: Text(
                                '${index + 1}.${(averageAnnualGrowthRateModelList[index].averageAnnualGrowthRate * 100).toStringAsFixed(1)}%'),
                          );
                        }))),
          ),
        );
      },
    );
  }
}
