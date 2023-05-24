// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:passwordmanager/helpers.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextFieldContainer extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  final TextInputType? textInputType;
  final void Function()? onTap;
  const TextFieldContainer(
      {super.key,
      required this.controller,
      required this.hintText,
      this.textInputType,
      this.onTap});

  @override
  State<TextFieldContainer> createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      height: 6.h,
      child: TextFormField(
        onTap: widget.onTap,
        controller: widget.controller,
        keyboardType: widget.textInputType ?? TextInputType.text,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 17.sp, fontFamily: 'Montserrat', letterSpacing: 2),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            // borderSide: BorderSide(color: widget.borderColor),
          ),
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 16.sp,
            fontFamily: 'Montserrat',
            // color: widget.textColor,
          ),
          fillColor: Colors.grey.shade200,
        ),
      ),
    );
  }
}
