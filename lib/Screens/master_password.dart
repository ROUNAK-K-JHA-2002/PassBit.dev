import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:passwordmanager/Screens/biometrics.dart';
import 'package:passwordmanager/Services/User.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Services/LocalAuth.dart';
import '../widgets/bottom_button.dart';

class MasterPassword extends StatefulWidget {
  final bool isrouteFromLogin;
  const MasterPassword({super.key, required this.isrouteFromLogin});

  @override
  State<MasterPassword> createState() => _MasterPasswordState();
}

class _MasterPasswordState extends State<MasterPassword> {
  @override
  void initState() {
    super.initState();
    getMasterpassword();
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController masterPasswordController =
      TextEditingController();
  final TextEditingController reTypemasterPasswordController =
      TextEditingController();
  bool isMasterPasswordSaved = false;
  bool seePassword = true;
  bool seeReTypePassword = true;
  bool seeSavedMPassword = false;
  Icon visibleIcon = const Icon(Icons.visibility);
  Icon visibleOffIcon = const Icon(Icons.visibility_off);
  late String _password;
  double _strength = 0;

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");
  String? masterPassword;

  String _displayText = 'Please enter your password';
  void _checkPassword(String value) {
    _password = value.trim();

    if (_password.isEmpty) {
      setState(() {
        _strength = 0;
        _displayText = 'Please enter your password';
      });
    } else if (_password.length < 6) {
      setState(() {
        _strength = 1 / 4;
        _displayText = 'Your password is too short';
      });
    } else if (_password.length < 8) {
      setState(() {
        _strength = 2 / 4;
        _displayText = 'Your password is acceptable but not strong';
      });
    } else {
      if (!letterReg.hasMatch(_password) || !numReg.hasMatch(_password)) {
        setState(() {
          // Password length >= 8
          // But doesn't contain both letter and digit characters
          _strength = 3 / 4;
          _displayText = 'Your password is strong';
        });
      } else {
        // Password length >= 8
        // Password contains both letter and digit characters
        setState(() {
          _strength = 1;
          _displayText = 'Your password is great';
        });
      }
    }
  }

  void getMasterpassword() async {
    dynamic result = await getSavedMasterPassword();
    print(result + "sgsgsgs");
    if (result != null) {
      setState(() {
        masterPassword = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  "Add password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.black.withOpacity(0.5),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              " \tNote :",
              textAlign: TextAlign.start,
              style: TextStyle(
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
              "1. Master Password is the key Password to the App.\n2.Master Password cannot be uploaded or backed Up for security reasons, it will be stored in local storage.\n3. If you Forget the Master Password, everything will be lost.",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  color: Colors.grey.shade600),
            ),
          ),
          Divider(
            color: Colors.black.withOpacity(0.5),
          ),
          Visibility(
            visible: masterPassword == null ? true : false,
            child: Expanded(
                child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Enter Your Name",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp),
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
                    onChanged: (value) => _checkPassword(value),
                    obscureText: false,
                    controller: nameController,
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      hoverColor: Colors.black,
                      icon: const Icon(
                        Icons.person_2_rounded,
                        color: Colors.blueAccent,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'Enter Your Name',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 5.h,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Enter Master Password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp),
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
                    onChanged: (value) => _checkPassword(value),
                    obscureText: seePassword,
                    controller: masterPasswordController,
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      hoverColor: Colors.black,
                      icon: const Icon(
                        Icons.password,
                        color: Colors.blueAccent,
                      ),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (seePassword) {
                                seePassword = false;
                              } else {
                                seePassword = true;
                              }
                            });
                          },
                          child: seePassword ? visibleOffIcon : visibleIcon),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'Enter Master password',
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
                    obscureText: seeReTypePassword,
                    controller: reTypemasterPasswordController,
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      hoverColor: Colors.black,
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (seeReTypePassword) {
                                seeReTypePassword = false;
                              } else {
                                seeReTypePassword = true;
                              }
                            });
                          },
                          child:
                              seeReTypePassword ? visibleOffIcon : visibleIcon),
                      icon: const Icon(
                        Icons.password,
                        color: Colors.blueAccent,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'ReEnter Master Password',
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                  ),
                  child: LinearProgressIndicator(
                    value: _strength,
                    backgroundColor: Colors.grey[300],
                    color: _strength <= 1 / 4
                        ? Colors.red
                        : _strength == 2 / 4
                            ? Colors.yellow
                            : _strength == 3 / 4
                                ? Colors.blue
                                : Colors.green,
                    minHeight: 10,
                  ),
                ),

                // The message about the strength of the entered password
                Text(
                  _displayText,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      color: Colors.grey.shade600),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                BottomButton(
                    text: "Save Data",
                    onTap: () async {
                      if (masterPasswordController.text !=
                          reTypemasterPasswordController.text) {
                        Fluttertoast.showToast(
                            msg: "Error! Passwords do not Match",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.sp);
                      } else if (_strength == 1 / 4) {
                        Fluttertoast.showToast(
                            msg: "Error! Passwords is not Strong enough",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.sp);
                      } else if (nameController.text.isEmpty ||
                          masterPasswordController.text.isEmpty ||
                          reTypemasterPasswordController.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Error! Enter All Data",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.sp);
                      } else {
                        final isMPSaved = await saveMasterPassword(
                            masterPasswordController.text);
                        final isUserNamedSaved =
                            await saveUserName(nameController.text);
                        print("ssss" + isUserNamedSaved.toString());
                        setState(() {
                          isMasterPasswordSaved = isMPSaved;
                          if (isMasterPasswordSaved && isUserNamedSaved) {
                            Fluttertoast.showToast(
                                msg: "Details Saved Successfully",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.TOP,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.sp);
                          } else {
                            Fluttertoast.showToast(
                                msg: "Error! try again",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.TOP,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.sp);
                          }
                          if (widget.isrouteFromLogin) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Setbiometrics(
                                      isloginRoute: true,
                                    )));
                          } else {
                            Navigator.of(context).pop();
                          }
                        });
                      }
                    })
              ],
            )),
          ),
          Visibility(
              visible: masterPassword == null ? false : true,
              child: Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "\tYour Master password is sucessfully set!",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.sp),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 2.h),
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 1.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blue.withOpacity(0.2)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "\tYour Master password is : ",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.sp),
                                  ),
                                  GestureDetector(
                                      onTap: () async {
                                        final isAuth =
                                            await LocalAuth().authenticate();
                                        if (isAuth) {
                                          setState(() {
                                            if (seeSavedMPassword) {
                                              seeSavedMPassword = false;
                                            } else {
                                              seeSavedMPassword = true;
                                            }
                                          });
                                        }
                                      },
                                      child: seeSavedMPassword
                                          ? visibleOffIcon
                                          : visibleIcon),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                seeSavedMPassword
                                    ? masterPassword.toString()
                                    : "***********",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.sp),
                              ),
                            ],
                          )),
                      const Expanded(child: SizedBox()),
                      BottomButton(
                          text: "Change Master Password",
                          onTap: () {
                            setState(() {
                              masterPassword = null;
                            });
                          })
                    ]),
              ))
        ],
      )),
    );
  }
}
