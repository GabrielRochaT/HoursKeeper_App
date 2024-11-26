import 'package:flutter/material.dart';
import 'package:hours_keeper/components/theme.dart';

class DatePickerField extends StatefulWidget {
  final TextEditingController controller;

  const DatePickerField({
    super.key,
    required this.controller,
  });

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 29, top: 8),
      child: TextField(
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
        ),
        onTap: () async {
          DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );

          if (selectedDate != null) {
            String formattedDate =
                "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
            widget.controller.text = formattedDate;
          }
        },
      ),
    );
  }
}
