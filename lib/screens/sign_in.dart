import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expense_tracker/widgets/app_button_widget.dart';
import 'package:expense_tracker/widgets/app_input_text_field.dart';
import 'package:expense_tracker/widgets/googleSignup.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignUpState();
}

class _SignUpState extends State<SignIn> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _Passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Sign In",
        textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                 color: Color.fromARGB(201, 0, 0, 0), // Set your desired text color
                  fontFamily: 'Roboto', // Set your desired font family
                  letterSpacing: 1.2, // Adjust letter// Set underline thickness
                ),
          ), // Centered app title
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
         onPressed: () {
                  Navigator.of(context).pushNamed('/splash');
                },
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GoogleSignUpButton(
              onPressed: () {
                print('Google sign-in pressed');
              },
            ),
            const SizedBox(
                height: 20), // Add space between the Google button and the text

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "--------------------------------------Sign in with Email--------------------------------------",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
              ),
            ),

            const SizedBox(
                height:
                    20), // Add space between the text and the first text field
            AppInputTextFieldWidget(
              controller: _namecontroller,
              hintText: 'User Name',
              obscureText: false,
              prefixIcon: Icons.person,
              inputFormatters: [
                FilteringTextInputFormatter.singleLineFormatter,
                FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-Z0-9@._-]'),
                ),
              ],// Set border color here
           ),
            const SizedBox(
                height:
                    20), // Add space between the third and fourth text fields
            AppInputTextFieldWidget(
              controller: _Passwordcontroller,
              hintText: 'Password',
              obscureText: true,
              prefixIcon: Icons.lock,
               // Set border color here
            ),
             const SizedBox(height: 8), // Add a small gap between the password field and the Forget Password? button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                   Navigator.of(context).pushNamed('/forgotpassword');
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.blue, // Set button text color
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
             AppbuttonWidget(
              onPressed: () {
                  Navigator.of(context).pushNamed('/homescreen');
                },
              title: "Sign in",
              titleColor: const Color(0xFF1C3146),
              backgroundColor: const Color(0xFFFEC107),
              borderColor: Colors.black,
            ),
            const SizedBox(
                height:
                    20), // Add space between the last text field and the sign-in button
            TextButton(
             onPressed: () {
                  Navigator.of(context).pushNamed('/signup');
                },
              child: RichText(
                text: const TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign up',
                      style: TextStyle(
                        color: Color.fromARGB(255, 233, 210, 0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: SignIn(),
    ),
  );
}