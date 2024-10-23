import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import '../my_app.dart';
import 'constants.dart';

DateTime parseFromStringServerDateFormat(String date) =>
    DateFormat(Constants.serverDateFormat).parse(date);

void dPrint(String message, {int level = 1, String? tag}) {
  if (kDebugMode) {
    var a = StackTrace.current;
    final regexCodeLine = RegExp(r" (\(.*\))$");
    var i = regexCodeLine
        .stringMatch(a.toString().split("\n")[level])
        .toString()
        .replaceAll("(", "")
        .replaceAll(")", "")
        .trim() /*.split("/")*/;
    var tPrent = "$i\n${tag != null ? tag + ": " : ""}$message";
    if (message.length > 1000) {
      log(tPrent);
    } else {
      print(tPrent);
    }
  }
}

bool isEmailValid(String mail) =>
    RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(mail);

bool isPhoneValid(String phone) =>
    RegExp(r"^01[0125][0-9]{8}$").hasMatch(phone);

PasswordStatus validatePassword(String password) {
  final RegExp letterRegex = RegExp('[a-zA-Z]');
  final RegExp digitRegex = RegExp('[0-9]');
  var status = PasswordStatus();

  // Check length
  if (password.length < 8) {
    status.numberOfLetters = false;
  }

  // Check for at least one letter
  if (!letterRegex.hasMatch(password)) {
    status.hasLetters = false;
  }

  // Check for at least one number, only if letter check is already failed
  if (status.hasLetters && !digitRegex.hasMatch(password)) {
    status.hasNumbers = false;
  }

  return status;
}

class PasswordStatus {
   bool numberOfLetters;
   bool hasLetters;
   bool hasNumbers;

   PasswordStatus({
     this.hasLetters=true,
     this.hasNumbers=true,
     this.numberOfLetters=true
   }
);
}


UrlType getUrlType(String url) {
  String typeString = url
      .split('.')
      .last;
  if (typeString == "jpg" || typeString == "jpeg" || typeString == "png") {
    return UrlType.IMAGE;
  }
  if (typeString == "mp4") {
    return UrlType.VIDEO;
  } else {
    return UrlType.UNKNOWN;
  }
}

enum UrlType { IMAGE, VIDEO, UNKNOWN }

String? inputRequiredValidation(value) {
  value = value.toString().replaceAll("null", "");
  return value == null || (value is String && value.isEmpty) ? MyApp.tr.reqField : null;
}


String? phoneInputRequiredValidation(value) {
  value = value.toString().replaceAll("null", "");
  return (value == null || (value is String && value.isEmpty)) || value.toString().length > 10  ? MyApp.tr.reqAndNo10 : null;
}