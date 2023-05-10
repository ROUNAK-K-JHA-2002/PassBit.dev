import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:passwordmanager/Screens/LoginScreen.dart';
import 'package:passwordmanager/Services/FirebaseServices.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("User Logged in"),
            MaterialButton(
              onPressed: () {
                FirebaseServices().signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              child: const Text("Sign Out"),
            )
          ],
        )),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: const Color.fromARGB(255, 77, 0, 184),
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 200),
              tabActiveBorder: Border.all(color: Colors.black.withOpacity(0.5)),
              tabBackgroundColor: const Color.fromARGB(177, 224, 224, 224),
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.add_circle,
                  text: 'Add',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.person_3_rounded,
                  text: 'Profile',
                ),
              ],
              selectedIndex: selectedIndex,
              onTabChange: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
