import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hours_keeper/components/drawer.dart';
import 'package:hours_keeper/components/theme.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;

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
                padding: const EdgeInsets.only(top: 50),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: themes.colorScheme.secondary,
                  child: Icon(Icons.person,
                      color: themes.colorScheme.inversePrimary, size: 50),
                ),
              ),

              Wrap(
                children: [
                  Text('${user?.displayName}',
                      style: TextStyle(
                          color: themes.colorScheme.tertiary,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0)),
                  // Padding(
                  //   padding: const EdgeInsets.only(left:0),
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       print('Edit');
                  //     },
                  //     child: Icon(Icons.mode_edit_outline_outlined, color: themes.colorScheme.primary, size: 24.0),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 15),
              Wrap(
                children: [
                  Icon(Icons.alternate_email,
                      color: themes.colorScheme.tertiary, size: 24.0),
                  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text('${user?.email}')),
                ],
              ),

              SizedBox(height: 15),
              Wrap(
                children: [
                  Icon(Icons.lock,
                      color: themes.colorScheme.tertiary, size: 24.0),
                  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text('******')),
                ],
              ),
              SizedBox(height: 15),
              // Icon(Icons.mode_edit_outline_outlined, color: themes.colorScheme.primary, size: 24.0),
            ],
          ),
        )));
  }
}
