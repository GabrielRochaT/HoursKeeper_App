import 'package:flutter/material.dart';
import 'package:hours_keeper/components/date_field.dart';
import 'package:hours_keeper/components/drawer.dart';
import 'package:hours_keeper/components/priority_select.dart';
import 'package:hours_keeper/components/text_field.dart';
import 'package:hours_keeper/components/theme.dart';

class CreateProjectView extends StatefulWidget {
  const CreateProjectView({super.key});

  @override
  State<CreateProjectView> createState() => _CreateProjectViewState();
}

class _CreateProjectViewState extends State<CreateProjectView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    TextEditingController description = TextEditingController();
    TextEditingController startDate = TextEditingController();
    TextEditingController endDate = TextEditingController();

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
                  'Adicionar novo projeto',
                  style: TextStyle(
                      color: themes.colorScheme.tertiary,
                      fontFamily: 'Lato',
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Column(
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
                      controller: title,
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
                      controller: description,
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
                              DatePickerField(controller: startDate),
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
                              DatePickerField(controller: endDate),
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
                  PriorityDropdown(onChanged: (value) {
                    print(value);
                  }),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 24, left: 29, bottom: 8),
                    child: Text(
                      'Responsável',
                      style: TextStyle(
                          color: themes.colorScheme.tertiary,
                          fontFamily: 'Lato',
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      readOnly: true,
                      controller: TextEditingController(text: 'Usuário Logado'),
                      obscureText: false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: themes.colorScheme.inversePrimary,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: themes.colorScheme.tertiary, width: 3)),
                        hintText: '',
                        hintStyle: TextStyle(
                            color: themes.colorScheme.tertiary,
                            fontFamily: 'Lato'),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: themes.colorScheme.tertiary, width: 3),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 29, top: 25, bottom: 25),
                    child: Row(
                      children: [
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
                            // Implementar a lógica de salvar o projeto
                          },
                          child: Container(
                            width: 103,
                            height: 35,
                            decoration: BoxDecoration(
                                color: themes.colorScheme.tertiary,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'Salvar',
                                style: TextStyle(
                                    color: themes.colorScheme.inversePrimary,
                                    fontFamily: 'Lato',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ]
                    ),
                  )
                ],
              ),
            ],
          )),
        ));
  }
}
