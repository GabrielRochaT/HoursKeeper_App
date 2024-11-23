import 'package:flutter/material.dart';
import 'package:hours_keeper/components/theme.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.text, this.onTap});
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 8, bottom: 8, left: 29, right: 29),
        decoration: BoxDecoration(
            color: themes.colorScheme.secondary,
            borderRadius: BorderRadius.circular(11)),

        child: Center(
            child: Text(text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Lato',
                    color: themes.colorScheme.inversePrimary))),
      ),
    );
  }
}
