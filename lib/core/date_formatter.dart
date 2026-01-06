import 'package:intl/intl.dart';


String  dateFormatter(String date){
  DateTime dateTime=DateTime.parse(date);
  String  formattedDate= DateFormat('dd/MM/yyyy').format(dateTime);
  return formattedDate;
}