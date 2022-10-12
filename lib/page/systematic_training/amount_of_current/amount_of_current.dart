import 'dart:math';
import 'package:digital_computation/model/amout_of_current_model.dart';
import 'package:digital_computation/page/systematic_training/amount_of_current/amount_of_current_example.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AmountOfCurrent extends StatefulWidget {
  const AmountOfCurrent({Key? key}) : super(key: key);

  @override
  State<AmountOfCurrent> createState() => _AmountOfCurrentState();
}

class _AmountOfCurrentState extends State<AmountOfCurrent> {
  final List<AmoutOfCurrentModel> _amoutOfCurrentModelList = [];
  bool _isVisibleAnswer = false;
  @override
  void initState() {
    super.initState();

    _createData();
  }

  _createData() {
    _amoutOfCurrentModelList.clear();
    for (var i = 0; i < 20; i++) {
      int basePeriodYear = Random().nextInt(2) + 2020;
      int currentYear = basePeriodYear + 1;

      double basePeriodValue = Random().nextDouble() * 10000 + 10;
      double growthRate = Random().nextDouble();
      double currentValue = basePeriodValue * (1 + growthRate);

      AmoutOfCurrentModel amoutOfCurrentModel = AmoutOfCurrentModel(
          basePeriodYear,
          currentYear,
          basePeriodValue,
          currentValue,
          growthRate);

      _amoutOfCurrentModelList.add(amoutOfCurrentModel);
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
                      builder: (_) => const AmountOfCurrentExample()));
                },
                icon: const Icon(Icons.money_rounded)),
            IconButton(
                onPressed: () {
                  _createData();
                },
                icon: const Icon(Icons.refresh))
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
            Container(
              height: 44,
              decoration: const BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.grey, width: 0.5))),
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
                        showAnswerBottonView(_amoutOfCurrentModelList);
                      },
                      child: const Text('answer')),
                ],
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
            '${index + 1}.${amoutOfCurrentModel.basePeriodYear},值为${amoutOfCurrentModel.basePeriodValue.toStringAsFixed(2)},${amoutOfCurrentModel.currentYear}年同比增长${(amoutOfCurrentModel.growthRate * 100).toStringAsFixed(1)}%,则${amoutOfCurrentModel.currentYear}值为:',
          ),
          // const SizedBox(
          //   height: 5,
          // ),
          // Visibility(
          //     visible: _isVisibleAnswer,
          //     child: Text(
          //         '值为：${amoutOfCurrentModel.currentValue.toStringAsFixed(1)}'))
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

  void showAnswerBottonView(
          List<AmoutOfCurrentModel> amoutOfCurrentModelList) =>
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
                          itemCount: amoutOfCurrentModelList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Center(
                              child: Text(
                                  '${index + 1}.${_amoutOfCurrentModelList[index].currentValue.toStringAsFixed(1)}'),
                            );
                          }))),
            ),
          );
        },
      );
}
