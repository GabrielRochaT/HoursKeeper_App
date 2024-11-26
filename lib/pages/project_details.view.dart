import 'package:flutter/material.dart';
import 'package:hours_keeper/components/action_button.dart';
import 'package:hours_keeper/components/drawer.dart';
import 'package:hours_keeper/components/priority_tag.dart';
import 'package:hours_keeper/components/status_tag.dart';
import 'package:hours_keeper/components/theme.dart';
import 'package:hours_keeper/components/user_tag.dart';

class ProjectDetailsView extends StatelessWidget {
  // final String title = 'Projeto 1';
  // final String description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
  // final String startDate = '01/01/2021';
  // final String endDate = '01/01/2022';
  // final String status = 'Em andamento';
  // final String priority = 'Alta';
  // final String consumedHours = ;
  // final List<String> participants = ['Usuário 1', 'Usuário 2', 'Usuário 3'];

  const ProjectDetailsView({super.key});

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
        body: Column(
          children: [
            Row(
              children: [
                Align(
                  alignment: const Alignment(-1.0, -1.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50, left: 51),
                    child: Text(
                      'Projeto 1',
                      style: TextStyle(
                          color: themes.colorScheme.tertiary,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 50, left: 10),
                    child: Icon(Icons.mode_edit_outline_outlined,
                        color: themes.colorScheme.primary, size: 24.0)),
                Padding(
                    padding: const EdgeInsets.only(top: 50, left: 10),
                    child: Icon(Icons.delete_outline_outlined,
                        color: Color.fromRGBO(182, 108, 108, 1))),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 7, left: 51),
                  child: StatusTag(status: 'Em andamento'),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 7, left: 26),
                    child: PriorityTag(priority: 'Alta')),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 51, right: 30),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Descrição',
                        style: TextStyle(
                            color: themes.colorScheme.tertiary,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lato')),
                    const SizedBox(height: 5),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                      style: TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 12),
                    Text('Data de início',
                        style: TextStyle(
                            color: themes.colorScheme.tertiary,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lato')),
                    const SizedBox(height: 5),
                    Text('01/01/2021', style: TextStyle(fontSize: 12)),
                    const SizedBox(height: 12),
                    Text('Data de término',
                        style: TextStyle(
                            color: themes.colorScheme.tertiary,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lato')),
                    const SizedBox(height: 5),
                    Text('01/01/2022', style: TextStyle(fontSize: 12)),
                    const SizedBox(height: 12),
                    Text('Participantes',
                        style: TextStyle(
                            color: themes.colorScheme.tertiary,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lato')),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(top: 7, right: 30),
                      child: Wrap(
                        spacing: 8.8,
                        runSpacing: 8.8,
                        children: [
                          UserTag(user: 'Antônio Victor Da Costa'),
                          UserTag(user: 'João gabriel'),
                          UserTag(user: 'Gabriel Oliveira'),
                          UserTag(user: 'Joaquim José Da Silva Xavier'),
                          UserTag(user: 'José Ribamar da Silva Oliveira Santos Pereira') 

                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Text('Horas consumidas',
                            style: TextStyle(
                                color: themes.colorScheme.tertiary,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lato')),
                        Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('0h',
                                style: TextStyle(
                                  fontSize: 12,
                                ))),
                      ],
                    ),

                    const SizedBox(height: 5),
                    Container(
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: themes.colorScheme.tertiary, width: 1),
                          borderRadius: BorderRadius.circular(4)),
                      child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text('Usuário 1'),
                              subtitle: Text('01/01/2021 - 01/01/2022'),
                              trailing: Text('0h'),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ActionButton(text: 'Novo registro de horas', onTap: () {}),
                    )
                  ]),
            )
          ],
        ));
  }
}
