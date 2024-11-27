import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hours_keeper/components/drawer.dart';
import 'package:hours_keeper/components/hour_field.dart';
import 'package:hours_keeper/components/project_select.dart';
import 'package:hours_keeper/components/text_field.dart';
import 'package:hours_keeper/components/theme.dart';

class CreateRegisterView extends StatefulWidget {
  const CreateRegisterView({super.key});

  @override
  State<CreateRegisterView> createState() => _CreateRegisterViewState();
}

class _CreateRegisterViewState extends State<CreateRegisterView> {
  TextEditingController description = TextEditingController();
  TextEditingController startHour = TextEditingController();
  TextEditingController endHour = TextEditingController();
  Duration? totalHours;

  
    void _calculateHours() {
      print('Start hour: ${startHour.text}, End hour: ${endHour.text}');
      if (startHour.text.isNotEmpty && endHour.text.isNotEmpty) {
        try {
          final startTime = DateFormat('yyyy-MM-dd HH:mm').parse(startHour.text);
          final endTime =
              DateFormat('yyyy-MM-dd HH:mm').parse(endHour.text); // Usando o valor correto

          final difference = endTime.difference(startTime);

          if (difference.isNegative) {
            final endTimeAdjusted = endTime.add(const Duration(days: 1));
            setState(() {
              totalHours = endTimeAdjusted.difference(startTime);
            });
          } else {
            print('Difference: $difference');
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
              Column(
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
                  ProjectDropdown(onChanged: (value) {
                    print(value);
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
                    ]),
                  )
                ],
              ),
            ],
          )),
        ));
  }
}
