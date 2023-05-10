import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passwordmanager/Screens/home.dart';
import 'package:passwordmanager/Services/FirebaseServices.dart';
import 'package:passwordmanager/Utils/Colors.dart';
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
        child: Column(children: [
          const Expanded(child: SizedBox()),
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
            height: 40.h,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 235, 202, 213),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 246, 173, 197),
                Color.fromARGB(255, 235, 218, 202)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
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
              GestureDetector(
                onTap: () async {
                  dynamic user = await FirebaseServices().SignInWithGoogle();
                  if (user != null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomePage()));
                  }
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
                  margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 15.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: const AssetImage(
                            'assets/google.png',
                          ),
                          height: 3.5.h,
                        ),
                        Text(
                          "Sign In with Google",
                          style: TextStyle(fontSize: 17.sp),
                        )
                      ]),
                ),
              )
            ]),
          )
        ]),
      ),
    );
  }
}
