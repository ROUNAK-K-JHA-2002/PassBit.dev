// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:passwordmanager/helpers.dart';
import 'package:passwordmanager/widgets/textField.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/homepage_tile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final searchController = TextEditingController();

  /// Did Change Dependencies
  @override
  void didChangeDependencies() {
    precacheImage(bgImage, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
            height: 100.h,
            width: 100.w,
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                    child: Row(children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "Hello,\n${FirebaseAuth.instance.currentUser!.displayName}",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            height: 1,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18.sp),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      const Icon(
                        Icons.notifications_active_rounded,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "${FirebaseAuth.instance.currentUser!.photoURL}"),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                    ]),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 1.w),
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(children: [
                      TextFieldContainer(
                          controller: searchController, hintText: "Search ..."),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () async {
                          final json = {
                            "isFirstTimeUser": false,
                            "name": "user.displayName",
                            "email": "user.email",
                          };
                          try {
                            final userCollection =
                                FirebaseFirestore.instance.collection("users");
                            await userCollection.doc().set(json);
                            showSuccess(context, "Data Set");
                          } catch (e) {
                            showError(context, "message");
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 0.5.h, horizontal: 1.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueAccent,
                          ),
                          child: Icon(
                            Icons.manage_search,
                            size: 25.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 3.h, horizontal: 1.5.w),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 2.w),
                          padding: EdgeInsets.symmetric(
                              vertical: 5.w, horizontal: 5.w),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Colors.blue.shade200.withOpacity(0.4),
                                    spreadRadius: 1,
                                    offset: const Offset(2, 2),
                                    blurRadius: 15)
                              ],
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 3, 70, 214),
                                  Color.fromARGB(255, 103, 184, 250)
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(children: [
                            Container(
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.key_off_rounded,
                                )),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            Text(
                              "4 \nPasswords \nAdded",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Comfortaa-Regular',
                                  height: 1,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp),
                            ),
                          ]),
                        )),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 2.w),
                          padding: EdgeInsets.symmetric(
                              vertical: 5.w, horizontal: 5.w),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Colors.purple.shade200.withOpacity(0.5),
                                    spreadRadius: 2,
                                    offset: const Offset(3, 2),
                                    blurRadius: 20)
                              ],
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 232, 29, 73),
                                  Color.fromARGB(255, 250, 161, 222)
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(children: [
                            Container(
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.apps,
                                )),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            Text(
                              "2 \nSensitive \nApps",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Comfortaa-Regular',
                                  height: 1,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp),
                            ),
                          ]),
                        )),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 2.w),
                          padding: EdgeInsets.symmetric(
                              vertical: 5.w, horizontal: 5.w),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Colors.green.shade200.withOpacity(0.5),
                                    spreadRadius: 2,
                                    offset: const Offset(3, 2),
                                    blurRadius: 20)
                              ],
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 18, 150, 24),
                                  Color.fromARGB(255, 208, 255, 210)
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(children: [
                            Container(
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.groups,
                                )),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            Text(
                              "1 \nSocial \nApps",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Comfortaa-Regular',
                                  height: 1,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp),
                            ),
                          ]),
                        )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                    padding:
                        EdgeInsets.symmetric(vertical: 7.w, horizontal: 5.w),
                    child: Row(children: [
                      Text(
                        "Recently Added",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            height: 1,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 17.sp),
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        "show All",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            height: 1,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp),
                      ),
                    ]),
                  ),
                  const HomePageTile(
                    text: "Google",
                    userName: "Dextrix Developer",
                    imageUrl:
                        'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
                  ),
                  const HomePageTile(
                    text: "Facebook",
                    userName: "anjanajha291202.rar@gmail.com",
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1024px-Facebook_Logo_%282019%29.png',
                  ),
                  const HomePageTile(
                    text: "Instagram",
                    userName: "__rounak.k.jha_8683__",
                    imageUrl:
                        'https://cdn3.iconfinder.com/data/icons/2018-social-media-logotypes/1000/2018_social_media_popular_app_logo_instagram-256.png',
                  ),
                  const HomePageTile(
                    text: "LinkedIn",
                    userName: "rounak-jha-2200125896",
                    imageUrl:
                        'https://cdn2.iconfinder.com/data/icons/social-media-2285/512/1_Linkedin_unofficial_colored_svg-512.png',
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
