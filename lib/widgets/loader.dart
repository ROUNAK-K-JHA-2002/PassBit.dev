import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Loader extends StatefulWidget {
  final String text;
  final bool showLoading;
  const Loader({super.key, required this.text, required this.showLoading});

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  void initState() {
    super.initState();
    if (!widget.showLoading) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Log out'),
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1.h),
        child: Row(
          children: <Widget>[
            const CircularProgressIndicator(
              color: Colors.deepPurpleAccent,
            ),
            Text(widget.text),
          ],
        ),
      ),
    );
  }
}
