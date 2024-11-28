import 'package:flutter/material.dart';
import 'package:hours_keeper/components/action_button.dart';
import 'package:hours_keeper/components/drawer.dart';
import 'package:hours_keeper/components/priority_tag.dart';
import 'package:hours_keeper/components/status_tag.dart';
import 'package:hours_keeper/components/theme.dart';
import 'package:hours_keeper/components/user_tag.dart';
import 'package:hours_keeper/models/register.dart';
import 'package:hours_keeper/pages/create_register.view.dart';

class ProjectDetailsView extends StatefulWidget {
  ProjectDetailsView({super.key});

  final List<RegisterModel> registers = [
    RegisterModel(
      id: '1',
      // userId: '1',
      // projectId: '1',
      project: 'Projeto 1',
      user: 'Usuário 1',
      initialHour: '2024-11-11 17:05',
      finalHour: '2024-11-11 18:10',
      hours: '10h',
    ),
    RegisterModel(
      id: '2',
      // userId: '1',
      // projectId: '1',
      project: 'Projeto 1',
      user: 'Usuário 1',
      initialHour: '2024-11-12 17:05',
      finalHour: '2024-11-12 18:10',
      hours: '10h',
    ),
    RegisterModel(
      id: '3',
      // userId: '1',
      // projectId: '1',
      project: 'Projeto 1',
      user: 'Usuário 1',
      initialHour: '2024-11-13 17:05',
      finalHour: '2024-11-13 18:10',
      hours: '5h',
    ),
    RegisterModel(
      id: '3',
      // userId: '1',
      // projectId: '1',
      project: 'Projeto 1',
      user: 'Usuário 1',
      initialHour: '2024-11-14 17:05',
      finalHour: '2024-11-14 18:10',
      hours: '8h',
    ),
  ];

  @override
  State<ProjectDetailsView> createState() => _ProjectDetailsViewState();
}

class _ProjectDetailsViewState extends State<ProjectDetailsView> {
  void navigateToAddRegister(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateRegisterView()));
  }

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
          child: Column(
            children: [
              Row(
                children: [
                  Align(
                    alignment: const Alignment(-1.0, -1.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50, left: 51),
                      child: Text(
                        //AJUSTAR PARA QUE QUEBRE A LINHA PARA NÃO PASSAR DA BORDA DA TELA
                        'Projeto Placeholder 1',
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
                      child: GestureDetector(
                        onTap: () {
                          print('edit');
                        },
                        child: Icon(Icons.mode_edit_outline_outlined,
                            color: themes.colorScheme.primary, size: 24.0),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 50, left: 10),
                      child: GestureDetector(
                        onTap: () {
                          print('delete');
                        },
                        child: Icon(Icons.delete_outline_outlined,
                            color: Color.fromRGBO(182, 108, 108, 1)),
                      )),
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
                        'Descrição exemplo do projeto',
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
                      Text('15/10/2024', style: TextStyle(fontSize: 12)),
                      const SizedBox(height: 12),
                      Text('Data de término',
                          style: TextStyle(
                              color: themes.colorScheme.tertiary,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lato')),
                      const SizedBox(height: 5),
                      Text('10/12/2024', style: TextStyle(fontSize: 12)),
                      const SizedBox(height: 12),
                      Text('Responsável',
                          style: TextStyle(
                              color: themes.colorScheme.tertiary,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lato')),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(top: 7, right: 30),
                        child: UserTag(user: 'Antônio Victor Da Costa'),
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
                            color: themes.colorScheme.inversePrimary,
                            border: Border.all(
                                color: themes.colorScheme.tertiary, width: 1),
                            borderRadius: BorderRadius.circular(4)),
                        child: ListView.builder(
                            itemCount: widget.registers.length,
                            itemBuilder: (context, index) {
                              RegisterModel register = widget.registers[index];
                              return ListTile(
                                title: Text(register.user),
                                subtitle: Text('${register.initialHour} - ${register.finalHour}'),
                                trailing: Text(register.hours),
                              );
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ActionButton(text: 'Novo registro de horas', onTap: () {
                          navigateToAddRegister();
                        }),
                      )
                    ]),
              )
            ],
          ),
        ));
  }
}
