import 'package:digital_computation/widget/pow_widget.dart';
import 'package:digital_computation/widget/tips_widget.dart';
import 'package:flutter/material.dart';

class DecimalsPowerPage extends StatefulWidget {
  final int baseNum;
  final List<int> powerList;
  const DecimalsPowerPage(
      {Key? key, required this.baseNum, required this.powerList})
      : super(key: key);

  @override
  State<DecimalsPowerPage> createState() => _DecimalsPowerPageState();
}

class _DecimalsPowerPageState extends State<DecimalsPowerPage> {
  int difficultyLevel = 0;
  List<String> difficultyLevelList = [
    'moderation',
    'Somewhat difficult',
    'difficult'
  ];
  bool isShowMenu = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('decimals power'),
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemBuilder: _itemBuilder,
              itemCount: 10,
            ),
            // _diffWidget(),
          ],
        ));
  }

  Widget _itemBuilder(BuildContext context, int index) {
    if (index != 0) {
      List<double> list =
          List.generate(10, ((i) => widget.baseNum + 0.1 * index + i * 0.01));
      return Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...widget.powerList.map(
                (pow) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...list
                        .map((e) => PowWidget(
                            value: num.parse(e.toStringAsFixed(2)), pow: pow))
                        .toList()
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
    return Container();
  }

  void showDifficultyMenu() {
    setState(() {
      isShowMenu = !isShowMenu;
    });
  }

  void difficultyChange(int index) {
    difficultyLevel = index;
    isShowMenu = false;
    setState(() {});
  }

  Widget _diffWidget() {
    return Positioned(
        right: 20,
        bottom: 40,
        child: Column(
          children: [
            Visibility(
              visible: isShowMenu,
              child: Column(
                children: [
                  TipsWidget(
                    onTap: () {
                      difficultyChange(0);
                    },
                    words: 'moderation',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TipsWidget(
                    onTap: () {
                      difficultyChange(1);
                    },
                    words: 'Somewhat difficult',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TipsWidget(
                    onTap: () {
                      difficultyChange(2);
                    },
                    words: 'difficult',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            TipsWidget(
              onTap: showDifficultyMenu,
              words: difficultyLevelList[difficultyLevel],
            ),
          ],
        ));
  }
}
