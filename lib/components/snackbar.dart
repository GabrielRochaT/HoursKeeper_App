import 'package:flutter/material.dart';
import 'package:hours_keeper/components/theme.dart';

showSnackbar(
    {required BuildContext context,
    required String message,
    bool isError = true}) {
  SnackBar snackBar = SnackBar(
    content: Text(message),
    backgroundColor: isError ? Colors.red : Colors.green,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(9))
    ),
    duration: const Duration(seconds: 4),
    action: SnackBarAction(label: "Ok", textColor: themes.colorScheme.inversePrimary, onPressed: (){
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    },),
    
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
