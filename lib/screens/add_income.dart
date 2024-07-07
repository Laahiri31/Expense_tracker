import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Income Entry',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: IncomeEntryScreen(),
    );
  }
}

class IncomeEntryScreen extends StatefulWidget {
  @override
  _IncomeEntryScreenState createState() => _IncomeEntryScreenState();
}

class _IncomeEntryScreenState extends State<IncomeEntryScreen> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String selectedCategory = 'Select Category';
  String selectedWallet = 'Select Wallet';
  bool repeatTransaction = false;

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
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text("Go to Home Screen"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  amountController.clear();
                  descriptionController.clear();
                  selectedCategory = 'Select Category';
                  selectedWallet = 'Select Wallet';
                  repeatTransaction = false;
                });
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
      appBar: AppBar(
        title: Text('Income Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.center,
              color: Colors.greenAccent,
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
              items: <String>['Select Category', 'Salary', 'Freelance', 'Investments', 'Other']
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
                primary: const Color.fromARGB(255, 144, 238, 144),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
