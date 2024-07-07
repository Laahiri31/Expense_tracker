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
      backgroundColor:Color(0xFFF6F6E9),
      
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             // Add space between the text and the first text field
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
            const SizedBox(
                height: 15), // Add space between the Google button and the text

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "------------------------------------Sign in with Google------------------------------------",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
              ),
            ),
            const SizedBox(
                height:
                    20),
            GoogleSignUpButton(
              onPressed: () {
                print('Google sign-in pressed');
              },
            ),
            
            const SizedBox(
                height:
                    20),
             
            const SizedBox(height: 20),
             AppbuttonWidget(
              onPressed: () {
                  Navigator.of(context).pushNamed('/homescreen');
                },
              title: "Sign in",
              titleColor: Color(0xFFF6F6E9),
                backgroundColor: Color.fromARGB(255, 59, 59, 57),
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
                        color: Color.fromARGB(255, 59, 59, 57),
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