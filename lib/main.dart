import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hours_keeper/auth/login_register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hours_keeper/pages/home.view.dart';
import 'firebase_options.dart';
// import 'package:hours_keeper/pages/login.view.dart';
// import 'package:hours_keeper/pages/register.view.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hours Keeper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Router(),
    );
  }
}

class Router extends StatelessWidget {
  const Router({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeView(user: snapshot.data!);
        } else {
          return LoginRegister();
        }
      },
    );
  }
}
