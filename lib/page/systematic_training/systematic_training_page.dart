import 'package:digital_computation/page/systematic_training/amount_of_current/amount_of_current.dart';
import 'package:digital_computation/page/systematic_training/average_annual_growth_rate/average_annual_growth_rate.dart';
import 'package:digital_computation/page/systematic_training/base_period_amount/base_period_amount.dart';
import 'package:digital_computation/page/systematic_training/indirect_growth_rate/indirect_growth_rate.dart';
import 'package:digital_computation/page/systematic_training/two_period_specific_gravity_difference/two_period_specific_gravity_difference.dart';
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
                builder: (_) => const AmountOfCurrent()),
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
                builder: (_) => const IndirectGrowthRate()),
            ),
            title: const Text('indirect growth rate'),
          ),
          ListTile(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) => const AverageAnnualGrowthRate()),
            ),
            title: const Text('average annual growth rate'),
          ),
          ListTile(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) => const TwoPeriodSpecificGravityDifference()),
            ),
            title: const Text('two period specific gravity difference'),
          )
        ],
      )),
    );
  }
}
