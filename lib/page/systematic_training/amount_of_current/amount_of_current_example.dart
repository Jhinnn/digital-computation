import 'package:digital_computation/widget/fractional_widget.dart';
import 'package:digital_computation/widget/pow_widget.dart';
import 'package:digital_computation/widget/tips_widget.dart';
import 'package:flutter/material.dart';

class AmountOfCurrentExample extends StatefulWidget {
  const AmountOfCurrentExample({
    Key? key,
  }) : super(key: key);

  @override
  State<AmountOfCurrentExample> createState() => _AmountOfCurrentExampleState();
}

class _AmountOfCurrentExampleState extends State<AmountOfCurrentExample> {
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
          title: const Text('AmountOfCurrentExample'),
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemBuilder: _itemBuilder,
              itemCount: 5,
            ),
            // _diffWidget(),
          ],
        ));
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
            child: Column(
              children: [
                Row(
                  children: List.generate(
                      5,
                      (i) => FractionalWidget(
                          numerator: 1, denominator: index * 5 + i)),
                ),
              ],
            )));
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
