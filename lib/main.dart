import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:passwordmanager/Screens/dashboard.dart';
import 'package:passwordmanager/Screens/login.dart';
import 'package:passwordmanager/Screens/home.dart';
import 'package:passwordmanager/helpers.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'Services/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
    // precacheImage(AssetImage(bgImage), context);
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FirebaseAuth.instance.currentUser == null
            ? const Login()
            : const HomePage(),
      );
    });
  }
}
