import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passwordmanager/widgets/bottom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../helpers.dart';

class GeneratePassword extends StatefulWidget {
  final String text;
  final String userName;
  final String imageUrl;
  const GeneratePassword(
      {super.key,
      required this.text,
      required this.userName,
      required this.imageUrl});

  @override
  State<GeneratePassword> createState() => _GeneratePasswordState();
}

class _GeneratePasswordState extends State<GeneratePassword> {
  final sliderValue = ValueNotifier(6.0);
  final generatedPassword = ValueNotifier("Move The Slider to generate");
  final isuppercaseAllowed = ValueNotifier(true);
  final islowercaseAllowed = ValueNotifier(true);
  final isnumbercaseAllowed = ValueNotifier(true);
  final issymbolcaseAllowed = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    CachedNetworkImage(
      imageUrl: widget.imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken),
                image: bgImage,
                fit: BoxFit.cover)),
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 5.h,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Generate Password",
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
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Text(
                "Generate a Unique and Strong Password , with our Flexible Password Generator",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 17.sp,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
              padding: EdgeInsets.symmetric(vertical: 7.w, horizontal: 4.w),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue.withOpacity(0.2),
              ),
              child: Column(
                children: [
                  Text(
                    "Your Password :",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
                        color: Colors.green),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  ValueListenableBuilder(
                      valueListenable: generatedPassword,
                      builder: (context, v, _) {
                        return Text(
                          generatedPassword.value == ""
                              ? "Select Correct Combination"
                              : generatedPassword.value,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Poppins-Regular',
                              fontWeight: FontWeight.bold,
                              fontSize: 19.sp,
                              color: Colors.white),
                        );
                      }),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            ValueListenableBuilder(
                valueListenable: sliderValue,
                builder: (context, value, _) {
                  return Column(
                    children: [
                      Text(
                        "Length of Password : ${sliderValue.value.toString().split(".")[0]}",
                        style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        width: double.maxFinite,
                        child: CupertinoSlider(
                          min: 6,
                          max: 20,
                          divisions: 14,
                          value: sliderValue.value,
                          onChanged: (value) => {
                            sliderValue.value = value,
                            generatedPassword.value = generatePassoword(
                                sliderValue.value.toInt(),
                                isuppercaseAllowed.value,
                                islowercaseAllowed.value,
                                isnumbercaseAllowed.value,
                                issymbolcaseAllowed.value,
                                context)
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ValueListenableBuilder(
                              valueListenable: isuppercaseAllowed,
                              builder: (context, value, _) {
                                return Row(
                                  children: [
                                    Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        side:
                                            MaterialStateBorderSide.resolveWith(
                                          (states) => const BorderSide(
                                              width: 1.0, color: Colors.white),
                                        ),
                                        value: isuppercaseAllowed.value,
                                        onChanged: (value) => {
                                              isuppercaseAllowed.value = value!,
                                              generatedPassword.value =
                                                  generatePassoword(
                                                      sliderValue.value.toInt(),
                                                      isuppercaseAllowed.value,
                                                      islowercaseAllowed.value,
                                                      isnumbercaseAllowed.value,
                                                      issymbolcaseAllowed.value,
                                                      context)
                                            }),
                                    Text(
                                      "UpperCase",
                                      style: TextStyle(
                                          fontFamily: 'Poppins-Regular',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp,
                                          color: Colors.white),
                                    ),
                                  ],
                                );
                              }),
                          ValueListenableBuilder(
                              valueListenable: islowercaseAllowed,
                              builder: (context, value, _) {
                                return Row(
                                  children: [
                                    Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        side:
                                            MaterialStateBorderSide.resolveWith(
                                          (states) => const BorderSide(
                                              width: 1.0, color: Colors.white),
                                        ),
                                        value: islowercaseAllowed.value,
                                        onChanged: (value) => {
                                              islowercaseAllowed.value = value!,
                                              generatedPassword.value =
                                                  generatePassoword(
                                                      sliderValue.value.toInt(),
                                                      isuppercaseAllowed.value,
                                                      islowercaseAllowed.value,
                                                      isnumbercaseAllowed.value,
                                                      issymbolcaseAllowed.value,
                                                      context)
                                            }),
                                    Text(
                                      "LowerCase",
                                      style: TextStyle(
                                          fontFamily: 'Poppins-Regular',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp,
                                          color: Colors.white),
                                    ),
                                  ],
                                );
                              }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ValueListenableBuilder(
                              valueListenable: isnumbercaseAllowed,
                              builder: (context, value, _) {
                                return Row(
                                  children: [
                                    Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        side:
                                            MaterialStateBorderSide.resolveWith(
                                          (states) => const BorderSide(
                                              width: 1.0, color: Colors.white),
                                        ),
                                        value: isnumbercaseAllowed.value,
                                        onChanged: (value) => {
                                              isnumbercaseAllowed.value =
                                                  value!,
                                              generatedPassword.value =
                                                  generatePassoword(
                                                      sliderValue.value.toInt(),
                                                      isuppercaseAllowed.value,
                                                      islowercaseAllowed.value,
                                                      isnumbercaseAllowed.value,
                                                      issymbolcaseAllowed.value,
                                                      context)
                                            }),
                                    Text(
                                      "Numbers",
                                      style: TextStyle(
                                          fontFamily: 'Poppins-Regular',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp,
                                          color: Colors.white),
                                    ),
                                  ],
                                );
                              }),
                          ValueListenableBuilder(
                              valueListenable: issymbolcaseAllowed,
                              builder: (context, value, _) {
                                return Row(
                                  children: [
                                    Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        side:
                                            MaterialStateBorderSide.resolveWith(
                                          (states) => const BorderSide(
                                              width: 1.0, color: Colors.white),
                                        ),
                                        value: issymbolcaseAllowed.value,
                                        onChanged: (value) => {
                                              issymbolcaseAllowed.value = value!
                                            }),
                                    Text(
                                      "Symbols",
                                      style: TextStyle(
                                          fontFamily: 'Poppins-Regular',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp,
                                          color: Colors.white),
                                    ),
                                  ],
                                );
                              }),
                        ],
                      )
                    ],
                  );
                }),
            const Expanded(child: SizedBox()),
            BottomButton(
                text: "Copy to Clipboard",
                onTap: () {
                  if (generatedPassword.value ==
                      "Move The Slider to generate") {
                    showError(context, "Generate a Password");
                  } else {
                    Clipboard.setData(
                        ClipboardData(text: generatedPassword.value));
                    showSuccess(context, "Password Copied");
                  }
                })
          ],
        )),
      ),
    );
  }
}
