import 'package:flutter/material.dart';
import 'package:hours_keeper/components/theme.dart';

class StatusTag extends StatelessWidget {
  final String status;
  const StatusTag ({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 87,
        height: 18,
        // margin: EdgeInsets.symmetric(horizontal: 100),
        decoration: BoxDecoration(

            color: status == 'Em andamento' ? themes.colorScheme.tertiary : Color.fromRGBO(182, 108, 108, 1),
            borderRadius: BorderRadius.circular(9)),

        child: Center(
          child: Text(status, style: TextStyle(color: themes.colorScheme.inversePrimary, fontSize: 10, fontWeight: FontWeight.bold)
          ),
        )
      );
  }
}