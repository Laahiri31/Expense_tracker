import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Edit Profile Picture'),
            onTap: () {
              // Navigate to edit profile picture page or handle the action
            },
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Edit Gmail Address'),
            onTap: () {
              // Navigate to edit Gmail address page or handle the action
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Add Banks'),
            onTap: () {
              // Navigate to add banks page or handle the action
            },
          ),
          SizedBox(height: 20), // Add some space before the version text
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Version 1.0.0',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
void main() {
  runApp(
     MaterialApp(
      home: SettingsPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}