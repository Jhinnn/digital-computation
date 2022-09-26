import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class TwoPeriodSpecificGravityDifferenceExample extends StatefulWidget {
  const TwoPeriodSpecificGravityDifferenceExample({Key? key}) : super(key: key);

  @override
  State<TwoPeriodSpecificGravityDifferenceExample> createState() =>
      _TwoPeriodSpecificGravityDifferenceExampleState();
}

class _TwoPeriodSpecificGravityDifferenceExampleState
    extends State<TwoPeriodSpecificGravityDifferenceExample> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('two period specific gravity difference example'),
        ),
        body: Column(
          children: [
            const TeXView(
              child: TeXViewColumn(children: [
                TeXViewInkWell(
                  id: "id_0",
                  child: TeXViewColumn(children: [
                    TeXViewDocument(r"""<p>     
                       $$x = {{A \over B} - {A \over 1+a } / {B \over 1+b }}$$</p>""",
                        style: TeXViewStyle.fromCSS(
                            'padding: 0px; color: green; background: white')),
                    TeXViewDocument(r"""<p>     
                       $$={{A \over B} - {A(1+b) \over B(1+a)}}= {{A \over B}( {1- {1+b \over 1+a})}}=$$</p>""",
                        style: TeXViewStyle.fromCSS(
                            'padding: 0px; color: green; background: white')),
                    TeXViewDocument(r"""<p>     
                       $$={{A \over B}( {1- {1+b \over 1+a})}}={(a - b)*{A \over B}*{ 1 \over 1+a}}$$</p>""",
                        style: TeXViewStyle.fromCSS(
                            'padding: 0px; color: green; background: white')),
                  ]),
                )
              ]),
              style: TeXViewStyle(
                elevation: 10,
                borderRadius: TeXViewBorderRadius.all(25),
                border: TeXViewBorder.all(TeXViewBorderDecoration(
                    borderColor: Colors.blue,
                    borderStyle: TeXViewBorderStyle.solid,
                    borderWidth: 5)),
                backgroundColor: Colors.white,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: _itemBuilder,
                itemCount: 10,
              ),
            ),
          ],
        ));
  }

  Widget _itemBuilder(BuildContext context, int index) {
    double totalValue = Random().nextDouble() * 1000;
    double totalValueGrowthRate = Random().nextDouble();

    double targetValue = totalValue * (1 - Random().nextDouble());
    double targetValueGrowthRate = Random().nextDouble();

    double periodRate0 = targetValue / (1 + targetValueGrowthRate);
    double periodRate1 = totalValue / (1 + totalValueGrowthRate);

    double periodRate = periodRate0 / periodRate1;

    double currentRate = targetValue / totalValue;

    double totalGrowthRate = currentRate - periodRate;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('B = '),
                Text(totalValue.toStringAsFixed(2)),
                const SizedBox(
                  width: 20,
                ),
                const Text('b = '),
                Text('${(totalValueGrowthRate * 100).toStringAsFixed(1)}%'),
                const SizedBox(
                  width: 20,
                ),
                const Text('A = '),
                Text((targetValue).toStringAsFixed(2)),
                const SizedBox(
                  width: 20,
                ),
                const Text('a = '),
                Text('${(targetValueGrowthRate * 100).toStringAsFixed(1)}%'),
              ],
            ),
            Row(
              children: [
                Text('(${(targetValueGrowthRate * 100).toStringAsFixed(1)}%'),
                const SizedBox(
                  width: 5,
                ),
                const Text('-'),
                const SizedBox(
                  width: 5,
                ),
                Text('${(totalValueGrowthRate * 100).toStringAsFixed(1)}%)'),
                const SizedBox(
                  width: 5,
                ),
                const Text('*'),
                const SizedBox(
                  width: 5,
                ),
                Text(
                    '${(targetValue).toStringAsFixed(2)}/${(totalValue).toStringAsFixed(2)}'),
                const SizedBox(
                  width: 5,
                ),
                const Text('*'),
                const SizedBox(
                  width: 5,
                ),
                const Text('1'),
                const SizedBox(
                  width: 5,
                ),
                const Text('/'),
                const SizedBox(
                  width: 5,
                ),
                Text(
                    '(1+${(targetValueGrowthRate * 100).toStringAsFixed(1)}%)'),
              ],
            ),
            Text('${(totalGrowthRate * 100).toStringAsFixed(1)}%'),
          ],
        ),
      ),
    );
  }
}
