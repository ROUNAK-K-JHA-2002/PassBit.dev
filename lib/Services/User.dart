import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

Future<bool> saveBiometricSetting(String value) async {
  try {
    await storage.write(key: "biometricSetting", value: value);
    return true;
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> readBiometricSetting() async {
  try {
    String? result = await storage.read(key: "biometricSetting");
    print(result);
    if (result == "true") {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }
}
