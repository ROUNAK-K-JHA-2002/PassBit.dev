// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:passwordmanager/Screens/master_password.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Services/firebase_services.dart';
import '../helpers.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void handleLogin() async {
    dynamic user = await FirebaseServices().SignInWithGoogle();
    if (user != null) {
      final json = {
        "name": FirebaseAuth.instance.currentUser!.displayName,
        "email": FirebaseAuth.instance.currentUser!.email,
      };
      try {
        final userCollection = FirebaseFirestore.instance.collection("users");
        await userCollection
            .doc("${FirebaseAuth.instance.currentUser!.displayName}")
            .set(json);
        showSuccess(context, "Login Sucessful");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => const MasterPassword(
                      isrouteFromLogin: true,
                    )),
            (Route route) => false);
      } catch (e) {
        showError(context, "Error Try Again");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(image: bgImage, fit: BoxFit.cover)),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const Expanded(child: SizedBox()),
          Image(
            image: const AssetImage(
              'assets/loginImg.png',
            ),
            height: 35.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 4.w),
            child: Text(
              "Enhance Safety \nwith \nTotal Security",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 23.sp,
                  letterSpacing: 1.2,
                  height: 1.1,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
          ),
          const Expanded(child: SizedBox()),
          Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 3.w),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: Text(
                      "Never Forget Your Password Anymore",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18.sp,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                    child: Text(
                      "A password Manager built for your privacy and security",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Comfortaa-Regular',
                          fontSize: 17.sp,
                          color: Colors.grey.shade600),
                    ),
                  ),
                  GestureDetector(
                    onTap: handleLogin,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 1.5.h, horizontal: 2.w),
                      margin:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 15.w),
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
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontFamily: 'Montserrat',
                              ),
                            )
                          ]),
                    ),
                  ),
                ],
              )),
          const Expanded(flex: 4, child: SizedBox()),
        ]),
      ),
    );
  }
}
