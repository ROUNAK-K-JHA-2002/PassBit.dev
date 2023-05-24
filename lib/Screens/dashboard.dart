import 'package:flutter/material.dart';
import 'package:passwordmanager/Services/User.dart';
import 'package:passwordmanager/widgets/homepage_tile.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? userName;
  @override
  initState() {
    super.initState();
    checkUserName();
  }

  void checkUserName() async {
    dynamic result = await getUserName();

    setState(() {
      userName = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 10.h,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Hello,\n $userName",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.notifications_active_rounded)
                ]),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(children: [
                const Expanded(child: SizedBox()),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Monitoring Account",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22.sp),
                        ),
                        Text(
                          "$userName",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16.sp),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ]),
                ),
                const SizedBox(
                  height: 20,
                )
              ]),
            ),
          ),
          Container(
            height: 30.h,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 235, 202, 213),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 255, 233, 182),
                Color.fromARGB(255, 252, 215, 246)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      HomePageTile(
                        text: "Passwords Added",
                        number: '23',
                      ),
                      HomePageTile(
                        text: "Passwords Added",
                        number: '48',
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      HomePageTile(
                        text: "Passwords Added",
                        number: '25',
                      ),
                      HomePageTile(
                        text: "Passwords Added",
                        number: '74',
                      )
                    ],
                  )
                ]),
          )
        ],
      )),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
