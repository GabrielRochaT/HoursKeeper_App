import 'package:flutter/material.dart';
import 'package:hours_keeper/components/theme.dart';

class HourPickerField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const HourPickerField({
    super.key,
    required this.controller, required this.onChanged,
  });

  @override
  State<HourPickerField> createState() => _HourPickerFieldState();
}

class _HourPickerFieldState extends State<HourPickerField> {
  Future<void> _selectHour(BuildContext context) async {
    // Seleciona a data
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      // Seleciona a hora
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final DateTime fullDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        // Atualiza o campo com a data e hora selecionadas
        widget.controller.text = "${fullDateTime.toLocal()}".split(' ')[0] +
            ' ${pickedTime.format(context)}';

        widget.onChanged(widget.controller.text);
      }
    }
  }

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
          suffixIcon: Icon(
            Icons.watch_later_outlined,
            color: themes.colorScheme.tertiary,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: themes.colorScheme.tertiary, width: 3),
          ),
        ),
        onTap: () async {
          await _selectHour(context);
        },
        onChanged: widget.onChanged,
      ),
    );
  }
}
