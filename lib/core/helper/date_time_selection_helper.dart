import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


Future<String> selectDate(BuildContext context) async {
  TimeOfDay? pickedTime;
  DateTime? pickedDate;
  pickedDate = await showDatePicker(
    context: context,
    firstDate: DateTime(2000),
    lastDate: DateTime(3000),
    builder: styleBuilder,
  );
String formattedDate=''; 
if(pickedDate !=null){
 formattedDate =DateFormat('dd/MM/yyyy').format(pickedDate).toString();
}


  return formattedDate;
}
Future<String> selectTime(BuildContext context) async {
  TimeOfDay? pickedTime;

   pickedTime =  await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: styleBuilder,
    );
String formattedTime=''; 
if(pickedTime !=null){
  final now = DateTime.now();
    final dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      pickedTime.hour,
      pickedTime.minute,
    );

 formattedTime =DateFormat('hh:mm a').format(dateTime).toString();
}


  return formattedTime;
}

Widget styleBuilder(BuildContext context, Widget? child) {
  return Theme(
    data: Theme.of(context).copyWith(
      primaryColor:  Color.fromARGB(255, 19, 224, 128),

      colorScheme: ColorScheme.light(
        onPrimary: Colors.black,
        primary: Colors.white,
        onSurface: Colors.black,
        surface:  Color.fromARGB(255, 19, 224, 128),
      ),
      timePickerTheme: TimePickerThemeData(
        dayPeriodColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white; // selected AM/PM
          }
          return  Color.fromARGB(255, 19, 224, 128); // unselected AM/PM
        }),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: Colors.black),
      ),
    ),
    child: child!,
  );
}