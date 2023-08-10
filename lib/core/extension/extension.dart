import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension FileManilupationSize on List<File>? {
  File? get getFirstOrNull {
    if (this != null && this!.isNotEmpty) {
      return this!.first;
    }
    return null;
  }
}

extension PaddingExt on num{
  Widget get verticalSpace => SizedBox(height: toDouble().h,);
  Widget get horizontalSpace => SizedBox(width: toDouble().w,);
}

extension StringManipulation on String {
  String get toCapitalizeFirst {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  String get toCapitalizeEachWord {
    if (isEmpty) {
      return this;
    } else {
      List<String> s = split(" ");
      List<String> newS = [];
      for (var element in s) {
        newS.add(element[0].toUpperCase() + element.substring(1).toLowerCase());
      }
      return newS.join(" ");
    }
  }

  String get wordToSentence {
    if (isEmpty) {
      return this;
    } else {
      String b = split("")
          .map(
            (e) => e.contains(RegExp(r'[A-Z]')) ? "-$e" : e,
      )
          .toList()
          .join("")
          .split("-")
          .join(" ");
      return b;
    }
  }

  String get formatEmailToStar {
    List<String> parts = split('@');
    if (parts.length != 2) {
      return this;
    }

    String localPart = parts[0];
    String domainPart = parts[1];

    String firstCharacter = localPart.substring(0, 1);
    String maskedLocalPart = '$firstCharacter*****';
    return '$maskedLocalPart@$domainPart';
  }

  String get getFirstName {
    List<String> parts = split(' ');
    if (parts.length <= 1) {
      return this;
    }
    return parts[0];
  }

  String get getLastName {
    List<String> parts = split(' ');
    if (parts.length <= 1) {
      return '';
    }

    parts.removeAt(0);
    return parts.join(' ');
  }

  String get toOneWord {
    List<String> parts = split(' ');
    return parts.join("");
  }

  String get extention {
    List<String> dd = split(".");
    if (dd.length >= 2) {
      return dd.last;
    }
    return "";
  }

  String get fileName {
    List<String> dd = split("/");
    if (dd.length >= 2) {
      return dd.last;
    }
    return "";
  }

  bool get isPdf {
    if (extention == "pdf") return true;
    return false;
  }

  bool get isImage {
    if (extention == "jpg" || extention == "jpeg" || extention == "png" || extention=="webp") {
      return true;
    }
    return false;
  }

  String? get isNotEmptyOrNull => isEmpty ? null : this;
}

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);
}

extension FileSize on File? {
  String? get fileSize {
    if (this != null) {
      int totalBytes = this!.readAsBytesSync().lengthInBytes;
      int totalKB = totalBytes ~/ 1000;
      if (totalKB >= 1000) {
        int totalMB = totalKB ~/ 1000;
        return "$totalMB MB";
      }
      return "$totalKB KB";
    }
    return null;
  }
}

extension IntManipulation on int {
  String get formatTime {
    if (isNegative) return "$this";
    int hours = (this / 3600).floor();
    int minutes = ((this % 3600) / 60).floor();
    int seconds = (this % 60);
    String hoursStr = (hours % 24).toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    return '$hoursStr:$minutesStr:$secondsStr';
  }

  String get formatTimeToMinAndHr {
    if (isNegative) return "$this";
    int hours = (this / 3600).floor();
    int minutes = ((this % 3600) / 60).floor();
    int seconds = (this % 60);

    String hoursStr = (hours % 24).toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    return '${hours > 0 ? "$hoursStr hrs " : ""}$minutesStr mins $secondsStr secs';
  }
}

extension DateFormatExtention on DateTime {
  String toFormattedString([String? newPattern]) {
    return DateFormat(newPattern).format(this);
  }
}
