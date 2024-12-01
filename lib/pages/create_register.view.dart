import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hours_keeper/models/register.dart';
import 'package:hours_keeper/utils/projects_service.dart';
import 'package:hours_keeper/utils/register_service.dart';
import 'package:intl/intl.dart';
import 'package:hours_keeper/components/drawer.dart';
import 'package:hours_keeper/components/hour_field.dart';
import 'package:hours_keeper/components/project_select.dart';
import 'package:hours_keeper/components/text_field.dart';
import 'package:hours_keeper/components/theme.dart';
import 'package:uuid/uuid.dart';

class CreateRegisterView extends StatefulWidget {
  const CreateRegisterView({super.key});

  @override
  State<CreateRegisterView> createState() => _CreateRegisterViewState();
}

class _CreateRegisterViewState extends State<CreateRegisterView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController description = TextEditingController();
  TextEditingController startHour = TextEditingController();
  TextEditingController endHour = TextEditingController();
  Duration? totalHours;
  String? selectedProject;
  String? porjectId;
  bool isLoading = false;

  ProjectService _projectService = ProjectService();
  RegisterService _registerService = RegisterService();

  void _calculateHours() {
    if (startHour.text.isNotEmpty && endHour.text.isNotEmpty) {
      try {
        final startTime = DateFormat('yyyy-MM-dd HH:mm').parse(startHour.text);
        final endTime = DateFormat('yyyy-MM-dd HH:mm')
            .parse(endHour.text); // Usando o valor correto

        final difference = endTime.difference(startTime);

        if (difference.isNegative) {
          final endTimeAdjusted = endTime.add(const Duration(days: 1));
          setState(() {
            totalHours = endTimeAdjusted.difference(startTime);
          });
        } else {
          setState(() {
            totalHours = difference;
          });
        }
      } catch (e) {
        setState(() {
          totalHours = null;
        });
      }
    }
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
                  'Adicionar registro de horas',
                  style: TextStyle(
                      color: themes.colorScheme.tertiary,
                      fontFamily: 'Lato',
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24, left: 29),
                      child: Text(
                        'Projeto',
                        style: TextStyle(
                            color: themes.colorScheme.tertiary,
                            fontFamily: 'Lato',
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ProjectDropdown(onChanged: (String id, String title) {
                      selectedProject = title;
                      porjectId = id;
                    }),
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
                                    'Hora Inicial',
                                    style: TextStyle(
                                        color: themes.colorScheme.tertiary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Lato'),
                                  ),
                                ),
                                HourPickerField(
                                    controller: startHour,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Campo obrigatório';
                                      }


                                      return null;
                                    },
                                    onChanged: (value) {
                                      _calculateHours();
                                    }),
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
                                    'Hora Final',
                                    style: TextStyle(
                                        color: themes.colorScheme.tertiary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Lato'),
                                  ),
                                ),
                                HourPickerField(
                                  controller: endHour,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Campo obrigatório';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    _calculateHours();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 24, left: 29, bottom: 8),
                      child: Text(
                        totalHours != null
                            ? 'Total de horas: ${totalHours!.inHours}h${totalHours!.inMinutes.remainder(60)}m'
                            : 'Total de horas: 0h ',
                        style: TextStyle(
                            color: themes.colorScheme.tertiary,
                            fontFamily: 'Lato',
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, left: 29),
                      child: Text(
                        'Detalhes',
                        style: TextStyle(
                            color: themes.colorScheme.tertiary,
                            fontFamily: 'Lato',
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    MyTextField(
                        controller: description,
                        obscureText: false,
                        hintText: ''),
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
                              saveData();
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
                                            color: themes
                                                .colorScheme.inversePrimary,
                                          ))
                                      : Text(
                                          'Salvar',
                                          style: TextStyle(
                                              color: themes
                                                  .colorScheme.inversePrimary,
                                              fontFamily: 'Lato',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )),
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

  saveData() {
    if (_formKey.currentState!.validate()) {
      if (selectedProject == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Selecione um projeto'), backgroundColor: Color.fromRGBO(182, 108, 108, 1),));
      } else if (totalHours! < Duration.zero ) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Hora final deve ser maior que a hora inicial'), backgroundColor: Color.fromRGBO(182, 108, 108, 1),));
      }else {
        setState(() {
          isLoading = true;
        });

        String? user = FirebaseAuth.instance.currentUser?.displayName;
        DateTime initialHour = DateTime.parse(startHour.text);
        DateTime finalHour = DateTime.parse(endHour.text);
        int? hoursInMilliseconds = totalHours?.inMilliseconds;
        RegisterModel register = RegisterModel(
            id: Uuid().v1(),
            project: selectedProject,
            user: user,
            initialHour: initialHour,
            finalHour: finalHour,
            hours: hoursInMilliseconds,
            details: description.text);

        _registerService.createRegister(porjectId, register);
        _projectService.sumHours(porjectId!, hoursInMilliseconds!);
        setState(() {
          isLoading = false;
          Navigator.pop(context);
        });
      }
    }
  }
}
