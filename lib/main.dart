import 'package:digital_computation/daily_practice/daily_practice_page.dart';
import 'package:digital_computation/setting/setting_page.dart';
import 'package:digital_computation/statistics/statistics_page.dart';
import 'package:digital_computation/systematic_training/systematic_training_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black, fontSize: 16),
        ),
        fontFamily: 'sanjiyunlvti'
      ),
      home: const HomePage(title: 'Calculate the practice'),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(index: currentIndex, children: const [
          DailyPracticePage(),
          SystematicTrainingpPage(),
          StatisticsPage(),
          SettingPage(),
        ]),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            iconSize: 30.0,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.display_settings_sharp),
                label: 'practice',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'training',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.stacked_line_chart),
                label: 'statistics',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'setting',
              )
            ]));
  }
}