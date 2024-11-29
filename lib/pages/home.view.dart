import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hours_keeper/components/action_button.dart';
import 'package:hours_keeper/components/drawer.dart';
import 'package:hours_keeper/components/project_card.dart';
import 'package:hours_keeper/components/theme.dart';
import 'package:hours_keeper/models/project.dart';
import 'package:hours_keeper/pages/create_project.view.dart';
import 'package:hours_keeper/pages/project_details.view.dart';
import 'package:hours_keeper/utils/projects_service.dart';

class HomeView extends StatefulWidget {
  final User user;
  HomeView({super.key, required this.user});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void navigateToAddProject() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CreateProjectView()));
  }

  final ProjectService service = ProjectService();

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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.user.displayName != null ? "Olá, ${widget.user.displayName!}" : "Seja bem-vindo"}!',
                style: TextStyle(
                  color: themes.colorScheme.tertiary,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Flexible(
                      flex: 1, child: ActionButton(text: 'Registrar Horas')),
                  const SizedBox(width: 17),
                  Flexible(
                    flex: 1,
                    child: ActionButton(
                      text: 'Novo Projeto',
                      onTap: navigateToAddProject,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Text(
                'Seus Projetos em andamento:',
                style: TextStyle(
                  color: themes.colorScheme.tertiary,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              const SizedBox(height: 20),
              StreamBuilder(
                  stream: service.getProjects(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (snapshot.hasData &&
                          snapshot.data != null &&
                          snapshot.data!.docs.isNotEmpty) {
                        List<ProjectModel> listProjects = [];

                        for (var doc in snapshot.data!.docs) {
                          listProjects.add(ProjectModel.fromMap(doc.data()));
                        }

                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: listProjects.length,
                          itemBuilder: (context, index) {
                            ProjectModel project = listProjects[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: ProjectCard(
                                title: project.title,
                                status: project.status,
                                priority: project.priority!,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProjectDetailsView(
                                                  projectModel: project)));
                                },
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(
                          child:
                              Text('Você não possui projetos cadastrados. 😢'),
                        );
                      }
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
