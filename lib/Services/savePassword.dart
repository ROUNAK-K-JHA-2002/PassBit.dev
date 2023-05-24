// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

Future<void> savePassword(
    String userName, String provider, String password) async {
  Map<String, dynamic> data = {
    "username": userName,
    "provider": provider,
    "password": password
  };
  debugPrint(data.toString());
  await storage.write(key: provider, value: data.toString());
  debugPrint("Saved");
}

Future<void> getPassword(String provider) async {
  String? result = await storage.read(key: provider);
  // print(json.encoder(result));
}
