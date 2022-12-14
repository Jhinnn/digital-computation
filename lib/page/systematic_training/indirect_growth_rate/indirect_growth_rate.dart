import 'dart:math';
import 'package:digital_computation/model/indirect_growth_rate_model.dart';
import 'package:digital_computation/page/systematic_training/indirect_growth_rate/indirect_growth_rate_example.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
/// 100 20%  120 60%  192  92%

/// 0.6 + 0.2 + (0.12) = 0.92

class IndirectGrowthRate extends StatefulWidget {
  const IndirectGrowthRate({Key? key}) : super(key: key);

  @override
  State<IndirectGrowthRate> createState() => _IndirectGrowthRateState();
}

class _IndirectGrowthRateState extends State<IndirectGrowthRate> {
  final List<IndirectGrowthRateModel> _indirectGrowthRateModelList = [];

  @override
  void initState() {
    super.initState();

    _createData();
  }

  _createData() {
    for (var i = 0; i < 20; i++) {
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

      _indirectGrowthRateModelList.add(indirectGrowthRateModel);
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
                '?????????????????????2020?????????????????????????????????x%???2019???????????????x%??????2021??????2019?????????????????????',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: _itemBuilder,
                itemCount: _indirectGrowthRateModelList.length,
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
                          showAnswerBottonView(_indirectGrowthRateModelList);
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
    IndirectGrowthRateModel indirectGrowthRateModel =
        _indirectGrowthRateModelList[index];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${index + 1},${indirectGrowthRateModel.secondYear}????????????${(indirectGrowthRateModel.firstGrowthRate * 100).toStringAsFixed(1)}%, ${indirectGrowthRateModel.currentYear}????????????${(indirectGrowthRateModel.secondGrowthRate * 100).toStringAsFixed(1)}%, ???${indirectGrowthRateModel.firstYear}???${indirectGrowthRateModel.currentYear}????????????:',
          ),
         
        ],
      ),
    );
  }

  void showBottonView() => showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Material(
            child: SizedBox(
                height: 500,
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
                      const Text('a?????????????????????????????????x%???a+1???????????????y%??????a+1??????a-1??????????????????'),
                      const SizedBox(height: 10),
                      const Text(
                          't1(1+x%)(1+y%)=t2?????? (t2 - t1) / t1,???????????? t2/t1 - 1 ,?????? t2/t1 = (1+x%)(1+y%) = 1+ x% + y% + xy%,?????? t2 / t1 = x% + y% + xy%'),
                      const SizedBox(height: 10),
                      Text(
                        'example',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                          '2020???????????????????????????1000???,2021???????????????10%,2022????????????20%????????????2021???1100??????2022??????1320??????????????????32% = 10% + 20% + 10% * 20%'),
                      const SizedBox(height: 10),
                      const Text(
                          '1000(1+10%)(1+20%) = 1320, 1000(1 + 32%) = 1320,   10% + 20% + 10% x 20% = 32%'),
                    ],
                  ),
                )),
          );
        },
      );
      
  void showAnswerBottonView(
      List<IndirectGrowthRateModel> indirectGrowthRateModelList) {
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
                        itemCount: indirectGrowthRateModelList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                            child: Text(
                                '${index + 1}.${(indirectGrowthRateModelList[index].totalGrowthRate * 100).toStringAsFixed(1)}%'),
                          );
                        }))),
          ),
        );
      },
    );
  }
}
