import 'package:flutter/material.dart';

class PriorityTag extends StatelessWidget {
  final String priority;

  const PriorityTag({super.key, required this.priority});

  Color priorityColor(prioriry) {
    if (priority == 'Alta') {
      return Color.fromRGBO(182, 108, 108, 1);
    } else if (priority == 'Média') {
      return Color.fromRGBO(255, 192, 56, 1);
    } else {
      return Color.fromRGBO(133, 153, 255, 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 87,
        height: 18,
        // margin: EdgeInsets.symmetric(horizontal: 100),
        decoration: BoxDecoration(
            border: Border.all(color: priorityColor(priority)),
            borderRadius: BorderRadius.circular(9)),

        child: Center(
          child: Text(priority, style: TextStyle(color: priorityColor(priority), fontSize: 10, fontWeight: FontWeight.bold)
          ),
        )
      );
  }
}