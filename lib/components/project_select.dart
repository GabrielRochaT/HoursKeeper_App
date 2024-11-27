import 'package:flutter/material.dart';
import 'package:hours_keeper/components/theme.dart';

class ProjectDropdown extends StatefulWidget {
  final Function(String) onChanged;

  const ProjectDropdown({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<ProjectDropdown> createState() => _ProjectDropdownState();
}

class _ProjectDropdownState extends State<ProjectDropdown> {
  final List<String> projects = ["Projeto 1", "Projeto 2", "Projeto 3"];
  String? selectedProject;

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
              value: selectedProject,
              isExpanded: true,
              underline: const SizedBox(), // Remove a linha padrão do Dropdown
              items: projects.map((project) {
                return DropdownMenuItem<String>(
                  value: project,
                  child: Text(project),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedProject = value;
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
