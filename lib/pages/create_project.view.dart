import 'package:flutter/material.dart';
import 'package:hours_keeper/components/drawer.dart';
import 'package:hours_keeper/components/text_field.dart';
import 'package:hours_keeper/components/theme.dart';

class CreateProjectView extends StatelessWidget {
  const CreateProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    TextEditingController description = TextEditingController();

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
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text('Adicionar novo projeto', style: TextStyle(color: themes.colorScheme.tertiary, fontFamily: 'Lato', fontSize: 24, fontWeight: FontWeight.bold),),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24, left: 29),
                      child: Text('Titulo do projeto', style: TextStyle(color: themes.colorScheme.tertiary, fontFamily: 'Lato', fontSize: 16, fontWeight: FontWeight.bold),),
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
                      child: Text('Descrição', style: TextStyle(color: themes.colorScheme.tertiary, fontFamily: 'Lato', fontSize: 16, fontWeight: FontWeight.bold),),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: MyTextField(
                      controller: description,
                      obscureText: false,
                      hintText: '',
                    ),
                  ),
                ],
              ),
            ],)
          ),
        )
    );
  }
}