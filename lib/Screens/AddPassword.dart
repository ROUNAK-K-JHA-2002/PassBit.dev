import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passwordmanager/Screens/setMasterPassword.dart';
import 'package:passwordmanager/widgets/bottomButton.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddPassword extends StatefulWidget {
  const AddPassword({super.key});

  @override
  State<AddPassword> createState() => _AddPasswordState();
}

class _AddPasswordState extends State<AddPassword> {
  final TextEditingController accountController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 5.h,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Add password",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.publicSans(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp)),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(0.5),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                " \tNote :",
                textAlign: TextAlign.start,
                style: GoogleFonts.workSans(
                    textStyle: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Text(
                "1. Every Data you enter here is processed offline.\n2. Nothing will be upload to our servers, except when you allow in the settings.\n3. Please backup before you clear App data or uninstall the app, otherwise everything will be lost.",
                style: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        color: Colors.grey.shade600)),
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(0.5),
            ),
            Container(
              height: 5.h,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enter Data",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.publicSans(
                        textStyle: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp)),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue.withOpacity(0.2)),
              child: TextField(
                controller: accountController,
                decoration: InputDecoration(
                  fillColor: Colors.black,
                  hoverColor: Colors.black,
                  icon: const Icon(
                    Icons.account_balance,
                    color: Colors.blueAccent,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  hintText: 'Account Name',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue.withOpacity(0.2)),
              child: TextField(
                controller: userNameController,
                decoration: InputDecoration(
                  fillColor: Colors.black,
                  hoverColor: Colors.black,
                  icon: const Icon(
                    Icons.person,
                    color: Colors.blueAccent,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  hintText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue.withOpacity(0.2)),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                decoration: InputDecoration(
                  fillColor: Colors.black,
                  hoverColor: Colors.black,
                  icon: const Icon(
                    Icons.password,
                    color: Colors.blueAccent,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  hintText: 'Password',
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            BottomButton(text: "Save Data", onTap: () {})
          ],
        ),
      )),
    );
  }
}
