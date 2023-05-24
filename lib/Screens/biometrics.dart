import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:passwordmanager/Screens/home.dart';
import 'package:passwordmanager/Services/User.dart';
import 'package:passwordmanager/widgets/bottom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Services/LocalAuth.dart';

class Setbiometrics extends StatefulWidget {
  final bool isloginRoute;
  const Setbiometrics({super.key, required this.isloginRoute});

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

  void readSettings() async {
    dynamic result = await readBiometricSetting();
    setState(() {
      isallowed = result;
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
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
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
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  color: Colors.grey.shade600),
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
                  if (widget.isloginRoute) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomePage()));
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
            },
            text: 'Save Setting',
          )
        ],
      )),
    );
  }
}
