import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuth {
  static final _auth = LocalAuthentication();
  Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } catch (e) {
      return false;
    }
  }

  Future<bool> authenticate() async {
    final isAvlailable = await hasBiometrics();
    if (!isAvlailable) return false;
    try {
      return await _auth.authenticate(
          localizedReason: "Scan Fingerprint to Continue",
          options: const AuthenticationOptions(
              useErrorDialogs: true, stickyAuth: true, biometricOnly: true));
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }
}
