import 'package:flutter/material.dart';
import 'package:passwordmanager/Services/savePassword.dart';
import 'package:passwordmanager/helpers.dart';
import 'package:passwordmanager/widgets/bottom_button.dart';
import 'package:passwordmanager/widgets/textField.dart';
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
  final dropdownValue = ValueNotifier(accountType[0]);
  void selectAccountType(String? value) {
    dropdownValue.value = value!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
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
                      "Add Password",
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
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  " \tNote :",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp),
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
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      color: Colors.grey.shade200),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.white.withOpacity(0.5),
              ),
              SizedBox(
                height: 5.h,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Enter Data",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 1.w),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 1.5.h, horizontal: 2.5.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueAccent,
                    ),
                    child: Icon(
                      Icons.add_card,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextFieldContainer(
                      controller: accountController, hintText: "Provider Name"),
                ]),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 1.w),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 1.5.h, horizontal: 2.5.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueAccent,
                    ),
                    child: Icon(
                      Icons.person_2_rounded,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextFieldContainer(
                      controller: userNameController, hintText: "Username"),
                ]),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 1.w),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 1.5.h, horizontal: 2.5.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueAccent,
                    ),
                    child: Icon(
                      Icons.password,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextFieldContainer(
                      controller: passwordController, hintText: "Password"),
                ]),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 1.w),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2.w),
                child: ValueListenableBuilder(
                    valueListenable: dropdownValue,
                    builder: (context, value, _) {
                      return Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.h, horizontal: 2.5.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blueAccent,
                            ),
                            child: Icon(
                              Icons.arrow_drop_down_circle,
                              size: 20.sp,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            width: 75.w,
                            margin: EdgeInsets.symmetric(
                                horizontal: 1.2.h, vertical: 0.5.h),
                            child: DropdownButtonFormField(
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                  fontFamily: 'Montserrat'),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 5.w),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                ),
                                filled: true,
                                fillColor: Colors.grey.shade200,
                              ),
                              value: dropdownValue.value,
                              onChanged: selectAccountType,
                              items: accountType
                                  .map((gender) => DropdownMenuItem(
                                      value: gender,
                                      child: Center(child: Text(gender))))
                                  .toList(),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 20.h,
              ),
              BottomButton(
                  text: "Save Data",
                  onTap: () {
                    if (userNameController.text.isEmpty ||
                        accountController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        dropdownValue.value == "Account Type") {
                      showError(context, "Error ! Enter All Values");
                    } else {
                      savePassword(
                          userNameController.text,
                          accountController.text,
                          passwordController.text,
                          dropdownValue.value);
                      showSuccess(context, "Details Saved Successfully");
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
