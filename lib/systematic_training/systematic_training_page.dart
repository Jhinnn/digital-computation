import 'package:digital_computation/systematic_training/average_annual_growth_rate.dart';
import 'package:digital_computation/systematic_training/decimals_power_page.dart';
import 'package:digital_computation/systematic_training/rate_of_increase_page.dart';
import 'package:flutter/material.dart';

class SystematicTrainingpPage extends StatefulWidget {
  const SystematicTrainingpPage({Key? key}) : super(key: key);

  @override
  State<SystematicTrainingpPage> createState() =>
      _SystematicTrainingpPageState();
}

class _SystematicTrainingpPageState extends State<SystematicTrainingpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('systematic training'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children:  [
          ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const DecimalsPowerPage(baseNum: 1,powerList: [2]))),
            title: const Text('power'),
          ),
          ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const RateOfIncreasePage(baseNum: 1,powerList: [2]))),
            title: const Text('rate of increase'),
          ),
          ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const AverageAnnualGrowthRatePage()),),
            title: const Text('average annual growth rate'),
          )
        ],
      )),
    );
  }
}
