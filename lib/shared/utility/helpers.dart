part of '../shared.dart';

dynamic condition({bool value, dynamic onTrue, dynamic onFalse}) {
  return (value) ? onTrue : onFalse;
}

bool isEmail(String p1) {
  RegExp regex = RegExp(emailPattern);

  if (!regex.hasMatch(p1) || p1 == null) {
    return false;
  } else {
    return true;
  }
}

bool checkLengthString(String p1, {int length}) {
  bool isValid = true;

  if (p1.length < length ?? 2) {
    isValid = false;
  }

  return isValid;
}
