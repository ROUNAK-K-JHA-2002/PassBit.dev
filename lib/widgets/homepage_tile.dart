import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePageTile extends StatefulWidget {
  final String text;
  final String userName;
  final String imageUrl;
  const HomePageTile(
      {super.key,
      required this.text,
      required this.userName,
      required this.imageUrl});

  @override
  State<HomePageTile> createState() => _HomePageTileState();
}

class _HomePageTileState extends State<HomePageTile> {
  @override
  Widget build(BuildContext context) {
    CachedNetworkImage(
      imageUrl: widget.imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 5.w),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade100.withOpacity(0.2),
                offset: const Offset(5, 5),
                blurRadius: 15,
                spreadRadius: 1)
          ]),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(widget.imageUrl),
          ),
          SizedBox(
            width: 4.w,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              widget.text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            Text(
              widget.userName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  color: Colors.grey.shade700),
            )
          ]),
          const Expanded(child: SizedBox()),
          const Icon(
            Icons.copy,
          ),
        ],
      ),
    );
  }
}
