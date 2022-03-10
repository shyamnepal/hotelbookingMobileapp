// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hotelbooking/Login/home.dart';
import 'package:hotelbooking/pages/homepage.dart';
import 'package:hotelbooking/pages/roomList.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double height = 0;
  double width = 0;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    setState(() {
      height = MediaQuery.of(context).size.height;
      width = MediaQuery.of(context).size.width;
    });
  }

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202443),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * .1, right: width * .6),
              child: Text(
                'Welcome \nBack',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),

            //Text fields for login
            Padding(
              padding: EdgeInsets.only(
                  top: height * .08, left: width * .04, right: width * .04),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: usernameController,
                decoration: InputDecoration(
                  fillColor: Color(0xff242846),
                  filled: true,
                  hintText: 'user name',
                  hintStyle: const TextStyle(color: Colors.white, fontSize: 15),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Color(0xff202443), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Color(0xff202443), width: 2.0),
                  ),
                ),
              ),
            ),

            // Text field of password

            Padding(
              padding: EdgeInsets.only(
                  top: height * .04, left: width * .04, right: width * .04),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: passwordController,
                decoration: InputDecoration(
                  fillColor: Color(0xff242846),
                  filled: true,
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Colors.white, fontSize: 15),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Color(0xff202443), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Color(0xff202443), width: 2.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * .6, top: height * .02),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'forget password?',
                    style: TextStyle(color: Color(0xff40cd7d)),
                  )),
            ),

            SizedBox(
              height: height * .06,
            ),

            //login button

            SizedBox(
              width: width * .8,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  login();
                },
                child: const Text('login'),
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xff40cd7d),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),

            SizedBox(
              height: height * .1,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(text: 'new users? '),
              TextSpan(
                  text: "signup",
                  style: TextStyle(color: Color(0xff40cd7d)),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, '/usersignup');
                    })
            ])),
          ],
        ),
      )),
    );
  }

  Future<void> login() async {
    if (passwordController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse("http://10.0.2.2:8000/api/login/"),
          body: ({
            'username': usernameController.text,
            'password': passwordController.text
          }));
      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RoomList()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Credentails.")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Black Field NOt Allowed")));
    }
  }
}
