import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hours_keeper/components/date_field.dart';
import 'package:hours_keeper/components/drawer.dart';
import 'package:hours_keeper/components/priority_select.dart';
import 'package:hours_keeper/components/text_field.dart';
import 'package:hours_keeper/components/theme.dart';
import 'package:hours_keeper/models/project.dart';
import 'package:hours_keeper/utils/projects_service.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class CreateProjectView extends StatefulWidget {
  final ProjectModel? project;
  const CreateProjectView({super.key, this.project});

  @override
  State<CreateProjectView> createState() => _CreateProjectViewState();
}

class _CreateProjectViewState extends State<CreateProjectView> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _startDate = TextEditingController();
  final TextEditingController _endDate = TextEditingController();
  String? selectedPriority;
  bool isLoading = false;

  ProjectService _projectService = ProjectService();

  void initState() {
    if (widget.project != null) {
      _title.text = widget.project!.title;
      _description.text = widget.project!.description;
      _startDate.text = widget.project!.startDate;
      _endDate.text = widget.project!.endDate;
      selectedPriority = widget.project!.priority;
    }
    super.initState();
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
          child: Center(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  widget.project != null
                      ? 'Editar: ${widget.project!.title}'
                      : 'Adicionar novo projeto',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: themes.colorScheme.tertiary,
                      fontFamily: 'Lato',
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24, left: 29),
                      child: Text(
                        'Titulo do projeto',
                        style: TextStyle(
                            color: themes.colorScheme.tertiary,
                            fontFamily: 'Lato',
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: MyTextField(
                        controller: _title,
                        maxLenght: 25,
                        maxLines: 1,
                        obscureText: false,
                        hintText: '',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, left: 29),
                      child: Text(
                        'Descrição',
                        style: TextStyle(
                            color: themes.colorScheme.tertiary,
                            fontFamily: 'Lato',
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: MyTextField(
                        controller: _description,
                        obscureText: false,
                        hintText: '',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 24),
                                  child: Text(
                                    'Data de Início',
                                    style: TextStyle(
                                        color: themes.colorScheme.tertiary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Lato'),
                                  ),
                                ),
                                DatePickerField(controller: _startDate),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 24),
                                  child: Text(
                                    'Data de Término',
                                    style: TextStyle(
                                        color: themes.colorScheme.tertiary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Lato'),
                                  ),
                                ),
                                DatePickerField(controller: _endDate),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, left: 29),
                      child: Text(
                        'Prioridade',
                        style: TextStyle(
                            color: themes.colorScheme.tertiary,
                            fontFamily: 'Lato',
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    PriorityDropdown(
                        value: selectedPriority,
                        onChanged: (value) {
                          setState(() {
                            selectedPriority = value;
                          });
                        }),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 29, top: 25, bottom: 25),
                      child: Row(children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 103,
                            height: 35,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(182, 108, 108, 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'Cancelar',
                                style: TextStyle(
                                    color: themes.colorScheme.inversePrimary,
                                    fontFamily: 'Lato',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: GestureDetector(
                            onTap: () {
                              sendData();
                            },
                            child: Container(
                              width: 103,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: themes.colorScheme.tertiary,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: (isLoading)
                                    ? SizedBox(
                                        height: 15,
                                        width: 16,
                                        child: CircularProgressIndicator(
                                          color:
                                              themes.colorScheme.inversePrimary,
                                        ))
                                    : Text(
                                        'Salvar',
                                        style: TextStyle(
                                            color: themes
                                                .colorScheme.inversePrimary,
                                            fontFamily: 'Lato',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ],
          )),
        ));
  }

  sendData() {
    setState(() {
      isLoading = true;
    });

    String title = _title.text;
    String description = _description.text;
    String startDate = _startDate.text;
    String endDate = _endDate.text;
    String? priority = selectedPriority;
    String status = 'Em andamento';
    int consumedHours = 0;
    String? participant = FirebaseAuth.instance.currentUser?.displayName;

    ProjectModel project = ProjectModel(
        id: Uuid().v1(),
        title: title,
        description: description,
        startDate: startDate,
        endDate: endDate,
        status: status,
        priority: priority,
        consumedHours: consumedHours,
        participant: participant);

        if (widget.project != null){
          project.id = widget.project!.id;
        }

    _projectService.createProject(project).then((value) {
      setState(() {
        isLoading = false;
        Navigator.pop(context);
      });
    });
  }
}
