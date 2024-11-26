import 'package:flutter/material.dart';
import 'package:hours_keeper/components/theme.dart';

class UserTag extends StatelessWidget {
  final String user;
  const UserTag({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    
    return IntrinsicWidth( // Faz o container ajustar-se ao tamanho do conteúdo
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0), // Espaçamento interno horizontal
        height: 18,
        decoration: BoxDecoration(
          color: themes.colorScheme.secondary,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            user,
            style: TextStyle(
              color: themes.colorScheme.inversePrimary,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
