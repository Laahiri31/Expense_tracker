import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expense_tracker/widgets/app_button_widget.dart';
import 'package:expense_tracker/widgets/app_input_text_field.dart';
import 'package:expense_tracker/widgets/googleSignup.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _Numbercontroller = TextEditingController();
  TextEditingController _Mailcontroller = TextEditingController();
  TextEditingController _Passwordcontroller = TextEditingController();

  String _selectedGender = 'Male'; // Default selection

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
            AppInputTextFieldWidget(
              controller: _namecontroller,
              hintText: 'User Name',
              obscureText: false,
              prefixIcon: Icons.person,
              inputFormatters: [
                FilteringTextInputFormatter.singleLineFormatter,
                FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-Z0-9_ ]'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            AppInputTextFieldWidget(
              controller: _Numbercontroller,
              hintText: 'Phone no.',
              obscureText: false,
              prefixIcon: Icons.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
            ),
            const SizedBox(height: 20),
            AppInputTextFieldWidget(
              controller: _Mailcontroller,
              hintText: 'Email ID',
              obscureText: false,
              prefixIcon: Icons.email,
              inputFormatters: [
                FilteringTextInputFormatter.singleLineFormatter,
                FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-Z0-9@._-]'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            AppInputTextFieldWidget(
              controller: _Passwordcontroller,
              hintText: 'Password',
              obscureText: true,
              prefixIcon: Icons.lock,
            ),
            const SizedBox(height: 20),
            const Text(
              'Gender',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
            ),
            const SizedBox(height: 5),
            DropdownButton<String>(
              value: _selectedGender,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedGender = newValue!;
                });
              },
              items: <String>['Male', 'Female', 'Other']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "------------------------------------Sign up with Google------------------------------------",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
              ),
            ),
            const SizedBox(height: 20),
            GoogleSignUpButton(
              onPressed: () {
                print('Google sign-up pressed');
              },
            ),
            const SizedBox(height: 20),
            AppbuttonWidget(
               onPressed: () {
                  Navigator.of(context).pushNamed('/homescreen');
                },
              title: "Sign Up",
              titleColor: Color(0xFFF6F6E9),
                backgroundColor: Color.fromARGB(255, 59, 59, 57),
                borderColor: Colors.black,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/signin');
              },
              child: RichText(
                text: const TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign in',
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
      home: SignUp(),
    ),
  );
}
