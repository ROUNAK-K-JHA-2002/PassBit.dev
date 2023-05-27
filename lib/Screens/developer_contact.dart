import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Services/meme_generator.dart';
import '../helpers.dart';

class DevContact extends StatefulWidget {
  const DevContact({super.key});

  @override
  State<DevContact> createState() => _DevContactState();
}

class _DevContactState extends State<DevContact> {
  Map<String, dynamic> meme = {};
  @override
  void initState() {
    super.initState();
    generateMeme().then((value) => {
          setState(
            () {
              meme = value;
            },
          )
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken),
                image: bgImage,
                fit: BoxFit.cover)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
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
                      "Developer Info",
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
              Container(
                margin: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 5.w),
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/profileImg.jpeg"),
                            radius: 55,
                          ),
                          SizedBox(
                            width: 1.h,
                          ),
                          Text(
                            "Hi,\n I'm Rounak Kumar Jha ,\n Full Stack Web and \nAndroid Developer from India",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.white.withOpacity(0.5),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Reach me Out :",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 2.w,
                            ),
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/providerIcons/Github.png"),
                              radius: 20,
                            ),
                            const Expanded(child: SizedBox()),
                            InkWell(
                                child: Text(
                                  "ROUNAK-K-JHA-2002",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
                                ),
                                onTap: () => launchUrl(Uri.parse(
                                    'https://github.com/ROUNAK-K-JHA-2002'))),
                            SizedBox(
                              width: 2.w,
                            ),
                          ]),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 2.w,
                            ),
                            const CircleAvatar(
                              backgroundImage: AssetImage(
                                  "assets/providerIcons/Linkedin.png"),
                              radius: 20,
                            ),
                            const Expanded(child: SizedBox()),
                            InkWell(
                                child: Text(
                                  "rounak-kumar-jha-a54437228",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
                                ),
                                onTap: () => launchUrl(Uri.parse(
                                    'https://www.linkedin.com/in/rounak-kumar-jha-a54437228/'))),
                            SizedBox(
                              width: 2.w,
                            ),
                          ]),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 2.w,
                            ),
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/providerIcons/Google.png"),
                              radius: 20,
                            ),
                            const Expanded(child: SizedBox()),
                            InkWell(
                                child: Text(
                                  "developer.dextrix@gmail.com",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
                                ),
                                onTap: () => launchUrl(
                                    Uri.parse('developer.dextrix@gmail.com'))),
                            SizedBox(
                              width: 2.w,
                            ),
                          ]),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 2.w,
                            ),
                            const CircleAvatar(
                              backgroundImage: AssetImage(
                                  "assets/providerIcons/Instagram.png"),
                              radius: 20,
                            ),
                            const Expanded(child: SizedBox()),
                            InkWell(
                                child: Text(
                                  "__rounak.k.jha_8683__",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
                                ),
                                onTap: () => launchUrl(Uri.parse(
                                    'https://www.instagram.com/__rounak.k.jha_8683__'))),
                            SizedBox(
                              width: 2.w,
                            ),
                          ]),
                    ]),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                meme['title'] ?? "",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 1.h,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 30.h,
                  width: 70.w,
                  child: CachedNetworkImage(
                    imageUrl: meme['url'] ?? "",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fitWidth,
                            colorFilter: const ColorFilter.mode(
                                Colors.red, BlendMode.colorBurn)),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Text(
                      "Loading...",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
