import 'package:flutter/material.dart';

class NavBarRoots extends StatefulWidget {
  @override
  State<NavBarRoots> createState() => _NavBarRoots();
}

class _NavBarRoots extends State<NavBarRoots> {
  int _selectedIndex = 0;
  final _screens = [
    Container(),
    Container(),
    Container()
  ];

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
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.science_outlined),
              label: "Tests",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital_outlined),
              label: "Care",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.percent_outlined),
              label: "Offers",
            ),
            BottomNavigationBarItem(
              icon: Icon( Icons.account_circle),
              label: "Account",
            ),
          ],
        ),
      ),
    );
  }
}
