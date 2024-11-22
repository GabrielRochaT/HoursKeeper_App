import 'package:flutter/material.dart';
import 'package:hours_keeper/components/button.dart';
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
  @override
  Widget build(BuildContext context) {
    TextEditingController userController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

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
                    fontFamily: 'Lato'
                  )
              ),
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
                  child: Column(
                    children: [

                      MyTextField(
                        controller: userController,
                        obscureText: false,
                        hintText: 'Digite seu nome',
                        icon: Icon(
                          Icons.person_outline_rounded,
                          color: themes.colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(height: 20),

                      MyTextField(
                        controller: emailController,
                        obscureText: false,
                        hintText: 'Digite seu email',
                        icon: Icon(
                          Icons.alternate_email,
                          color: themes.colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Campo de senha
                      MyTextField(
                        controller: passwordController,
                        obscureText: true,
                        hintText: 'Digite sua senha',
                        icon: Icon(Icons.lock_outline_rounded,
                            color: themes.colorScheme.tertiary),
                      ),
                      const SizedBox(height: 30),

                      MyTextField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        hintText: 'Confirme sua senha',
                        icon: Icon(Icons.lock_outline_rounded,
                            color: themes.colorScheme.tertiary),
                      ),
                      const SizedBox(height: 30),
                      MyButton(text: 'Registrar', onTap: (){
                        print('Entrar');
                      },),
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
            ],
          ),
        ),
      ),
    );
  }
}
