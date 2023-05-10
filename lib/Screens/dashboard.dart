import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passwordmanager/widgets/homepageTile.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

final List<ChartData> chartData = [
  ChartData('Calories', 25, Colors.blue),
  ChartData('Heart Rate', 38, Colors.green),
  ChartData('Steps', 34, Colors.red),
];

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 10.h,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Hello,\n${FirebaseAuth.instance.currentUser!.displayName}",
                    style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.sp)),
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
                Container(
                    height: 25.h,
                    child: SfCircularChart(
                        margin: EdgeInsets.zero,
                        series: <CircularSeries>[
                          RadialBarSeries<ChartData, String>(
                              useSeriesColor: true,
                              trackOpacity: 0.2,
                              radius: '100%',
                              gap: '5%',
                              dataSource: chartData,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y,
                              pointColorMapper: (ChartData data, _) =>
                                  data.color,
                              cornerStyle: CornerStyle.bothCurve)
                        ])),
                const Expanded(child: SizedBox()),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Monitoring Account",
                          style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.sp)),
                        ),
                        Text(
                          " ${FirebaseAuth.instance.currentUser!.email}",
                          style: GoogleFonts.robotoSlab(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp)),
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
