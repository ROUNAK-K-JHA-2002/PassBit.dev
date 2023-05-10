import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passwordmanager/Utils/Colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Services/LocalAuth.dart';
import '../Services/User.dart';
import '../widgets/bottomButton.dart';

class ManageSettings extends StatefulWidget {
  const ManageSettings({super.key});

  @override
  State<ManageSettings> createState() => _ManageSettingsState();
}

class _ManageSettingsState extends State<ManageSettings> {
  bool isDarkModeAllowed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkModeAllowed ? bgDarkTheme : bgLightTheme,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 5.h,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Manage General Settings",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.publicSans(
                      textStyle: TextStyle(
                          color: isDarkModeAllowed
                              ? textDarkTheme
                              : textLightTheme,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp)),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.black.withOpacity(0.5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Use Dark Theme",
                style: GoogleFonts.workSans(
                    textStyle: TextStyle(
                        color:
                            isDarkModeAllowed ? textDarkTheme : textLightTheme,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp)),
              ),
              SizedBox(
                width: 25.w,
              ),
              CupertinoSwitch(
                  value: isDarkModeAllowed,
                  onChanged: (bool value) {
                    setState(() {
                      if (isDarkModeAllowed) {
                        isDarkModeAllowed = false;
                      } else {
                        isDarkModeAllowed = true;
                      }
                    });
                  })
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Text(
              "Use the app in dark mode.This helps is less strain on your eyes.",
              style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      color: Colors.grey.shade600)),
            ),
          ),
          Expanded(child: SizedBox()),
          BottomButton(
            onTap: () async {
              final isAuth = await LocalAuth().authenticate();
              debugPrint(isAuth.toString());
              if (isAuth) {
                bool taskComplete =
                    await saveBiometricSetting(isDarkModeAllowed.toString());
                if (taskComplete) {
                  Fluttertoast.showToast(
                      msg: "Settings Saved Successfully",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.sp);
                  Navigator.of(context).pop();
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
            },
            text: 'Save Setting',
          )
        ],
      )),
    );
    ;
  }
}
