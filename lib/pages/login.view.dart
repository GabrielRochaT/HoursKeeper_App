import 'package:flutter/material.dart';
import 'package:hours_keeper/auth/authentication.dart';
import 'package:hours_keeper/components/button.dart';
import 'package:hours_keeper/components/snackbar.dart';
import 'package:hours_keeper/components/text_field.dart';
import 'package:hours_keeper/components/theme.dart';
// import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatefulWidget {
  final void Function()? onTap;
  const LoginView({super.key, required this.onTap});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // void signIn() {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => HomeView(),
  //       ));
  // }

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
              Text('Olá, entre na sua conta.',
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
                        // Campo de email
                        MyTextField(
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return 'O email deve ser preeechido';
                            }
                    
                            if (!value.contains('@') || value.length < 5) {
                              return 'Email inválido';
                            }
                            return null;
                          },
                          controller: emailController,
                          maxLines: 1,
                          obscureText: false,
                          hintText: 'Digite seu email',
                          icon: Icons.alternate_email,
                        ),
                        const SizedBox(height: 20),
                    
                        MyTextField(
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return 'A senha deve ser preenchida';
                            }
                    
                            if(value.length < 8){
                              return 'A senha deve ter no mínimo 8 caracteres';
                            }
                            return null;
                          },
                          controller: passwordController,
                          maxLines: 1,
                          obscureText: true,
                          hintText: 'Digite sua senha',
                          icon: Icons.lock_outline_rounded,
                        ),
                        const SizedBox(height: 30),
                        MyButton(
                          text: 'Entrar',
                          onTap: () {
                            enterButtonPressed();
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Não possui conta? ',
                                style: TextStyle(
                                    color: themes.colorScheme.inversePrimary,
                                    fontSize: 16)),
                            GestureDetector(
                              onTap: widget.onTap,
                              child: Text('Cadastre-se',
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

  enterButtonPressed(){
    String email = emailController.text;
    String password = passwordController.text;

    if(_formKey.currentState!.validate()){
      _authentication.loginUser(email: email, password: password).then((String? error) {
        if(error == null){
          // Navigator.pushReplacement(
          // context,
          // MaterialPageRoute(
          //   builder: (context) => HomeView(),
          // ),
          // );
        }else{
          showSnackbar(context: context, message: error);
        }
      });

    }else{
      showSnackbar(context: context, message: 'Preencha os campos corretamente', isError: true);
    }
  }
}
