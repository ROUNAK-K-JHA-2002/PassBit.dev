import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passwordmanager/Screens/LoginScreen.dart';
import 'package:passwordmanager/Screens/SplashScreen.dart';
import 'package:passwordmanager/Screens/home.dart';
import 'package:passwordmanager/Services/LocalAuth.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'Services/User.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _auth = FirebaseAuth.instance;

  Widget route = const Login();
  bool isallowed = false;
  @override
  void initState() {
    super.initState();
    // handleInitialNavigation();
  }

  // Future<void> handleInitialNavigation() async {
  //   final isAuth = await LocalAuth().authenticate();
  //   readBiometricSetting().then((value) {
  //     setState(() {
  //       isallowed = value;
  //     });
  //   });
  //   if (_auth.currentUser == null) {
  //     setState(() {
  //       route = const Login();
  //     });
  //   } else if (isallowed) {
  //     setState(() {
  //       route = const HomePage();
  //     });
  //   } else if (isAuth) {
  //     route = const HomePage();
  //   } else {
  //     SystemNavigator.pop();
  //   }
  // }

  //calling Firebase Auth
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: _auth.currentUser == null ? Login() : HomePage(),
      );
    });
  }
}
