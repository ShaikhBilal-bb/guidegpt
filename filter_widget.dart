import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  final Function(String) onCategorySelected;
  final Function(DateTime) onDateSelected;

  FilterWidget({
    required this.onCategorySelected,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          hint: Text('Select Category'),
          onChanged: (String? value) => onCategorySelected(value ?? ''),
          items: <String>['All', 'Category 1', 'Category 2'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        ElevatedButton(
          onPressed: () async {
            DateTime? selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (selectedDate != null) {
              onDateSelected(selectedDate);
            }
          },
          child: Text('Select Date'),
        ),
      ],
    );
  }
}
