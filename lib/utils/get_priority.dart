import 'package:flutter/material.dart';

class GetPriority extends StatefulWidget {
  const GetPriority({super.key, required this.priority});
  final String priority;

  @override
  State<GetPriority> createState() => _GetPriorityState();
}

class _GetPriorityState extends State<GetPriority> {
  @override
  Widget build(BuildContext context) {
    if (widget.priority == 'Alta') {
      return Icon(Icons.circle, size: 8, color: Color.fromRGBO(182, 108, 108, 1) );
    } else if (widget.priority == 'Média') {
      return Icon(Icons.circle, size: 8, color: Color.fromRGBO(255, 192, 56, 1) );
    } else {
      return Icon(Icons.circle, size: 8, color: Color.fromRGBO(133, 153, 255, 1) );
    }
  }
}
