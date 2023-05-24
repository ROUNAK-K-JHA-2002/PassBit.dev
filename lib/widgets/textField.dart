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
      child: TextFormField(
        onTap: widget.onTap,
        controller: widget.controller,
        keyboardType: widget.textInputType ?? TextInputType.text,
        maxLines: 1,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 17.sp, fontFamily: 'Montserrat', letterSpacing: 2),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 2.w),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          filled: true,
          hintText: "  ${widget.hintText}",
          hintStyle: TextStyle(
            fontSize: 16.sp,
            fontFamily: 'Montserrat',
          ),
          fillColor: Colors.grey.shade200,
        ),
      ),
    );
  }
}
