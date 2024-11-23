import 'package:flutter/material.dart';
import 'package:hours_keeper/components/drawer.dart';
import 'package:hours_keeper/components/theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themes.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: themes.colorScheme.primary,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Image.asset('lib/assets/images/logo_white.png', height: 50, width: 50,),
        ),
      ),
      drawer: MyDrawer(),
      body: const Center(
        child: Text('Hours Keeper'),
      ),
    );
  }
}