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

  @override
  void dispose() {
    _expenseController.dispose();
    _incomeController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Stats(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class LineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = [
      TimeSeriesTransaction(DateTime(2024, 7, 1), 1000),
      TimeSeriesTransaction(DateTime(2024, 7, 2), 500),
      TimeSeriesTransaction(DateTime(2024, 7, 3), 800),
      TimeSeriesTransaction(DateTime(2024, 7, 4), 300),
      TimeSeriesTransaction(DateTime(2024, 7, 5), 700),
    ];

    var series = [
      charts.Series<TimeSeriesTransaction, DateTime>(
        id: 'Transactions',
        domainFn: (TimeSeriesTransaction transaction, _) => transaction.time,
        measureFn: (TimeSeriesTransaction transaction, _) => transaction.amount,
        data: data,
      )
    ];

    return charts.TimeSeriesChart(
      series,
      animate: true,
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }
}

class Transaction {
  final String type;
  final int amount;

  Transaction(this.type, this.amount);
}

class TimeSeriesTransaction {
  final DateTime time;
  final int amount;

  TimeSeriesTransaction(this.time, this.amount);
}

void main() {
  runApp(
     MaterialApp(
      home: StatsPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}