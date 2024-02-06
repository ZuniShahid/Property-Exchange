import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../constants/global_variables.dart';

class DatePickerWidget extends StatefulWidget {
  final Function(DateTime?) onDateSelected;

  DatePickerWidget({required this.onDateSelected});

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.secondaryColor,
          border: Border.all(color: AppColors.borderColor, width: 0.7)),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            selectedDate == null
                ? 'dd/mm/yyyy'
                : '${DateFormat.yMMMd().format(selectedDate!)}',
            style: bodyNormal.copyWith(
                color: Colors.white54, fontFamily: "PoppinsSemiBold"),
          ),
        ), // Format the date
        onTap: () {
          _showDatePicker(context);
        },
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.orangeColor, // Change primary color
            hintColor: AppColors.orangeLight, // Change accent color
            colorScheme: ColorScheme.light(
                primary: AppColors.buttonColor,
                background: Colors.black // Change background color
                ),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
      widget.onDateSelected(selectedDate); // Invoke the callback
    }
  }
}
