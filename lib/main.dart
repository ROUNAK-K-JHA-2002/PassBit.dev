import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passwordmanager/Screens/LoginScreen.dart';
import 'package:passwordmanager/Screens/home.dart';

import 'package:passwordmanager/Services/LocalAuth.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'Services/User.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isFirstUser = false;

  @override
  void initState() {
    super.initState();
    checkFirstUser();
  }

  void checkFirstUser() async {
    final bool result = await isFirstTimeUser();

    setState(() {
      isFirstUser = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: !isFirstUser ? const Login() : const HomePage(),
      );
    });
  }
}
