import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.pushNamed(context, "/onboarding"));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 150, left: 100),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('image/splashscreen.jpeg'))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                //insert images
                Icon(Icons.local_activity),
                Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: Text(
                    "Book the Best Hotel For You",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
