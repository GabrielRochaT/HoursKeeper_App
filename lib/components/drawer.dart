import 'package:flutter/material.dart';
import 'package:hours_keeper/auth/authentication.dart';
// import 'package:hours_keeper/auth/login_register.dart';
import 'package:hours_keeper/components/theme.dart';
import 'package:hours_keeper/components/tile.dart';
import 'package:hours_keeper/pages/profile.view.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: themes.colorScheme.primary,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Image.asset('lib/assets/images/logo_white.png',
                height: 50, width: 50),
          ),
          const SizedBox(height: 20),
          Divider(color: themes.colorScheme.inversePrimary),
          MyTile(
              title: 'Perfil',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileView()));
              },
              icon: Icons.person),
          Divider(color: themes.colorScheme.inversePrimary),
          Spacer(),
          MyTile(
              title: 'Sair',
              onTap: () async {
                Navigator.pop(context);
                await Authentication().logout();
                // Navigator.of(context).pushAndRemoveUntil(
                //   MaterialPageRoute(builder: (context) => LoginRegister()),
                //   (route) => false,
                // );
              },
              icon: Icons.logout_rounded),
        ],
      ),
    );
  }
}
