import 'package:flutter/material.dart';
import 'package:hotelbooking/Login/login.dart';
import 'package:hotelbooking/Login/user_signup.dart';
import 'package:hotelbooking/pages/homepage.dart';
import 'package:hotelbooking/pages/hotel_info.dart';
import 'package:hotelbooking/pages/viewhotelinfo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => Login(),
          '/usersignup': (context) => UserSignup(),
          '/homepage': (context) => HomePage(),
          '/hotelinformation': (context) => Hotel_info(),
          '/viewhotelinformation': (context) => ViewHotelInfo(),
        });
  }
}
