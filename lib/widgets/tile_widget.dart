import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class TileWidget extends StatefulWidget {
  final IconData icon;
  final String text;
  const TileWidget({super.key, required this.icon, required this.text});

  @override
  State<TileWidget> createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 5.w),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Icon(
          widget.icon,
          size: 22.sp,
          color: Colors.blueAccent,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          widget.text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold),
        ),
        const Expanded(child: SizedBox()),
        const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white,
        )
      ]),
    );
  }
}
