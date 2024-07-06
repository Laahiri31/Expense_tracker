import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Petty Cash Book',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PettyCashBook(),
    );
  }
}

class PettyCashBook extends StatefulWidget {
  @override
  _PettyCashBookState createState() => _PettyCashBookState();
}

class _PettyCashBookState extends State<PettyCashBook> {
  DateTime selectedDate = DateTime.now();
  final TextEditingController incomeAmountController = TextEditingController();
  final TextEditingController incomeDescriptionController = TextEditingController();
  final TextEditingController expenseAmountController = TextEditingController();
  final TextEditingController expenseDescriptionController = TextEditingController();
  double openingBalance = 10000.0;
  double incomeTotal = 0.0;
  double expenseTotal = 0.0;
  List<Map<String, dynamic>> incomeList = [];
  List<Map<String, dynamic>> expenseList = [];

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  void _addIncome() {
    setState(() {
      incomeList.add({
        'description': incomeDescriptionController.text,
        'amount': double.parse(incomeAmountController.text),
      });
      incomeTotal += double.parse(incomeAmountController.text);
    });
  }

  void _addExpense() {
    setState(() {
      expenseList.add({
        'description': expenseDescriptionController.text,
        'amount': double.parse(expenseAmountController.text),
      });
      expenseTotal += double.parse(expenseAmountController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Petty Cash Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${selectedDate.toLocal()}".split(' ')[0]),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select date'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      TextField(
                        controller: incomeAmountController,
                        decoration: InputDecoration(labelText: 'Income Amount'),
                        keyboardType: TextInputType.number,
                      ),
                      TextField(
                        controller: incomeDescriptionController,
                        decoration: InputDecoration(labelText: 'Description'),
                      ),
                      ElevatedButton(
                        onPressed: _addIncome,
                        child: Text('Submit Income'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      TextField(
                        controller: expenseAmountController,
                        decoration: InputDecoration(labelText: 'Expense Amount'),
                        keyboardType: TextInputType.number,
                      ),
                      TextField(
                        controller: expenseDescriptionController,
                        decoration: InputDecoration(labelText: 'Description'),
                      ),
                      ElevatedButton(
                        onPressed: _addExpense,
                        child: Text('Submit Expense'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DataTable(
                      columns: [
                        DataColumn(label: Text('Date')),
                        DataColumn(label: Text('Description')),
                        DataColumn(label: Text('Amount')),
                      ],
                      rows: incomeList
                          .map(
                            (income) => DataRow(cells: [
                              DataCell(Text(selectedDate.toLocal().toString().split(' ')[0])),
                              DataCell(Text(income['description'])),
                              DataCell(Text(income['amount'].toString())),
                            ]),
                          )
                          .toList(),
                    ),
                    DataTable(
                      columns: [
                        DataColumn(label: Text('Date')),
                        DataColumn(label: Text('Description')),
                        DataColumn(label: Text('Amount')),
                      ],
                      rows: expenseList
                          .map(
                            (expense) => DataRow(cells: [
                              DataCell(Text(selectedDate.toLocal().toString().split(' ')[0])),
                              DataCell(Text(expense['description'])),
                              DataCell(Text(expense['amount'].toString())),
                            ]),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            Text('Income Total: $incomeTotal'),
            Text('Expense Total: $expenseTotal'),
            Text('Closing Balance: ${openingBalance + incomeTotal - expenseTotal}'),
          ],
        ),
      ),
    );
  }
}

