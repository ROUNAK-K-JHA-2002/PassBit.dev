import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePageTile extends StatefulWidget {
  final String text;
  final String number;
  const HomePageTile({super.key, required this.text, required this.number});

  @override
  State<HomePageTile> createState() => _HomePageTileState();
}

class _HomePageTileState extends State<HomePageTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      width: 40.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                offset: Offset(5, 5),
                blurRadius: 15,
                spreadRadius: 1)
          ]),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          widget.number,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        Text(
          widget.text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
              color: Colors.grey.shade700),
        )
      ]),
    );
  }
}
