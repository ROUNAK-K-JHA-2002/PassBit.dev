import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Services/savePassword.dart';
import '../widgets/bottom_button.dart';
import '../widgets/homepage_tile.dart';
import '../widgets/textField.dart';

class SearchPasswords extends StatefulWidget {
  const SearchPasswords({super.key});

  @override
  State<SearchPasswords> createState() => _SearchPasswordsState();
}

List storedPassword = [];

class _SearchPasswordsState extends State<SearchPasswords> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getAllPassword().then((value) => setState(
          () {
            storedPassword = value;
          },
        ));
  }

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
                    controller: searchController,
                    hintText: "Search by Account Provider"),
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
            SizedBox(
              height: 66.h,
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
                  return HomePageTile(
                    text: "${storedPassword[index]['accountProvider']}",
                    userName: "${storedPassword[index]['username']}",
                    imageUrl: 'assets/providerIcons/$imageName.png',
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
