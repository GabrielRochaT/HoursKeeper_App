import 'package:flutter/material.dart';
import 'package:hours_keeper/components/theme.dart';

class DatePickerField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const DatePickerField({
    super.key,
    required this.controller, this.validator,
  });

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 29, top: 8),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        readOnly: true,
        decoration: InputDecoration(
          focusColor: themes.colorScheme.tertiary,
          filled: true,
          fillColor: themes.colorScheme.inversePrimary,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: themes.colorScheme.tertiary, width: 3)),
          suffixIcon: Icon(Icons.calendar_today, color: themes.colorScheme.tertiary,),
          focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: themes.colorScheme.tertiary, width: 3),
          ),

          errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Color.fromRGBO(182, 108, 108, 1), width: 3),
              ),

              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Color.fromRGBO(182, 108, 108, 1), width: 3),
              ),
        ),
        onTap: () async {
          DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );

          if (selectedDate != null) {
 
            widget.controller.text = selectedDate.toString();
          }
        },
      ),
    );
  }
}
