import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6E9),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                      'assets/logo_1.png'), // Add your profile picture here
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'john.doe@example.com',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                // Add functionality for Add Card or UPI
              },
              icon: Icon(Icons.credit_card),
              label: Text('Add Card or UPI'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60), // Increased height
                textStyle: TextStyle(fontSize: 18), // Increased font size
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Add functionality for Settings
              },
              icon: Icon(Icons.settings),
              label: Text('Settings'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60), // Increased height
                textStyle: TextStyle(fontSize: 18), // Increased font size
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Add functionality for Export Data
              },
              icon: Icon(Icons.cloud_download),
              label: Text('Export Data'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60), // Increased height
                textStyle: TextStyle(fontSize: 18), // Increased font size
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed('/splash');
              },
              icon: Icon(Icons.logout),
              label: Text('Logout'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60), // Increased height
                textStyle: TextStyle(fontSize: 18), // Increased font size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
