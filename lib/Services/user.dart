import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

Future<bool> saveBiometricSetting(String value) async {
  try {
    await storage.write(key: "ALLOW_BIOMETRIC", value: value);
    return true;
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> saveOnlineSetting(String value) async {
  try {
    await storage.write(key: "ALLOW_ONLINE", value: value);
    return true;
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> saveFirstTimeUser(String value) async {
  try {
    await storage.write(key: "FIRST_TIME_USER", value: value);
    return true;
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> isFirstTimeUser() async {
  try {
    String? result = await storage.read(key: "FIRST_TIME_USER");
    debugPrint(result);
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

Future<bool> readBiometricSetting() async {
  try {
    String? result = await storage.read(key: "ALLOW_BIOMETRIC");
    debugPrint(result);
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

Future<bool> readOnlineSetting() async {
  try {
    String? result = await storage.read(key: "ALLOW_ONLINE");
    debugPrint(result);
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

Future<bool> saveMasterPassword(String value) async {
  try {
    await storage.write(key: "MASTER_PASSWORD", value: value);
    return true;
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<String?> getSavedMasterPassword() async {
  try {
    String? result = await storage.read(key: "MASTER_PASSWORD");
    debugPrint(result);
    if (result != null) {
      return result;
    } else {
      return null;
    }
  } catch (e) {
    debugPrint(e.toString());
    return null;
  }
}
