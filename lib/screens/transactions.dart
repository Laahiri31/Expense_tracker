import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Master App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TransactionsPage(),
    );
  }
}

class TransactionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFF6F6E9),
      appBar: AppBar(
        title: Text('Transactions'),
        backgroundColor:Color.fromARGB(255, 235, 235, 213),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Bar with Month Selector and Filter Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  hint: Text('Select Month'),
                  items: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'] // Replace with actual month data
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // Handle dropdown item selection
                  },
                ),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {
                    // Handle filter icon tap
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Download Financial Report Button
            ElevatedButton(
              onPressed: () {
                  Navigator.of(context).pushNamed('/cashbook');
            },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 130, 92, 197),
                padding: EdgeInsets.symmetric(vertical: 12.0),
              ),
              child: Center(
                child: Text(
                  'View Financial Report',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Expenditure Information Rectangular Boxes
            Expanded(
              child: ListView(
                children: [
                  ExpenditureCard(day: 'Today', amount: '5000', icon: Icons.today),
                  ExpenditureCard(day: 'Yesterday', amount: '4500', icon: Icons.calendar_today),
                  ExpenditureCard(day: 'Last Week', amount: '20000', icon: Icons.event_note),
                  // Add more cards as needed
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom App Bar
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
                // Handle add transaction action
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
}

class ExpenditureCard extends StatelessWidget {
  final String day;
  final String amount;
  final IconData icon;

  const ExpenditureCard({
    Key? key,
    required this.day,
    required this.amount,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon),
        title: Text(day),
        subtitle: Text('Amount: $amount'),
        onTap: () {
          // Handle tap on the card
        },
      ),
    );
  }
}
