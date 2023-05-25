// ignore_for_file: use_build_context_synchronously

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:passwordmanager/Screens/home.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Services/local_auth.dart';
import '../Services/user.dart';
import '../helpers.dart';
import '../widgets/bottom_button.dart';

class ManageSettings extends StatefulWidget {
  final bool isloginRoute;
  const ManageSettings({super.key, required this.isloginRoute});

  @override
  State<ManageSettings> createState() => _ManageSettingsState();
}

class _ManageSettingsState extends State<ManageSettings> {
  final isBiometricallowed = ValueNotifier(false);
  final isOnlineModeAllowed = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    readSettings();
  }

  void readSettings() async {
    isBiometricallowed.value = await readBiometricSetting();
    isOnlineModeAllowed.value = await readOnlineSetting();
  }

  void handleSave() async {
    final isAuth = await LocalAuth().authenticate();
    debugPrint(isAuth.toString());
    if (isAuth) {
      bool taskComplete =
          await saveBiometricSetting(isBiometricallowed.value.toString()) &&
              await saveOnlineSetting(isOnlineModeAllowed.value.toString());
      if (taskComplete) {
        Fluttertoast.showToast(
            msg: "Settings Saved Successfully",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.sp);

        if (widget.isloginRoute) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomePage()),
              (Route route) => false);
        } else {
          Navigator.of(context).pop();
        }
      } else {
        Fluttertoast.showToast(
            msg: "Error! Please try again",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white,
            fontSize: 16.sp);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken),
                image: bgImage,
                fit: BoxFit.cover)),
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 5.h,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Manage General Settings",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white.withOpacity(0.5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  "Sync Data Online (Backup)",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp),
                ),
                SizedBox(
                  width: 23.w,
                ),
                ValueListenableBuilder(
                  valueListenable: isOnlineModeAllowed,
                  builder: (context, value, child) {
                    return CupertinoSwitch(
                        thumbColor: Colors.green,
                        trackColor: Colors.white,
                        activeColor: Colors.blueAccent,
                        value: isOnlineModeAllowed.value,
                        onChanged: (bool value) {
                          isOnlineModeAllowed.value =
                              !isOnlineModeAllowed.value;
                        });
                  },
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 4.5.w),
              child: Text(
                "Upload All your Passwords (except Master Password ) in Encrypted Form to our database.You can Also Delete Your Data from Our Servers.",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    color: Colors.grey.shade500),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(),
                Text(
                  "Use Biometrics to Open App",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 9.w,
                ),
                ValueListenableBuilder(
                  valueListenable: isBiometricallowed,
                  builder: (context, value, child) {
                    return CupertinoSwitch(
                        thumbColor: Colors.green,
                        trackColor: Colors.white,
                        activeColor: Colors.blueAccent,
                        value: isBiometricallowed.value,
                        onChanged: (bool value) {
                          isBiometricallowed.value = !isBiometricallowed.value;
                        });
                  },
                )
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(
                "After Allowing this setting, Fingerprint will be required each time you open the app.",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    color: Colors.grey.shade500),
              ),
            ),
            const Expanded(child: SizedBox()),
            BottomButton(
              onTap: handleSave,
              text: 'Save Setting',
            )
          ],
        )),
      ),
    );
    ;
  }
}
