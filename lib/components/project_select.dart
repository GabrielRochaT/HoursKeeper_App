import 'package:flutter/material.dart';
import 'package:hours_keeper/components/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hours_keeper/utils/projects_service.dart';

class ProjectDropdown extends StatefulWidget {
  final Function(String id, String title) onChanged;

  const ProjectDropdown({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<ProjectDropdown> createState() => _ProjectDropdownState();
}

class _ProjectDropdownState extends State<ProjectDropdown> {
  String? selectedProjectId;
  String? selectedProjectTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: ProjectService().getProjects(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return const Text('Erro ao carregar projetos');
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Text('Nenhum projeto disponível');
              }

              final projects = snapshot.data!.docs
                  .where((doc) => doc.data()['status'] != 'Concluído')
                  .map((doc) {
                return {
                  "id": doc.id, // Usando o ID do documento
                  "title": doc.data()['title'] as String,
                };
              }).toList();

              return Container(
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
                  value: selectedProjectId,
                  isExpanded: true,
                  underline: const SizedBox(), // Remove a linha padrão
                  items: projects.map((project) {
                    return DropdownMenuItem<String>(
                      value: project['id'], // ID como valor
                      child: Text(project['title']!), // Exibe o título
                      onTap: () {
                        // Salva o título selecionado
                        selectedProjectTitle = project['title'];
                      },
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedProjectId = value;
                    });
                    widget.onChanged(value!, selectedProjectTitle!);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
