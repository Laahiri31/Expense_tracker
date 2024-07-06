import 'package:flutter/material.dart';

class GoogleSignUpButton extends StatelessWidget {
  final Function onPressed;

  GoogleSignUpButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
                  Navigator.of(context).pushNamed('/homescreen');
                },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, backgroundColor: Colors.white, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: Color(0xFF1C3146), // Set border color here
          ),
        ),
        fixedSize: Size(350, 48), // Set width and height
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "images/google_logo.png", // Replace with the path to your Google logo image
            height: 24,
            width: 24,
          ),
          SizedBox(width: 10), // Add space between the logo and text
          Text(
            'Sign up with Google',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: GoogleSignUpButton(
            onPressed: () {
              // Handle the button press
              print('Google sign-up pressed');
            },
          ),
        ),
      ),
    ),
  );
}
