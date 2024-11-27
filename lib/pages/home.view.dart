import 'package:flutter/material.dart';
import 'package:hours_keeper/components/action_button.dart';
import 'package:hours_keeper/components/drawer.dart';
import 'package:hours_keeper/components/project_card.dart';
import 'package:hours_keeper/components/theme.dart';
import 'package:hours_keeper/models/project.dart';
import 'package:hours_keeper/pages/create_project.view.dart';
import 'package:hours_keeper/pages/project_details.view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  void navigateToProjectDetails() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ProjectDetailsView()));
  }
  void navigateToAddProject() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateProjectView()));
  }

  
  final ProjectModel project = ProjectModel(
    id: '1',
    title: 'Projeto Novo',
    description: 'Descrição do projeto 1',
    status: 'Em andamento',
    startDate: '01/01/2021',
    endDate: '01/01/2022',
    consumedHours: '10',
    participant: 'Usuário 1',
    priority: 'Média',
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: themes.colorScheme.surface,
        appBar: AppBar(
          backgroundColor: themes.colorScheme.primary,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Image.asset(
              'lib/assets/images/logo_white.png',
              height: 50,
              width: 50,
            ),
          ),
        ),
        drawer: MyDrawer(),
        body: SingleChildScrollView(

          child: Stack(
            children: [
              Align(
                alignment: const Alignment(-1.0, -1.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20),
                  child: Text(
                    'Olá, Usuário!',
                    style: TextStyle(
                        color: themes.colorScheme.tertiary,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(-1.0, -0.8),
                child: Padding(
                  padding: const EdgeInsets.only(top: 100, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                          height: 17), // Espaço entre o texto e os botões
                      Row(
                        children: [
                          ActionButton(text: 'Registrar Horas'),
                          const SizedBox(width: 17),
                          ActionButton(text: 'Novo Projeto', onTap: () {
                            navigateToAddProject();
                          }),
                        ],
                      ),
          
                      Center(
                        child: Column(
                          children: [
                            Align(
                              alignment: const Alignment(-1.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Text(
                                  'Seus Projetos em andamento:',
                                  style: TextStyle(
                                      color: themes.colorScheme.tertiary,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.0),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(-1.0, -1.0),
                              child: Column(
                                children: [
                                ProjectCard(
                                  title: project.title,
                                  status: project.status,
                                  priority: project.priority,
                                  onTap: () {
                                    navigateToProjectDetails();
                                  },
                                ),
                                ProjectCard(
                                  title: 'Projetinho 2',
                                  status: 'Atrasado',
                                  priority: 'Baixa',
                                  onTap: () {
                                    navigateToProjectDetails();
                                  },
                                ),
                                
                              ],
          
                              ),
                              
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
