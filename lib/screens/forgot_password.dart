import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:expense_tracker/widgets/app_input_text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _SignUpState();
}

class _SignUpState extends State<ForgotPassword> {
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _mailcontroller = TextEditingController();
  TextEditingController _OTPcontroller = TextEditingController();
  TextEditingController _Passwordcontroller = TextEditingController();
  TextEditingController _RePasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          child: Text(
            "Forgot Password",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color:
                  Color.fromARGB(201, 0, 0, 0), // Set your desired text color
              fontFamily: 'Roboto', // Set your desired font family
              letterSpacing: 1.2, // Adjust letter// Set underline thickness
            ),
          ), // Centered app title
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamed('/signin');
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
            const SizedBox(height: 20),
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
              controller: _mailcontroller,
              hintText: 'Email/number',
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
              controller: _OTPcontroller,
              hintText: 'Enter 4-digit OTP',
              obscureText: true,
              prefixIcon: Icons.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
              ],
            ),
            const SizedBox(height: 20),
            AppInputTextFieldWidget(
              controller: _Passwordcontroller,
              hintText: 'Enter new Password',
              obscureText: true,
              prefixIcon: Icons.lock,
            ),
            const SizedBox(height: 20),
            AppInputTextFieldWidget(
              controller: _RePasswordcontroller,
              hintText: 'Re-Enter new Password',
              obscureText: true,
              prefixIcon: Icons.lock,
            ),
            const SizedBox(height: 20),
            AppButtonWidget(
              onPressed: () {
                Navigator.of(context).pushNamed('/signin');
              },
              title: "submit",
              titleColor: const Color(0xFF1C3146),
              backgroundColor: const Color(0xFFFEC107),
              borderColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
