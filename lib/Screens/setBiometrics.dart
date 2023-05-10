import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passwordmanager/widgets/bottomButton.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Setbiometrics extends StatefulWidget {
  const Setbiometrics({super.key});

  @override
  State<Setbiometrics> createState() => _SetbiometricsState();
}

class _SetbiometricsState extends State<Setbiometrics> {
  bool isallowed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 6.h,
            padding: EdgeInsets.symmetric(vertical: 1.5.h),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Change Biometrics Settings",
              textAlign: TextAlign.center,
              style: GoogleFonts.workSans(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp)),
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
            text: 'Save Setting',
          )
        ],
      )),
    );
  }
}
