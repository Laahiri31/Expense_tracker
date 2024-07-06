import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedMonthIndex = DateTime.now().month; // Default to current month

  // Example data for line chart (replace with actual data)
  List<FlSpot> _lineChartData = [
    FlSpot(0, 100),
    FlSpot(1, 150),
    FlSpot(2, 75),
    FlSpot(3, 200),
    FlSpot(4, 120),
    FlSpot(5, 180),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFF6F6E9),
      appBar: AppBar(
      backgroundColor:Color.fromARGB(255, 235, 235, 213),
        title: Row(
          children: [
            Image.asset(
              'images/logof.png',
              height: 30, // Adjust height as needed
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).pushNamed('/settings');
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
                  Navigator.of(context).pushNamed('/notifications');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16.0),
            // Month Selector
            Container(
              height: 50.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 12,
                itemBuilder: (BuildContext context, int index) {
                  String monthName = _getMonthName(
                      index + 1); // Adjust index to match your month logic
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedMonthIndex = index + 1;
                      });
                      // Call method to update line chart based on selected month
                      _updateLineChart();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: _selectedMonthIndex == index + 1
                            ? Theme.of(context).primaryColor.withOpacity(0.3)
                            : Colors.transparent,
                      ),
                      child: Text(
                        monthName,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            // Financial Report Line Chart
            Container(
              height: 300.0,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: const Color.fromARGB(255, 108, 103, 103)),
                
              ),
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: _lineChartData,
                      isCurved: true,
                      colors: [
              Color.fromARGB(255, 151, 151, 146),],
                      barWidth: 4,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                  minY: 0,
                  titlesData: FlTitlesData(
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTitles: (value) {
                        // Replace with actual labels as needed
                        switch (value.toInt()) {
                          case 0:
                            return 'W 1';
                          case 1:
                            return 'W 2';
                          case 2:
                            return 'W 3';
                          case 3:
                            return 'W 4';
                          case 4:
                            return 'W 5';
                          default:
                            return '';
                        }
                      },
                    ),
                    leftTitles: SideTitles(showTitles: true),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.grey[300]!, width: 1),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Recent Transactions
            Text(
              "Recent Transactions",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            buildRecentTransactionItem(
              "Entertainment",
              Icons.wifi,
              "Internet Bill",
              "-\₹1300",
              context,
            ),
            buildRecentTransactionItem(
              "Receipt 101",
              Icons.real_estate_agent_outlined,
              "tenants rent",
              "+\₹5000",
              context,
            ),
            buildRecentTransactionItem(
              "Receipt 102",
              Icons.real_estate_agent_outlined,
              "tenants rent",
              "+\₹5000",
              context,
            ),
            buildRecentTransactionItem(
              "Communication",
              Icons.phone_enabled_outlined,
              "Idea Bill",
              "-\₹350",
              context,
            ),
            buildRecentTransactionItem(
              "Petrol",
              Icons.local_gas_station_sharp,
              "Car Fuel",
              "-\₹1200",
              context,
            ),
            buildRecentTransactionItem(
              "Receipt 103",
              Icons.attach_money,
              "----",
              "+\₹1000",
              context,
            ),
            // Add more recent transactions as needed
            SizedBox(height: 16.0),
            // See All Button
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/transactions');
              },
              child: Text(
                "See All",
                style: TextStyle(
      backgroundColor:Color(0xFFF6F6E9),
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).pushNamed('/homescreen');
              },
            ),
            IconButton(
              icon: Icon(Icons.payments_rounded),
              onPressed: () {
                Navigator.of(context).pushNamed('/transactions');
              },
            ),
            IconButton(
              icon: Icon(Icons.add_circle, size: 48.0), // Larger icon
              onPressed: () {
                Navigator.of(context).pushNamed('/expense');
              },
            ),
            IconButton(
              icon: Icon(Icons.insert_chart),
              onPressed: () {
                Navigator.pushNamed(context, '/stats');
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRecentTransactionItem(
    String name,
    IconData icon,
    String reason,
    String amount,
    BuildContext context,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(width: 12.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text(reason),
            ],
          ),
          Spacer(),
          Text(
            amount,
            style: TextStyle(
              color: amount.startsWith('-') ? Colors.red : Colors.green,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String _getMonthName(int monthIndex) {
    switch (monthIndex) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  void _updateLineChart() {
    // Replace with logic to update line chart based on _selectedMonthIndex
    // For example, fetch data for selected month and update _lineChartData
    setState(() {
      // Example data update, replace with actual data fetch logic
      _lineChartData = [
        FlSpot(0, 80),
        FlSpot(1, 120),
        FlSpot(2, 50),
        FlSpot(3, 180),
        FlSpot(4, 100),
        FlSpot(5, 150),
      ];
    });
  }
}

void main() {
  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}
