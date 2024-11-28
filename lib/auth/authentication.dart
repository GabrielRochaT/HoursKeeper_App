import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:hours_keeper/auth/login_register.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> registerUser(
      {required String name,
      required String email,
      required String password}) async {
    try {
      UserCredential credentials = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await credentials.user!.updateDisplayName(name);

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'Este email já está em uso';
      }
      return "Ocorreu um erro ao registrar o usuário";
    }
  }

  Future<String?> loginUser(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential'){
        return 'Email ou senha inválidos';
      }
      return 'Ocorreu um erro ao fazer login';
    }
  }

  Future<void> logout() async{
    await _auth.signOut();
  }
}
