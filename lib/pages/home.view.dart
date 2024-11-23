import 'package:flutter/material.dart';
import 'package:hours_keeper/components/action_button.dart';
import 'package:hours_keeper/components/drawer.dart';
import 'package:hours_keeper/components/project_card.dart';
import 'package:hours_keeper/components/theme.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
        body: Stack(
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
                        ActionButton(text: 'Novo Projeto'),
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

                          Center(
                            child: Column(
                              children: [
                                const SizedBox(height: 17),
                                Row(
                                  children: [
                                    ProjectCard(),
                                  ],
                                ),
                              ],
                            ),
                          )
                          
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
