import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';
import 'package:expense_tracker/widgets/app_input_text_field.dart';

class Stats extends StatefulWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  TextEditingController _expenseController = TextEditingController();
  TextEditingController _incomeController = TextEditingController();
  bool _showPieChart = true;
  List<PieChartSectionData> _pieChartSections = []; // List to hold pie chart sections
  LineChartData _lineChartData = LineChartData(); // Line chart data object

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Pie Chart'),
                Switch(
                  value: _showPieChart,
                  onChanged: (value) {
                    setState(() {
                      _showPieChart = value;
                    });
                  },
                ),
                Text('Line Graph'),
              ],
            ),
            SizedBox(height: 16.0),
            AppInputTextFieldWidget(
              controller: _expenseController,
              hintText: 'Enter Daily Expenses',
              obscureText: false,
              prefixIcon: Icons.money_off,
            ),
            SizedBox(height: 16.0),
            AppInputTextFieldWidget(
              controller: _incomeController,
              hintText: 'Enter Daily Income',
              obscureText: false,
              prefixIcon: Icons.attach_money,
            ),
            SizedBox(height: 16.0),
            AppButtonWidget(
              onPressed: () {
                // Handle button press to generate charts
                String expenseText = _expenseController.text;
                String incomeText = _incomeController.text;

                double expenses = double.tryParse(expenseText) ?? 0.0;
                double income = double.tryParse(incomeText) ?? 0.0;

                // Generate charts based on _showPieChart value
                if (_showPieChart) {
                  _generatePieChart(expenses, income);
                } else {
                  _generateLineGraph(expenses, income);
                }
              },
              title: 'Generate Charts',
              titleColor: Colors.white,
              backgroundColor: Colors.blue,
              borderColor: Colors.blue,
            ),
            SizedBox(height: 16.0),
            // Display the pie chart or line graph based on _showPieChart
            _showPieChart ? _buildPieChart() : _buildLineGraph(),
          ],
        ),
      ),
    );
  }

  void _generatePieChart(double expenses, double income) {
    // Calculate total
    double total = expenses + income;

    // Calculate percentages
    double expensesPercentage = (expenses / total) * 100;
    double incomePercentage = (income / total) * 100;

    // Update pie chart sections
    _pieChartSections = [
      PieChartSectionData(
        color: Colors.red,
        value: expensesPercentage,
        title: '${expensesPercentage.toStringAsFixed(1)}%',
        radius: 50,
        titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.blue,
        value: incomePercentage,
        title: '${incomePercentage.toStringAsFixed(1)}%',
        radius: 50,
        titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ];

    setState(() {
      _pieChartSections = _pieChartSections;
    });
  }

  void _generateLineGraph(double expenses, double income) {
    // Prepare line chart data
    List<FlSpot> spots = [
      FlSpot(0, income),
      FlSpot(1, expenses),
    ];

    _lineChartData = LineChartData(
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(showTitles: true, reservedSize: 22, getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return 'Income';
            case 1:
              return 'Expenses';
            default:
              return '';
          }
        }),
        leftTitles: SideTitles(showTitles: true, reservedSize: 28, getTitles: (value) {
          return '${value.toInt()}K';
        }),
      ),
      borderData: FlBorderData(show: true, border: Border.all(color: Colors.blue)),
      gridData: FlGridData(show: true),
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          colors: [Colors.blue],
          barWidth: 8,
          isStrokeCapRound: true,
          belowBarData: BarAreaData(show: false),
        ),
      ],
    );

    setState(() {
      _lineChartData = _lineChartData;
    });
  }

  Widget _buildPieChart() {
    return Center(
      child: PieChart(
        PieChartData(
          sections: _pieChartSections,
        ),
      ),
    );
  }

  Widget _buildLineGraph() {
    return AspectRatio(
      aspectRatio: 1.70,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: Colors.white,
        ),
        child: LineChart(
          _lineChartData,
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
