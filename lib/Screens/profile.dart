import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:passwordmanager/Screens/login.dart';
import 'package:passwordmanager/Screens/manage_settings.dart';
import 'package:passwordmanager/Screens/biometrics.dart';
import 'package:passwordmanager/Screens/master_password.dart';
import 'package:passwordmanager/widgets/tile_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // print(user!.displayName);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 253, 247),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 17.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20,
                      color: Colors.grey.shade400,
                      offset: const Offset(5, 5),
                      spreadRadius: 1)
                ]),
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Row(children: [
              // ClipRRect(
              //     borderRadius: BorderRadius.circular(50),
              //     child: Image(
              //       image: NetworkImage("Rounak"),
              //       fit: BoxFit.cover,
              //     )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   "$userName",
                  //   style: GoogleFonts.comfortaa(
                  //       textStyle: TextStyle(
                  //           fontSize: 18.sp, fontWeight: FontWeight.w700)),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "hhhhhhh",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade600),
                  )
                ],
              ))
            ]),
          ),
          Expanded(
              child: Container(
            child: Column(children: [
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ManageSettings()));
                  },
                  child: const TileWidget(
                      icon: Icons.settings, text: "Manage Settings")),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Setbiometrics(
                              isloginRoute: false,
                            )));
                  },
                  child: const TileWidget(
                      icon: Icons.fingerprint, text: "Set Biometrics")),
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
                                await const FlutterSecureStorage().deleteAll();
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => const Login()));
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const TileWidget(icon: Icons.error, text: "Logout"))
            ]),
          ))
        ],
      )),
    );
  }
}
