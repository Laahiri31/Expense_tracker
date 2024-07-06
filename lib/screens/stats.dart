import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  bool showPieChart = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFF6F6E9),
      appBar: AppBar(
      backgroundColor:Color.fromARGB(255, 235, 235, 213),
        title: Text('Transaction Statistics'),
       leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showPieChart = true;
                  });
                },
                child: Text('Show Pie Chart'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showPieChart = false;
                  });
                },
                child: Text('Show Trends'),
              ),
            ],
          ),
          Expanded(
            child: showPieChart ? PieChart() : LineChart(),
          ),
        ],
      ),
    );
  }
}

class PieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = [
      Transaction('Received', 1000),
      Transaction('Sent', 200),
      Transaction('savings', 500),
    ];

    var series = [
      charts.Series(
        id: 'Transactions',
        domainFn: (Transaction transaction, _) => transaction.type,
        measureFn: (Transaction transaction, _) => transaction.amount,
        data: data,
        labelAccessorFn: (Transaction row, _) => '₹{row.type}: \$₹{row.amount}',
      )
    ];

    return charts.PieChart<String>(
      series,
      animate: true,
      defaultRenderer: charts.ArcRendererConfig(
        arcRendererDecorators: [charts.ArcLabelDecorator()],
      ),
    );
  }
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