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
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
        padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 4.w),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blue.withOpacity(0.2),
        ),
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
                style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    color: Colors.white),
              ),
              Text(
                widget.userName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: Colors.grey.shade500),
              )
            ]),
            const Expanded(child: SizedBox()),
            GestureDetector(
                onTap: () {},
                child: const Icon(Icons.copy, color: Colors.white)),
            //  SizedBox(
            //   width: 4.w,
            // ),
            //           const Icon(Icons.dots, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
