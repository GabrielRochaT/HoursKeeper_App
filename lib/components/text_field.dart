import 'package:flutter/material.dart';
import 'package:hours_keeper/components/theme.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final Icon icon;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.obscureText,
      required this.hintText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextField(
            controller: controller,
            obscureText: obscureText,
            cursorColor: themes.colorScheme.tertiary,
            decoration: InputDecoration(
              prefixIcon: icon,
              focusColor: themes.colorScheme.tertiary,
              filled: true,
              fillColor: themes.colorScheme.inversePrimary,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: themes.colorScheme.tertiary, width: 3)),
              
              hintText: hintText,
              hintStyle: TextStyle(
                  color: themes.colorScheme.tertiary, fontFamily: 'Lato'),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: themes.colorScheme.tertiary, width: 3),
              ),
            )));
  }
}
