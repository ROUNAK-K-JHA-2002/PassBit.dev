// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:passwordmanager/helpers.dart';
import 'package:passwordmanager/models/save_password.dart';
import 'package:passwordmanager/widgets/textField.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../Services/savePassword.dart';
import '../widgets/homepage_tile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

List storedPassword = [];
int sensitiveAppCount = 0;
int socialAppCount = 0;

class _DashboardState extends State<Dashboard> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getAllPassword().then((value) => setState(
          () {
            storedPassword = value;
            for (var element in value) {
              if (element['accountType'] == "Sensitive Account") {
                sensitiveAppCount += 1;
              } else if (element['accountType'] == "Social Apps") {
                socialAppCount += 1;
              }
            }
          },
        ));
  }

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
      body: SizedBox(
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
                      onTap: () {},
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
                                  color: Colors.blue.shade200.withOpacity(0.4),
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
                                  color: Colors.white, shape: BoxShape.circle),
                              child: const Icon(
                                Icons.key_off_rounded,
                              )),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Text(
                            "${storedPassword.length} \nPasswords \nAdded",
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
                                  color: Colors.white, shape: BoxShape.circle),
                              child: const Icon(
                                Icons.apps,
                              )),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Text(
                            "$sensitiveAppCount \nSensitive \nApps",
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
                                  color: Colors.green.shade200.withOpacity(0.5),
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
                                  color: Colors.white, shape: BoxShape.circle),
                              child: const Icon(
                                Icons.groups,
                              )),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Text(
                            "$socialAppCount \nSocial \nApps",
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
                  padding: EdgeInsets.symmetric(vertical: 7.w, horizontal: 5.w),
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
                    GestureDetector(
                      onTap: () {
                        bottomNavbarIndex.value = 2;
                      },
                      child: Text(
                        "show All",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            height: 1,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp),
                      ),
                    ),
                  ]),
                ),
                Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                      itemCount:
                          storedPassword.length < 4 ? storedPassword.length : 4,
                      itemBuilder: (context, index) {
                        final accountProvider = storedPassword[index]
                                ['accountProvider']
                            .toString()
                            .replaceAll(" ", "")
                            .toLowerCase();
                        final imageName = accountProvider[0].toUpperCase() +
                            accountProvider.substring(1);
                        if (storedPassword.isEmpty) {
                          return Center(
                            child: Text(
                              "No Password Added!",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  height: 1,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20.sp),
                            ),
                          );
                        } else {
                          return HomePageTile(
                            password: "${storedPassword[index]['password']}",
                            text: "${storedPassword[index]['accountProvider']}",
                            userName: "${storedPassword[index]['username']}",
                            imageUrl: 'assets/providerIcons/$imageName.png',
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
