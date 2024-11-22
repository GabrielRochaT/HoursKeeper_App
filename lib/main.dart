import 'package:flutter/material.dart';
import 'package:hours_keeper/auth/login_register.dart';
// import 'package:hours_keeper/pages/login.view.dart';
// import 'package:hours_keeper/pages/register.view.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hours Keeper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginRegister()
    );
  }
}



