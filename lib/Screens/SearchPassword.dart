import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/bottom_button.dart';
import '../widgets/homepage_tile.dart';
import '../widgets/textField.dart';

class SearchPasswords extends StatefulWidget {
  const SearchPasswords({super.key});

  @override
  State<SearchPasswords> createState() => _SearchPasswordsState();
}

class _SearchPasswordsState extends State<SearchPasswords> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              height: 5.h,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Saved Passwords",
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
              margin: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 1.w),
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
                    padding:
                        EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 1.w),
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
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              padding: EdgeInsets.symmetric(vertical: 7.w, horizontal: 3.w),
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
    );
  }
}
