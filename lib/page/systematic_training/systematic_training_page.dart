import 'package:digital_computation/page/systematic_training/amount_of_current/amount_of_current_page.dart';
import 'package:digital_computation/page/systematic_training/average_annual_growth_rate/average_annual_growth_rate.dart';
import 'package:digital_computation/page/systematic_training/base_period_amount/base_period_amount_page.dart';
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
                builder: (_) => const AmountOfCurrentPage()),
            ),
            title: const Text('amount of current'),
          ),
          ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const BasePeriodAmountPage()),
            ),
            title: const Text('base period amount'),
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
