import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pie Chart Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pie Chart Example'),
      ),
      body: Center(
        child: PieChart(
          PieChartData(
            sections: [
              PieChartSectionData(
                color: Colors.red,
                value: 40,
                title: '40%',
                radius: 50,
                titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              PieChartSectionData(
                color: Colors.blue,
                value: 30,
                title: '30%',
                radius: 50,
                titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              PieChartSectionData(
                color: Colors.green,
                value: 20,
                title: '20%',
                radius: 50,
                titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              PieChartSectionData(
                color: Colors.yellow,
                value: 10,
                title: '10%',
                radius: 50,
                titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
