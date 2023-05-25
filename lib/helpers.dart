import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

List<String> providerNames = ['Google', 'Facebook', 'Snapchat'];

/// Construct a color from a hex code string, of the format #RRGGBB.
Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

const bgImage = AssetImage("assets/abstractBg-min.jpg");
void showSuccess(context, message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

void showError(context, message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

String generatePassoword(int len, bool isUppC, bool isLowC, bool isNum,
    bool isSym, BuildContext context) {
  Random rndm = Random();
  String specialSymbols = '!@#\$%^&*()';
  String upperAlph = 'QWERTYUIOPLKJHGFDSAZXCVBNM';
  String lowerAlph = 'mnbvcxzasdfghjklpoiuytrewq';
  String numbers = "0123654987";
  List<String> items = [specialSymbols, upperAlph, lowerAlph, numbers];

  String password = "";
  if (!isUppC) {
    items.remove(upperAlph);
  }
  if (!isLowC) {
    items.remove(lowerAlph);
  }
  if (!isNum) {
    items.remove(numbers);
  }
  if (!isSym) {
    items.remove(specialSymbols);
  }
  if (!isLowC && !isUppC && !isSym && !isNum) {
    showError(context, "Select atleast 1 value");
  } else {
    while (password.length != len) {
      int j =
          rndm.nextInt(items.length); // Selecting any of four items randomly
      int i = items[j].length;
      password = password +
          items[j][rndm.nextInt(
              i)]; //selecting any character fromthat srandomly selected item
    }
  }
  return password;
}

List<String> accountType = [
  'Account Type',
  'Sensitive Account',
  'Social Apps',
  'Other Apps'
];
