import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medicore"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Add your cart functionality here
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).pushNamed('/splash');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Place your order\nSelect pharmacy\nReceive it",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Categories Text
            Text(
              "Categories",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            // Categories
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                buildClickableCategoryBox(
                  "Mom & Baby",
                  Icons.family_restroom,
                  Color(0xFF2879FF),
                  '/mom_and_baby',
                  context,
                ),
                buildClickableCategoryBox(
                  "Fighting the infection",
                  Icons.healing,
                  Color(0xFF3CB5B7),
                  '/fighting_infection',
                  context,
                ),
                buildClickableCategoryBox(
                  "Diabetes",
                  Icons.favorite,
                  Color(0xFFF6529F),
                  '/diabetes',
                  context,
                ),
                buildClickableCategoryBox(
                  "Antibiotics",
                  Icons.medical_services,
                  Color(0xFFFE8B8A),
                  '/antibiotics',
                  context,
                ),
                buildClickableCategoryBox(
                  "Drugs",
                  Icons.local_hospital,
                  Color(0xFFFF9253),
                  '/drugs',
                  context,
                ),
                buildClickableCategoryBox(
                  "Women",
                  Icons.female_outlined,
                  Color(0xFF7879F1),
                  '/women',
                  context,
                ),
                buildClickableCategoryBox(
                  "Cosmetic",
                  Icons.face,
                  Color(0xFF2879FF),
                  '/cosmetic',
                  context,
                ),
                buildClickableCategoryBox(
                  "Men",
                  Icons.male_outlined,
                  Color(0xFFFEC033),
                  '/men',
                  context,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
 int _calculateCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return (screenWidth / 150).floor();
  }
  Widget buildClickableCategoryBox(
    String title,
    IconData icon,
    Color color,
    String route,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          width: 120,
          height: 100,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40.0, color: Colors.white),
              SizedBox(height: 10.0),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void main() {
    runApp(
      MaterialApp(
        home: HomeScreen(),
        // Define routes for each category page
        routes: {
        },
      ),
    );
  }
}
