import 'package:flutter/material.dart';
import 'package:hours_keeper/components/theme.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: themes.colorScheme.primary,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Image.asset('lib/assets/images/logo_white.png', height: 50, width: 50 ),
          ),
        ],
      ),
    );
  }
}