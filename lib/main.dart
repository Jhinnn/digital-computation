import 'package:digital_computation/page/daily_practice/daily_practice_page.dart';
import 'package:digital_computation/page/setting/setting_page.dart';
import 'package:digital_computation/page/statistics/statistics_page.dart';
import 'package:digital_computation/page/systematic_training/systematic_training_page.dart';
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
            // titleLarge: TextStyle(
            //     color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
            // titleMedium: TextStyle(
            //     color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
          bodyMedium: TextStyle(color: Colors.black, fontSize: 15),
            bodySmall: TextStyle(color: Colors.blue, fontSize: 16),
        ),
        // fontFamily: 'sanjiyunlvti'
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
