


import 'dart:io';

import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/storage/shared_preferences.dart';
import '../../features/home_page/model/hompage_model.dart';
appClear(){
  clearData();
}


String? services(List<Services> services){
  String? servicesList;
  if(services.isNotEmpty){
    for(var i in services){
      servicesList = "$servicesList,${i.name}";
    }
  }
  return servicesList?.replaceAll("null,", '');
}


String getMiddleName({
  required String fullName,
}) {
  var names = fullName.trim().split(" ");
 if (names.length == 3) {
   return names[1];
  }
  else if (names.length == 4) {
    return "${names[1]} ${names[2]}";
  }
 else{
   return "";
 }
}


String getLastName({
  required String fullName,
}) {
  var names = fullName.trim().split(" ");
  if (names.length == 3) {
    return names[2];
  }else if(names.length==2){
    return names[1];
  }
  else if(names.length==4){
    return names[3];
  }
  else{
    return "";
  }
}

Future<PhoneNumber?>? extractRegionCode(String phoneNumber) async{
  try {
    var  data=await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber);
       print(data);
    return data;
  } catch (e) {
    print('Failed to extract region code: $e');
    return null;
  }
}

Future<bool> isInternetConnected() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    return true;
    }else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}
String formatTime(int time) {
  int hours = (time / 3600).floor();
  int minutes = ((time % 3600) / 60).floor();
  int seconds = (time % 60);
  String hoursStr = (hours % 24).toString().padLeft(2, '0');
  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = seconds.toString().padLeft(2, '0');

  return '$hoursStr:$minutesStr:$secondsStr';
}

String formatDuration(int seconds) {
  int hours = seconds ~/ 3600;
  int minutes = (seconds % 3600) ~/ 60;
  int remainingSeconds = seconds % 60;
  String formattedTime = '';
  if (hours > 0) {
    formattedTime += '${hours.toString().padLeft(2, '0')} hour ';
  }
  if (minutes > 0 || hours > 0) {
    formattedTime += '${minutes.toString().padLeft(2, '0')} mins ';
  }
  formattedTime += '${remainingSeconds.toString().padLeft(2, '0')} sec';
  return formattedTime;
}

void launchPhone(String phoneNumber) async {
  final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
  if (await canLaunchUrl(phoneUri)) {
    await launchUrl(phoneUri);
  } else {
    throw 'Could not launch phone dialer';
  }
}