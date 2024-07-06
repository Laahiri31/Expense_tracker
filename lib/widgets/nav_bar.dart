import 'package:flutter/material.dart';

class NavBarRoots extends StatefulWidget {
  @override
  State<NavBarRoots> createState() => _NavBarRoots();
}

class _NavBarRoots extends State<NavBarRoots> {
  int _selectedIndex = 0;
  final _screens = [
    Container(), // Home Screen
    Container(), // Payments Screen
    Container(), // Add Screen
    Container(), // Stats Screen
    Container(), // Profile Screen
  ];

  void _onItemTapped(int index) {
    // Add your custom functionality for each tab here
    switch (index) {
      case 0:
        // Perform action for Home
        break;
      case 1:
        // Perform action for Payments
        break;
      case 2:
        // Perform action for Add
        break;
      case 3:
        // Perform action for Stats
        break;
      case 4:
        // Perform action for Profile
        break;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBFCFFE),
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF2879FF),
          unselectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payments_rounded),
              label: "payments",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle, size: 48.0),
              label: "add",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart),
              label: "stats",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "profile",
            ),
          ],
        ),
      ),
    );
  }
}
