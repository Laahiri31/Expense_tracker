import 'package:expense_tracker/screens/profile.dart';
import 'package:expense_tracker/screens/stats.dart';
import 'package:expense_tracker/screens/transactions.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/screens/sign_up.dart';
import 'package:expense_tracker/screens/splash.dart';
import 'package:expense_tracker/screens/sign_in.dart';
import 'package:expense_tracker/screens/forgot_password.dart';
import 'package:expense_tracker/widgets/nav_bar.dart';
import 'package:expense_tracker/screens/home_screen.dart';
import 'package:expense_tracker/screens/notification.dart';
import 'package:expense_tracker/screens/settings.dart';
import 'package:expense_tracker/screens/view_report.dart';
import 'package:expense_tracker/screens/expense.dart';


//Test
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/splash' :(context) => const Splash(),
        '/signup' :(context) => const SignUp(),
        '/signin' :(context) => const SignIn(),
        '/forgotpassword' :(context) => const ForgotPassword(),
        '/navbar' :(context) => NavBarRoots(),
        '/homescreen' :(context) => HomeScreen(),
        '/transactions':(context) => TransactionsPage(),
        '/notifications':(context) => NotificationsPage(),
        '/profile': (context) => UserProfile(),
        '/settings': (context) => SettingsPage(),
        '/stats': (context) => StatsPage(),
        '/cashbook':(context) => PettyCashBook(),
        '/expense' :(context) => ExpenseIncomeEntryScreen()
      },
      initialRoute: '/splash',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
