import 'package:flutter/material.dart';
import 'package:hours_keeper/components/theme.dart';

class MyTile extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Function()? onTap;

  const MyTile({super.key, required this.title, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: themes.colorScheme.inversePrimary,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Icon(icon, color: themes.colorScheme.inversePrimary,),
      onTap: onTap,
    );
  }
}