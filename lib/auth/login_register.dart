import 'package:flutter/material.dart';
import 'package:hours_keeper/pages/login.view.dart';
import 'package:hours_keeper/pages/register.view.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  bool inLogin = true;

  void toggleView(){
    setState(() {
      inLogin = !inLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return inLogin ? LoginView(onTap: toggleView,) : RegisterView(onTap: toggleView,);
  }
}