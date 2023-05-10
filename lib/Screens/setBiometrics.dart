import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passwordmanager/Services/User.dart';
import 'package:passwordmanager/widgets/bottomButton.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Services/LocalAuth.dart';

class Setbiometrics extends StatefulWidget {
  const Setbiometrics({super.key});

  @override
  State<Setbiometrics> createState() => _SetbiometricsState();
}

class _SetbiometricsState extends State<Setbiometrics> {
  bool isallowed = false;
  @override
  void initState() {
    super.initState();
    readSettings();
  }

  void readSettings() {
    readBiometricSetting().then((value) {
      setState(() {
        isallowed = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Change Biometrics Settings",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.publicSans(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.sp)),
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
                "Use Biometrics to Open App",
                style: GoogleFonts.workSans(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.sp)),
              ),
              CupertinoSwitch(
                  value: isallowed,
                  onChanged: (bool value) {
                    print(value);
                    setState(() {
                      if (isallowed) {
                        isallowed = false;
                      } else {
                        isallowed = true;
                      }
                    });
                  })
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Text(
              "After Allowing this setting, Fingerprint will be required each time you open the app.",
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
                    await saveBiometricSetting(isallowed.toString());
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
  }
}
