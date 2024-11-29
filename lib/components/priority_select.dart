import 'package:flutter/material.dart';
import 'package:hours_keeper/components/theme.dart';

class PriorityDropdown extends StatefulWidget {
  final Function(String) onChanged;
  final String? value;

  const PriorityDropdown({Key? key, required this.onChanged, this.value}) : super(key: key);

  @override
  State<PriorityDropdown> createState() => _PriorityDropdownState();
}

class _PriorityDropdownState extends State<PriorityDropdown> {
  final List<String> priorities = ["Baixa", "Média", "Alta"];
  String? selectedPriority;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: themes.colorScheme.inversePrimary,
              border: Border.all(
                color: themes.colorScheme.tertiary,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButton<String>(
              value: widget.value != null ? widget.value : selectedPriority,
              isExpanded: true,
              underline: const SizedBox(),
              items: priorities.map((priority) {
                return DropdownMenuItem<String>(
                  value: priority,
                  child: Text(priority),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedPriority = value;
                });
                widget.onChanged(value!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
