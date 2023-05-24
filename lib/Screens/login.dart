import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Services/firebase_services.dart';
import 'home.dart';

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
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(colors: [
        //     hexToColor("#603fef"),
        //     hexToColor("#8a2be2"),
        //   ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        // ),
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
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
            child: Text(
              "Enhance Safety \nwith \n Total Security",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.sp,
                  // color: Colors.white,
                  fontWeight: FontWeight.w100),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
          //   child: Text(
          //     "Keep all your password in one place.\n Safe and sound",
          //     textAlign: TextAlign.center,
          //     style: GoogleFonts.montserrat(
          //         textStyle: TextStyle(
          //             fontSize: 17.sp,
          //             // color: Colors.white,
          //             fontWeight: FontWeight.w500)),
          //   ),
          // ),
          const Expanded(child: SizedBox()),
          Container(
            height: 35.h,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
              color: Colors.white,
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey,
              //     offset: Offset(0.0, 1.0),
              //     blurRadius: 5.0,
              //   ),
              // ],
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Text(
                  "Never Forget Your Password Anymore",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                child: Text(
                  "A password Manager built for your privacy and security",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 17.sp, color: Colors.grey.shade700),
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
                      color: Colors.blue),
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
              ),
              // BottomButton(
              //     text: "Get Started",
              //     onTap: () async {
              //       final bool result = await saveFirstTimeUser("true");

              //       if (result) {
              //         Navigator.of(context).pushReplacement(MaterialPageRoute(
              //             builder: (context) =>
              //                 const MasterPassword(isrouteFromLogin: true)));
              //       }
              //     })
            ]),
          )
        ]),
      ),
    );
  }
}
