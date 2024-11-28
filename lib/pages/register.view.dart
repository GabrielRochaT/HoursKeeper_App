import 'package:flutter/material.dart';
import 'package:hours_keeper/auth/authentication.dart';
import 'package:hours_keeper/components/button.dart';
import 'package:hours_keeper/components/snackbar.dart';
import 'package:hours_keeper/components/text_field.dart';
import 'package:hours_keeper/components/theme.dart';
// import 'package:google_fonts/google_fonts.dart';

class RegisterView extends StatefulWidget {
  final void Function()? onTap;

  const RegisterView({super.key, required this.onTap});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final Authentication _authentication = Authentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themes.colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/images/logo.png',
                height: 144,
                width: 144,
              ),
              Text('Crie sua conta.',
                  style: TextStyle(
                      fontSize: 32,
                      color: themes.colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato')),
              const SizedBox(height: 22),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                color: themes.colorScheme.primary,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 45),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        MyTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obrigatório';
                            }

                            if (value.length < 3) {
                              return 'Nome muito curto';
                            }
                            return null;
                          },
                          controller: userController,
                          obscureText: false,
                          hintText: 'Digite seu nome',
                          icon: Icons.person_outline_rounded,
                        ),
                        const SizedBox(height: 20),

                        MyTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'O email deve ser preeechido';
                            }

                            if (!value.contains('@') || value.length < 5) {
                              return 'Email inválido';
                            }
                            return null;
                          },
                          controller: emailController,
                          obscureText: false,
                          hintText: 'Digite seu email',
                          icon: Icons.alternate_email,
                        ),
                        const SizedBox(height: 20),

                        // Campo de senha
                        MyTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'A senha deve ser preenchida';
                            }

                            if (value.length < 8) {
                              return 'A senha deve ter no mínimo 8 caracteres';
                            }
                            return null;
                          },
                          controller: passwordController,
                          obscureText: true,
                          hintText: 'Digite sua senha',
                          icon: Icons.lock_outline_rounded,
                        ),
                        const SizedBox(height: 30),

                        MyTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obrigatório';
                            }

                            if (value != passwordController.text) {
                              return 'As senhas não coincidem';
                            }
                            return null;
                          },
                          controller: confirmPasswordController,
                          obscureText: true,
                          hintText: 'Confirme sua senha',
                          icon: Icons.lock_outline_rounded,
                        ),
                        const SizedBox(height: 30),
                        MyButton(
                          text: 'Registrar',
                          onTap: () {
                            registerButtonPressed();
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Já possui conta? ',
                                style: TextStyle(
                                    color: themes.colorScheme.inversePrimary,
                                    fontSize: 16)),
                            GestureDetector(
                              onTap: widget.onTap,
                              child: Text('Fazer Login',
                                  style: TextStyle(
                                      color: themes.colorScheme.tertiary,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lato',
                                      fontSize: 16)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void registerButtonPressed() {
    String name = userController.text;
    String email = emailController.text;
    String password = passwordController.text;

    if (_formKey.currentState!.validate()) {
      _authentication
          .registerUser(name: name, email: email, password: password)
          .then((String? erro) {
            if (erro != null){
              showSnackbar(context: context, message: erro);
            }
          });
    } else {
      print('Não validado');
    }
  }
}
