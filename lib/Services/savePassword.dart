// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/save_password.dart';

const storage = FlutterSecureStorage();

Future<void> savePassword(String provider, PasswordModel passwordModel) async {
  await storage.write(key: provider, value: json.encode(passwordModel));
  debugPrint(json.encode(passwordModel));
}

Future<List> getAllPassword() async {
  List<Map<String, dynamic>> list = [];
  Map<String, dynamic> ss = await const FlutterSecureStorage().readAll();
  ss.forEach((key, value) {
    dynamic temp = value;
    if (temp.toString()[0] == "{") {
      list.add(json.decode(value));
    }
  });
  return list;
}
