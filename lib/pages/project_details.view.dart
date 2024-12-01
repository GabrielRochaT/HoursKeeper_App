import 'package:flutter/material.dart';
import 'package:hours_keeper/components/action_button.dart';
import 'package:hours_keeper/components/drawer.dart';
import 'package:hours_keeper/components/priority_tag.dart';
import 'package:hours_keeper/components/status_tag.dart';
import 'package:hours_keeper/components/theme.dart';
import 'package:hours_keeper/components/user_tag.dart';
import 'package:hours_keeper/models/project.dart';
import 'package:hours_keeper/models/register.dart';
import 'package:hours_keeper/pages/create_project.view.dart';
import 'package:hours_keeper/pages/create_register.view.dart';
import 'package:hours_keeper/utils/projects_service.dart';
import 'package:hours_keeper/utils/register_service.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ProjectDetailsView extends StatefulWidget {
  final ProjectModel projectModel;
  ProjectDetailsView({super.key, required this.projectModel});
  
  RegisterService _registerService = RegisterService();
  ProjectService _projectService= ProjectService();

  @override
  State<ProjectDetailsView> createState() => _ProjectDetailsViewState();
}

class _ProjectDetailsViewState extends State<ProjectDetailsView> {

  void navigateToAddRegister() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CreateRegisterView()));
  }

  @override
  Widget build(BuildContext context) {
    Duration consumedTotal = Duration(milliseconds: widget.projectModel.consumedHours);

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
                    Flexible(
                      child: Align(
                        alignment: const Alignment(-1.0, -1.0),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 50, left: 51, right: 30),
                          child: Text(
                            widget.projectModel.title,
          
                            style: TextStyle(
                                color: themes.colorScheme.tertiary,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 50, left: 10),
                        child: GestureDetector(
                          onTap: () {
                            if (widget.projectModel.status == "Em andamento"){
                              SnackBar snackBar = SnackBar(
                                content: Text(
                                    'Tem certeza que deseja concluir "${widget.projectModel.title}"?'),
                                backgroundColor: themes.colorScheme.primary,
                                action: SnackBarAction(
                                    label: 'SIM',
                                    textColor: themes.colorScheme.inversePrimary,
                                    onPressed: () {
                                      ProjectService().changeStatus(widget.projectModel.id);
                                      setState(() {
                                        widget.projectModel.status = "Concluído";
                                      });
                                    }),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }else{
                              SnackBar snackBar = SnackBar(
                                content: Text(
                                    'Tem certeza que deseja reabrir "${widget.projectModel.title}"?'),
                                backgroundColor: themes.colorScheme.primary,
                                action: SnackBarAction(
                                    label: 'SIM',
                                    textColor: themes.colorScheme.inversePrimary,
                                    onPressed: () {
                                      ProjectService().changeStatus(widget.projectModel.id);
                                      setState(() {
                                        widget.projectModel.status = "Em andamento";
                                      });
                                    }),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              
                            }
                          },
                          child: Icon((widget.projectModel.status == "Em andamento" ? Icons.check_box_outline_blank : Icons.check_box_outlined),
                              color: themes.colorScheme.primary, size: 24.0),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 50, left: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateProjectView(
                                        project: widget.projectModel)));
                          },
                          child: Icon(Icons.edit_outlined,
                              color: themes.colorScheme.primary, size: 24.0),
                        )),
                    Padding(
                        padding:
                            const EdgeInsets.only(top: 50, left: 10, right: 30),
                        child: GestureDetector(
                          onTap: () {
                            SnackBar snackBar = SnackBar(
                              content: Text(
                                  'Tem certeza que deseja remover "${widget.projectModel.title}"?'),
                                  backgroundColor: Color.fromRGBO(182, 108, 108, 1),
                              action: SnackBarAction(
                                  label: 'SIM',
                                  textColor: themes.colorScheme.inversePrimary,
                                  onPressed: () {
                                    ProjectService()
                                        .deleteProject(widget.projectModel.id);
                                    Navigator.pop(context);
                                  }),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                      child: StatusTag(status: widget.projectModel.status),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 7, left: 26),
                        child:
                            PriorityTag(priority: widget.projectModel.priority!)),
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
                          widget.projectModel.description,
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
                        Text(DateFormat('dd/MM/yyyy').format(widget.projectModel.startDate),
                            style: TextStyle(fontSize: 12)),
                        const SizedBox(height: 12),
                        Text('Data de término',
                            style: TextStyle(
                                color: themes.colorScheme.tertiary,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lato')),
                        const SizedBox(height: 5),
                        Text(DateFormat('dd/MM/yyyy').format(widget.projectModel.endDate),
                            style: TextStyle(fontSize: 12)),
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
                          child: UserTag(
                              user: widget.projectModel.participant ?? ''),
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
                                child: Text(
                                    '${consumedTotal.inHours}h ${consumedTotal.inMinutes.remainder(60)}m',
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
                          child: 
                        StreamBuilder(stream: widget._registerService.getRegisters(widget.projectModel.id), builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting){
                            return Center(child: CircularProgressIndicator());
                          }else{
                            if (snapshot.hasData && snapshot.data!.docs.isNotEmpty){
                              final List<RegisterModel> registers = [];
          
                              for (var doc in snapshot.data!.docs){
                                registers.add(RegisterModel.fromMap(doc.data()));
                              }
          
                              return ListView.builder(
                              itemCount: registers.length,
                              itemBuilder: (context, index) {
                                RegisterModel register = registers[index];
                                final Duration hoursTotal = Duration(milliseconds: register.hours ?? 0);
                                return ListTile(
                                  hoverColor: themes.colorScheme.primary,
                                  onLongPress: () {
                                    SnackBar snackBar = SnackBar(
                                    
                                      content: Text(
                                          'Tem certeza que deseja remover o registro de horas de ${register.user}?'),
                                      backgroundColor: Color.fromRGBO(182, 108, 108, 1),
                                      action: SnackBarAction(
                                          label: 'SIM',
                                          textColor: themes.colorScheme.inversePrimary,
                                          onPressed: () {
                                            widget._registerService.deleteRegister(widget.projectModel.id, register.id!);
                                            widget._projectService.decraseHours(widget.projectModel.id, register.hours!);
                                          }),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  },
                                  title: Text(register.user.toString(), style: TextStyle(color: themes.colorScheme.secondary),),
                                  subtitle: Text(
                                      '${DateFormat("dd/MM/yyyy HH:mm").format(register.initialHour)} - ${DateFormat("dd/MM/yyyy HH:mm").format(register.finalHour)}', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                                  trailing: Text('${hoursTotal.inHours}h ${hoursTotal.inMinutes.remainder(60)}m', style: TextStyle(color: themes.colorScheme.secondary, fontWeight: FontWeight.bold),),
                                );
                              });
                              
                            }else{
                              return Center(child: Text('😴 Não foram registradas horas neste projeto.', style: TextStyle(fontFamily: 'Lato'),));
                            }
                          }
                        }),
                        ),
                        Center(child: Text('Segure um registro para deleta-lo', style: TextStyle(color: themes.colorScheme.tertiary, fontSize: 10),)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ActionButton(
                              text: 'Novo registro de horas',
                              onTap: () {
                                navigateToAddRegister();
                              }),
                        )
                      ]),
                )
              ],
            ),
          ),
        );
  }

}

