import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense or Income Entry',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExpenseIncomeEntryScreen(),
    );
  }
}

class ExpenseIncomeEntryScreen extends StatefulWidget {
  @override
  _ExpenseIncomeEntryScreenState createState() => _ExpenseIncomeEntryScreenState();
}

class _ExpenseIncomeEntryScreenState extends State<ExpenseIncomeEntryScreen> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String selectedCategory = 'Select Category';
  String selectedWallet = 'Select Wallet';
  bool repeatTransaction = false;
  bool isIncome = false;

  void _submitForm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Submit another form?"),
          content: Text("Do you want to fill another form or go back to the home screen?"),
          actions: [
            TextButton(
              onPressed: () {
                  Navigator.of(context).pushNamed('/homescreen');
              },
              child: Text("Go to Home Screen"),
            ),
            TextButton(
              onPressed: () {
                  Navigator.of(context).pushNamed('/expense');
              },
              child: Text("Fill Another Form"),
            ),
            
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor:Color(0xFFF6F6E9),
      appBar: AppBar(
      backgroundColor:Color.fromARGB(255, 235, 235, 213),
        title: Text('Expense or Income'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Switch mode'),
              value: isIncome,
              onChanged: (bool value) {
                setState(() {
                  isIncome = value;
                });
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isIncome ? Colors.greenAccent : Colors.redAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'Enter Amount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: TextField(
                          controller: amountController,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '0',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedCategory,
              items: <String>['Select Category', 'Food', 'Transport', 'Shopping', 'Utilities']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
              },
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            DropdownButton<String>(
              value: selectedWallet,
              items: <String>['Select Wallet', 'Cash', 'Bank', 'Credit Card']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedWallet = newValue!;
                });
              },
            ),
            SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.attachment),
                  onPressed: () {
                    // Implement attachment functionality
                  },
                ),
                Text('Add attachment'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Repeat transaction'),
                Switch(
                  value: repeatTransaction,
                  onChanged: (bool value) {
                    setState(() {
                      repeatTransaction = value;
                    });
                  },
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Continue'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 212, 157, 222),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(
                  fontSize: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
