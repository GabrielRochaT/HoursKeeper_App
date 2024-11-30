import 'package:flutter/material.dart';
import 'package:hours_keeper/components/theme.dart';

class StatusTag extends StatelessWidget {
  final String status;
  const StatusTag ({super.key, required this.status});

  Color verifyStatus(String status){
    if(status == 'Em andamento'){
      return themes.colorScheme.tertiary;
    } else if(status == 'Concluído'){
      return Color.fromRGBO(168, 168, 168, 1);
    }else{
      return Color.fromRGBO(182, 108, 108, 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 87,
        height: 18,
        // margin: EdgeInsets.symmetric(horizontal: 100),
        decoration: BoxDecoration(

            color: verifyStatus(status),
            borderRadius: BorderRadius.circular(9)),

        child: Center(
          child: Text(status, style: TextStyle(color: themes.colorScheme.inversePrimary, fontSize: 10, fontWeight: FontWeight.bold)
          ),
        )
      );
  }
}