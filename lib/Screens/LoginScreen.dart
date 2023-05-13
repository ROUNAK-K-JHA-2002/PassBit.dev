import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passwordmanager/Screens/setMasterPassword.dart';
import 'package:passwordmanager/Services/User.dart';
import 'package:passwordmanager/widgets/bottomButton.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 255, 49, 49),
            Color.fromARGB(255, 181, 5, 245)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Expanded(child: SizedBox()),
          Image(
            image: const AssetImage(
              'assets/lockpasscode.jpg',
            ),
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
            child: Text(
              "Keep all your password in one place.\n Safe and sound",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(fontSize: 17.sp, color: Colors.white)),
            ),
          ),
          Expanded(child: SizedBox()),
          Container(
            height: 35.h,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 5.0,
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Text(
                  "Never Forget Your Password Anymore",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(fontSize: 20.sp)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                child: Text(
                  "A password Manager built for your privacy and security",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontSize: 17.sp, color: Colors.grey.shade700)),
                ),
              ),
              BottomButton(
                  text: "Get Started",
                  onTap: () async {
                    final bool result = await saveFirstTimeUser("true");

                    if (result) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) =>
                              const MasterPassword(isrouteFromLogin: true)));
                    }
                  })
            ]),
          )
        ]),
      ),
    );
  }
}
