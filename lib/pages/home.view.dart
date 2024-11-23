import 'package:flutter/material.dart';
import 'package:hours_keeper/components/drawer.dart';
import 'package:hours_keeper/components/theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: themes.colorScheme.primary,
      ),
      drawer: MyDrawer(),
      body: const Center(
        child: Text('Hours Keeper'),
      ),
    );
  }
}