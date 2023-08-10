
import 'package:intl/intl.dart';

 String convertedDate(String? data){
   if(data!=null){
     DateTime date = DateTime.parse(data);
     return DateFormat.yMMMMd().format(date);
   }
   return "";

 }


 String dateToString(DateTime date){
   var formatter = DateFormat('yyyy-MM-dd');
   String formatted = formatter.format(date);
   return formatted;
 }


String simplyFormat({required DateTime time, bool dateOnly = false}) {
  String year = time.year.toString();
  return year;
}

String convertToTime(String time){
  final dateTime = DateTime.parse(time);
  final format = DateFormat('HH:mm a');
  final clockString = format.format(dateTime);
 return clockString;
}
String dateTimeFormat(String date){
  final dateTime = DateTime.parse(date);
  final format = DateFormat('d MMMM y, HH:mm a');
  final clockString = format.format(dateTime);
  return clockString;
}
String invoiceDateFormat(String date){
  final dateTime = DateTime.parse(date);
  final format = DateFormat('d/mm/yyyy,');
  final clockString = format.format(dateTime);
  return clockString;
}




 bool isDateExpired(String? data){
   if(data!=null){
     DateTime date = DateTime.parse(data);
     if(date.isBefore(DateTime.now())){
       return true;
     }else {
       return false;
     }
   }
   return false;
 }