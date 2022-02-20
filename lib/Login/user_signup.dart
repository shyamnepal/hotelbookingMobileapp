// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hotelbooking/Model/usersignup.dart';
import 'package:http/http.dart' as http;

class UserSignup extends StatefulWidget {
  const UserSignup({Key? key}) : super(key: key);

  @override
  _UserSignupState createState() => _UserSignupState();
}

class _UserSignupState extends State<UserSignup> {
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

  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202443),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * .08, right: width * .6),
                child: Text(
                  'Signup',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),

              //text Fields of last Name
              Padding(
                padding: EdgeInsets.only(
                    top: height * .04, left: width * .04, right: width * .04),
                child: TextFormField(
                  controller: _firstname,
                  decoration: InputDecoration(
                    fillColor: Color(0xff242846),
                    filled: true,
                    hintText: 'First Name',
                    hintStyle:
                        const TextStyle(color: Colors.white, fontSize: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: Color(0xff202443), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: Color(0xff202443), width: 2.0),
                    ),
                  ),
                ),
              ),

              //text Fields of last Name
              Padding(
                padding: EdgeInsets.only(
                    top: height * .04, left: width * .04, right: width * .04),
                child: TextFormField(
                  controller: _lastName,
                  decoration: InputDecoration(
                    fillColor: Color(0xff242846),
                    filled: true,
                    hintText: 'Last Name',
                    hintStyle:
                        const TextStyle(color: Colors.white, fontSize: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: Color(0xff202443), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: Color(0xff202443), width: 2.0),
                    ),
                  ),
                ),
              ),

              //text Fields of Eamil
              Padding(
                padding: EdgeInsets.only(
                    top: height * .04, left: width * .04, right: width * .04),
                child: TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    fillColor: Color(0xff242846),
                    filled: true,
                    hintText: 'E-mail',
                    hintStyle:
                        const TextStyle(color: Colors.white, fontSize: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: Color(0xff202443), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: Color(0xff202443), width: 2.0),
                    ),
                  ),
                ),
              ),

              //text Fields of Password
              Padding(
                padding: EdgeInsets.only(
                    top: height * .04, left: width * .04, right: width * .04),
                child: TextFormField(
                  controller: _password,
                  decoration: InputDecoration(
                    fillColor: Color(0xff242846),
                    filled: true,
                    hintText: 'Password',
                    hintStyle:
                        const TextStyle(color: Colors.white, fontSize: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: Color(0xff202443), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: Color(0xff202443), width: 2.0),
                    ),
                  ),
                ),
              ),

              //text Fields of Password
              Padding(
                padding: EdgeInsets.only(
                    top: height * .04, left: width * .04, right: width * .04),
                child: TextFormField(
                  controller: _confirmPassword,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    fillColor: Color(0xff242846),
                    filled: true,
                    hintText: 'Confirm Password',
                    hintStyle:
                        const TextStyle(color: Colors.white, fontSize: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: Color(0xff202443), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: Color(0xff202443), width: 2.0),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              //Signup button

              SizedBox(
                width: width * .8,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    RegisterProduct();
                  },
                  child: const Text('Sign Up'),
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xff40cd7d),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: 'Already Have a account? '),
                TextSpan(
                    text: "Login",
                    style: TextStyle(color: Color(0xff40cd7d)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, '/login');
                      })
              ])),
            ],
          ),
        ),
      ),
    );
  }

  Future RegisterProduct() async {
    String APIURL = "http://192.168.1.14:8000/api/register/";
    // final Map mappeddata = {
    //   'name': _name.text,
    //   'category': _category.text,
    //   'price': _price.text,
    //   'description': _Description.text,
    //   'stars': _status.text,
    // };
    UserSignupModel model = new UserSignupModel(
      firstName: _firstname.text,
      lastName: _lastName.text,
      email: _email.text,
      password: _password.text,
    );

    http.Response response =
        await http.post(Uri.parse(APIURL), body: model.toJson());
    if (response.statusCode == 200) {
      print("value add");
    } else {
      print("exception occor $response");
      print(response.statusCode);
    }
  }
}
