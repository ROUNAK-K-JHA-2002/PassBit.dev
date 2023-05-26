// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:passwordmanager/Screens/generate_password.dart';
import 'package:passwordmanager/Screens/login.dart';
import 'package:passwordmanager/Screens/manage_settings.dart';
import 'package:passwordmanager/Screens/master_password.dart';
import 'package:passwordmanager/Services/firebase_services.dart';
import 'package:passwordmanager/widgets/tile_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../helpers.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 5.h,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Profile",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.white.withOpacity(0.5),
          ),
          Container(
              // height: 17.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Row(children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage("${user!.photoURL}"),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                        "${user!.displayName}",
                        style: TextStyle(
                            fontFamily: 'Comfortaa-Regular',
                            fontSize: 18.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${user!.email}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: 'Comfortaa-Regular',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey.shade600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ])),
              ])),
          Expanded(
              child: Column(children: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ManageSettings(
                            isloginRoute: false,
                          )));
                },
                child: const TileWidget(
                    icon: Icons.settings, text: "Manage Settings")),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MasterPassword(
                            isrouteFromLogin: false,
                          )));
                },
                child: const TileWidget(
                    icon: Icons.lock, text: "Master Password")),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const GeneratePassword(
                            text: "Instagram",
                            userName: "__rounak.k.jha_8683__",
                            imageUrl:
                                'https://cdn3.iconfinder.com/data/icons/2018-social-media-logotypes/1000/2018_social_media_popular_app_logo_instagram-256.png',
                          )));
                },
                child: const TileWidget(
                    icon: Icons.handyman, text: "Generate Password")),
            GestureDetector(
                child: const TileWidget(
                    icon: Icons.security, text: "Privacy Terms")),
            GestureDetector(
                child: const TileWidget(
                    icon: Icons.contact_mail, text: "Developer Contact")),
            GestureDetector(
                onTap: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Log out'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const <Widget>[
                              Text('Are you sure want to Logout?'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('No'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Yes'),
                            onPressed: () async {
                              await FirebaseServices().signOut();
                              await const FlutterSecureStorage().deleteAll();
                              bottomNavbarIndex.value = 0;

                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const Login()),
                                  (Route route) => false);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const TileWidget(icon: Icons.error, text: "Logout"))
          ]))
        ],
      )),
    );
  }
}
