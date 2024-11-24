import 'package:flutter/material.dart';
import 'package:hours_keeper/components/status_tag.dart';
import 'package:hours_keeper/components/theme.dart';
import 'package:hours_keeper/utils/get_priority.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final String status;
  final String priority;

  const ProjectCard({super.key, required this.title, required this.status, required this.priority, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 11, bottom: 11),
        width: 341,
        height: 70,
        padding: EdgeInsets.only(top: 26, bottom: 26, left: 16, right: 16),
        decoration: BoxDecoration(
            color: Color.fromRGBO(188, 191, 193, 1),
            borderRadius: BorderRadius.circular(11),),
        child: Row(
          children: [
            GetPriority(priority: priority),
            SizedBox(width: 6,),
            Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: themes.colorScheme.inversePrimary),),
            Spacer(),
            StatusTag(status: status)
          ],
        ),
      ),
    );
  }
}