import 'package:flutter/material.dart';
import 'package:hours_keeper/components/theme.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.text, this.onTap});
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 70),
        decoration: BoxDecoration(
            color: themes.colorScheme.tertiary,
            borderRadius: BorderRadius.circular(9)),

        child: Center(
            child: Text(text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Lato',
                    color: themes.colorScheme.inversePrimary))),
      ),
    );
  }
}
