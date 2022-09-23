import 'package:flutter/material.dart';

class DailyPracticePage extends StatefulWidget {
  const DailyPracticePage({Key? key}) : super(key: key);

  @override
  State<DailyPracticePage> createState() => _DailyPracticePageState();
}

class _DailyPracticePageState extends State<DailyPracticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('daily practice'),),
    );
  }
}