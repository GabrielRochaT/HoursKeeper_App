import 'package:flutter/material.dart';
import 'package:hours_keeper/components/theme.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final String? Function(String?)? validator;
  final IconData? icon;
  final int? maxLines;
  final int? maxLenght;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.obscureText,
      required this.hintText,
      this.icon, this.validator, this.maxLines, this.maxLenght});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
            validator: validator,
            controller: controller,
            obscureText: obscureText,
            cursorColor: themes.colorScheme.tertiary,
            maxLines: maxLines,
            maxLength: maxLenght,
            decoration: InputDecoration(
              prefixIcon: icon != null ? Icon(icon, color: themes.colorScheme.tertiary) : null,
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

              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Color.fromRGBO(182, 108, 108, 1), width: 3),
              ),

              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Color.fromRGBO(182, 108, 108, 1), width: 3),
              ),
            )));
  }
}
